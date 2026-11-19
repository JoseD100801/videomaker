---
description: Instala o repara lo que el plugin videomaker necesita fuera del plugin (skills de animación, claude-banana, claude-video-vision) y, si se pide, la carpeta de trabajo makervideo.
argument-hint: "[--carpeta RUTA] [--migrar] [--sin-mcp]"
---

Prepara este equipo para el Creador de videos.

1. Explica en dos líneas qué va a hacer: instalar en `~/.claude/skills` las skills que no son plugins (Emil, huashu-design, svg-animations, svg-animation, motion-design, last30days, claude-video-vision), clonar claude-banana en `~/.claude/plugins/claude-banana` con su arreglo, y apagar la telemetría de hyperframes. No borra nada.
2. Si los argumentos incluyen `--migrar`, avisa antes qué va a mover a `<carpeta>/respaldo/<fecha>/`: las copias viejas de skills que ahora trae el plugin y el CLAUDE.md largo de la carpeta (lo cambia por uno corto que apunta al plugin). Pide confirmación antes de correrlo.
3. Corre: `bash "${CLAUDE_PLUGIN_ROOT}/scripts/preparar.sh" $ARGUMENTS`
4. Resume el resultado: lo que quedó, lo que falló con su arreglo, y si falta GEMINI_API_KEY o APIFY_TOKEN (nunca pidas que pegue claves en el chat). Recuerda reiniciar Claude Code para que carguen las skills nuevas.
