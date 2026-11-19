#!/usr/bin/env bash
# Prepara el equipo para el plugin videomaker (Mac, Linux y Windows con Git Bash).
# Instala lo que no llega como plugin y, si se pide, la carpeta de trabajo.
# Uso: bash preparar.sh [--carpeta RUTA] [--migrar] [--sin-mcp]
#   --carpeta RUTA  crea o completa la carpeta de trabajo (por defecto ~/Desktop/makervideo,
#                   o ~/Escritorio/makervideo si no hay Desktop)
#   --migrar        mueve a <carpeta>/respaldo/<fecha>/ las copias viejas de skills que ahora
#                   trae el plugin (para que no haya duplicados) y cambia el CLAUDE.md largo
#                   de la carpeta por uno corto que apunta al plugin
#   --sin-mcp       no registra el MCP de Apify
# No borra nada: lo que ya existe se deja como está (salvo lo que --migrar mueve a respaldo).

set -u
PLUGIN="$(cd "$(dirname "$0")/.." && pwd)"
SKILLS="$HOME/.claude/skills"
BANANA="$HOME/.claude/plugins/claude-banana"
CARPETA=""; HACER_CARPETA=0; MIGRAR=0; CON_MCP=1
while [ $# -gt 0 ]; do
  case "$1" in
    --carpeta) HACER_CARPETA=1; if [ $# -gt 1 ] && [ "${2#--}" = "$2" ]; then CARPETA="$2"; shift; fi; shift ;;
    --migrar) MIGRAR=1; HACER_CARPETA=1; shift ;;
    --sin-mcp) CON_MCP=0; shift ;;
    *) echo "Opción desconocida: $1"; exit 1 ;;
  esac
done
if [ -z "$CARPETA" ]; then
  CARPETA="$HOME/Desktop/makervideo"
  [ ! -d "$HOME/Desktop" ] && [ -d "$HOME/Escritorio" ] && CARPETA="$HOME/Escritorio/makervideo"
fi
FALLAS=(); LOG="$(mktemp 2>/dev/null || echo /tmp/preparar-videomaker.log)"
ok()    { printf '  OK %s\n' "$1"; }
salto() { printf '  -- %s\n' "$1"; }
falla() { printf '  XX %s\n' "$1"; FALLAS+=("$1"); }
titulo(){ printf '\n%s\n' "$1"; }

titulo "1. Programas del equipo"
for c in git node npx; do
  if command -v "$c" >/dev/null 2>&1; then ok "$c"; else falla "Falta $c (ver README del plugin)"; fi
done
if ! command -v git >/dev/null 2>&1 || ! command -v npx >/dev/null 2>&1; then echo "Sin git y Node.js no se puede seguir."; exit 1; fi
for c in uv ffmpeg yt-dlp; do
  if command -v "$c" >/dev/null 2>&1; then ok "$c"; else
    case "$c" in
      uv)     salto "Falta uv (lo usan last30days y claude-banana)" ;;
      ffmpeg) salto "Falta ffmpeg (lo usan claude-video-vision y el render de hyperframes)" ;;
      yt-dlp) salto "Falta yt-dlp (opcional, para links de YouTube)" ;;
    esac
  fi
done
mkdir -p "$SKILLS" "$(dirname "$BANANA")"

titulo "2. Skills que se clonan desde GitHub"
clonar() { # repo carpeta
  if [ -e "$2" ]; then salto "$(basename "$2") ya existe"; return; fi
  if git clone --depth 1 -q "https://github.com/$1.git" "$2" 2>>"$LOG"; then ok "$(basename "$2") ($1)"; else falla "No pude clonar $1 (detalle en $LOG)"; fi
}
clonar jordanrendric/claude-video-vision "$SKILLS/claude-video-vision"
clonar mvanhorn/last30days-skill        "$SKILLS/last30days"

titulo "3. Skills que se instalan con 'npx skills'"
instalar_skill() { # repo skill...
  local repo="$1"; shift; local faltan=() args=()
  for s in "$@"; do if [ -e "$SKILLS/$s" ]; then salto "$s ya existe"; else faltan+=("$s"); fi; done
  [ ${#faltan[@]} -eq 0 ] && return
  for s in "${faltan[@]}"; do args+=(-s "$s"); done
  if (cd "$HOME" && npx -y skills@latest add "$repo" -g -a claude-code -y --copy "${args[@]}" >>"$LOG" 2>&1); then
    for s in "${faltan[@]}"; do if [ -e "$SKILLS/$s" ]; then ok "$s ($repo)"; else falla "$s no quedó instalada ($repo)"; fi; done
  else falla "Falló 'npx skills add $repo' (detalle en $LOG)"; fi
}
instalar_skill emilkowalski/skill animate animation-performance animation-vocabulary apple-design emil-design-eng review-animations
instalar_skill alchaincyf/huashu-design huashu-design
instalar_skill supermemoryai/skills svg-animations
instalar_skill iart-ai/web-animation-skills svg-animation
instalar_skill LottieFiles/motion-design-skill motion-design

titulo "4. claude-banana (imágenes con Nano Banana)"
if [ -e "$BANANA" ]; then salto "claude-banana ya existe"
elif git clone -q https://github.com/Hainrixz/claude-banana.git "$BANANA" 2>>"$LOG"; then ok "claude-banana clonado en $BANANA"
else falla "No pude clonar claude-banana"; fi
if [ -d "$BANANA/.git" ]; then
  if git -C "$BANANA" apply --check "$PLUGIN/parches/claude-banana-imageconfig.patch" 2>/dev/null; then
    git -C "$BANANA" apply "$PLUGIN/parches/claude-banana-imageconfig.patch" && ok "arreglo de imageConfig aplicado"
  elif git -C "$BANANA" apply -R --check "$PLUGIN/parches/claude-banana-imageconfig.patch" 2>/dev/null; then salto "el arreglo de imageConfig ya estaba aplicado"
  else salto "no pude aplicar el arreglo de imageConfig (quizás el original ya lo trae)"; fi
fi

titulo "5. Configuración"
VV="$HOME/.claude-video-vision/config.json"
if [ -e "$VV" ]; then salto "claude-video-vision ya configurado"
else mkdir -p "$(dirname "$VV")" && printf '{\n  "backend": "gemini-api"\n}\n' > "$VV" && ok "claude-video-vision usa GEMINI_API_KEY"; fi
if (cd "$HOME" && npx -y hyperframes@latest telemetry disable >>"$LOG" 2>&1); then ok "telemetría de hyperframes apagada"; else salto "no pude apagar la telemetría de hyperframes (no es grave)"; fi

if [ $HACER_CARPETA -eq 1 ]; then
  titulo "6. Carpeta de trabajo: $CARPETA"
  mkdir -p "$CARPETA/proyectos/_plantilla"
  for d in img svg audio personajes referencias render; do mkdir -p "$CARPETA/proyectos/_plantilla/$d"; done
  ok "proyectos/_plantilla (img, svg, audio, personajes, referencias, render)"
  RESP="$CARPETA/respaldo/$(date +%Y-%m-%d_%H%M)"
  if [ $MIGRAR -eq 1 ]; then
    movidas=0
    for s in catalogo-esteticas claude-banana hyperframes hyperframes-cli hyperframes-registry media-use reverse-any-video style-sampling gsap-core gsap-timeline gsap-plugins gsap-utils gsap-performance gsap-react gsap-scrolltrigger gsap-frameworks anatomy 3dviz-pro-max; do
      if [ -e "$SKILLS/$s" ]; then mkdir -p "$RESP/skills-viejas" && mv "$SKILLS/$s" "$RESP/skills-viejas/$s" && movidas=$((movidas+1)); fi
    done
    if [ $movidas -gt 0 ]; then ok "$movidas skills viejas movidas a $RESP/skills-viejas (ahora llegan con el plugin)"; else salto "no había skills viejas duplicadas"; fi
    if [ -e "$CARPETA/CLAUDE.md" ] && ! grep -q "plugin videomaker" "$CARPETA/CLAUDE.md"; then
      mkdir -p "$RESP" && mv "$CARPETA/CLAUDE.md" "$RESP/CLAUDE.md" && ok "CLAUDE.md anterior guardado en $RESP"
    fi
  fi
  if [ -e "$CARPETA/CLAUDE.md" ]; then salto "CLAUDE.md ya existe (usa --migrar para cambiarlo por el corto que apunta al plugin)"
  else cp "$PLUGIN/plantilla/CLAUDE.md" "$CARPETA/CLAUDE.md" && ok "CLAUDE.md corto (las reglas viven en el plugin)"; fi
  ATAJO="$CARPETA/Abrir catálogo de estéticas.html"
  if [ ! -e "$ATAJO" ]; then
    U="https://claude.ai/artifact/GCqrfbi1rVVhR96gYwY8mf"
    printf '<!doctype html><meta charset="utf-8"><title>Catálogo de estéticas</title><meta http-equiv="refresh" content="0; url=%s"><p>Abriendo el catálogo… si no abre, entra a <a href="%s">%s</a></p>\n' "$U" "$U" "$U" > "$ATAJO" && ok "acceso directo al catálogo de estéticas"
  fi
  mkdir -p "$CARPETA/catalogo-videos" && ok "catalogo-videos/ (tus reels de referencia viven aquí, fuera del plugin)"
  if [ $CON_MCP -eq 1 ]; then
    if ! command -v claude >/dev/null 2>&1; then salto "sin el comando claude: registra Apify con 'claude mcp add apify --scope local -- npx -y @apify/actors-mcp-server' dentro de la carpeta"
    elif (cd "$CARPETA" && claude mcp get apify >/dev/null 2>&1); then salto "MCP de apify ya registrado"
    elif (cd "$CARPETA" && claude mcp add apify --scope local -- npx -y @apify/actors-mcp-server >/dev/null 2>&1); then ok "MCP de apify registrado (usa APIFY_TOKEN)"
    else falla "No pude registrar el MCP de apify"; fi
  fi
fi

titulo "Claves"
for v in GEMINI_API_KEY APIFY_TOKEN; do
  if [ -n "${!v:-}" ]; then ok "$v definida"; else salto "$v sin definir (ver LO-QUE-PONES-TU.md del repo del plugin)"; fi
done

titulo "Listo"
if [ ${#FALLAS[@]} -gt 0 ]; then
  echo "Hubo ${#FALLAS[@]} problema(s):"; for f in "${FALLAS[@]}"; do echo "  - $f"; done
  echo "Puedes volver a correrlo: lo que ya quedó instalado no se repite."; exit 1
fi
echo "Todo al día. Cierra y vuelve a abrir Claude Code para que carguen las skills nuevas."
