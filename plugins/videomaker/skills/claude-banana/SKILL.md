---
name: claude-banana
description: Crea prompts de imagen profesionales (fórmula de 7 ingredientes, 9 modos, 70+ técnicas) para Nano Banana / Gemini y, si hay cuota, genera o edita la imagen. Úsala en la fase de diseño de un video cuando haga falta una imagen fija original - fondo, escena, producto, personaje, textura, portada o miniatura - en vez de usar stock genérico.
---

# Claude Banana (envoltorio)

El proyecto original (github.com/Hainrixz/claude-banana, licencia MIT) vive en `~/.claude/plugins/claude-banana`; si no está, pide correr `/videomaker:preparar` (abreviado BANANA abajo). No es un plugin de Claude Code: es un agente más una base de conocimiento, así que esta skill lo conecta.

## Cómo trabajar

1. Lee `BANANA/.claude/agents/prompt-architect.md` y sigue sus fases (Intake, preguntas, composición, entrega). Las rutas `knowledge/...` y `templates/examples/...` que menciona son relativas a BANANA.
2. Antes de escribir el prompt, pregunta lo mínimo que falte: para qué escena del video es, formato (9:16 reels, 16:9 YouTube, 1:1), ambiente o emoción, y si hay marca (colores, logo, estilo). Si existe un preset en `BANANA/presets/`, úsalo.
3. Evita la estética genérica de IA: nada de piel plástica, simetría perfecta, brillos excesivos, degradados morados ni textos inventados dentro de la imagen. Pide imperfecciones reales (grano, textura, luz natural, encuadres de fotógrafo). Revisa `BANANA/knowledge/anti-patterns.md`.
4. Entrega siempre el prompt final listo para copiar.

## Generar la imagen directamente

Usa uv (así no hace falta instalar Python aparte). Ejecuta desde BANANA, sin instalar google-generativeai (su ruta falla; la ruta directa es la buena):

```
cd ~/.claude/plugins/claude-banana
uv run --python 3.12 --with pillow --with python-dotenv python scripts/generate.py --prompt "..." --aspect 9:16 --size 2K --output <carpeta del proyecto>/img/escena-01.png
```

Editar una imagen existente: `scripts/edit.py --image <archivo> --instruction "..."` con el mismo `uv run`.

La clave se toma de la variable de entorno GEMINI_API_KEY. Si responde 429 con "limit: 0", la cuenta de Google AI Studio no tiene facturación activa para el modelo de imagen: avisa que puede activar la facturación en aistudio.google.com o pegar el prompt en su gema de Gemini (Nano Banana Pro) y traer la imagen.

Nota: `/videomaker:preparar` aplica un arreglo a `scripts/generate.py` y `scripts/edit.py` para enviar `aspectRatio`/`imageSize` dentro de `generationConfig.imageConfig` (el original los ponía en un campo que la API rechaza). Un `git pull` puede deshacer ese arreglo; se vuelve a aplicar con `git apply` del archivo `parches/claude-banana-imageconfig.patch` del plugin (o corriendo de nuevo `/videomaker:preparar`).
