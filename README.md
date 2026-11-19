# videomaker: Creador de videos para Claude Code

Plugin de Claude Code para crear videos y reels con un sistema por fases: guion y gancho, estética (catálogo de 108), construcción parte por parte en HTML con [HyperFrames](https://github.com/heygen-com/hyperframes) y GSAP, vista previa en la web y MP4 solo cuando apruebas la versión final.

## Instalar

Necesitas [Claude Code](https://code.claude.com), git y Node.js. Recomendado: ffmpeg, uv y yt-dlp.

Dentro de Claude Code:

```
/plugin marketplace add https://github.com/JoseD100801/videomaker.git
/plugin install videomaker@videomaker
```

Eso instala el plugin y, como dependencias, hyperframes y gsap-skills. Después, una sola vez por equipo:

```
/videomaker:preparar --carpeta
```

Instala las skills que no vienen como plugin (animación de Emil Kowalski, huashu-design, svg-animations, svg-animation, motion-design, last30days, claude-video-vision), clona claude-banana con su arreglo y crea la carpeta de trabajo `~/Desktop/makervideo` (o `~/Escritorio/makervideo`). Para otra carpeta: `/videomaker:preparar --carpeta ~/videos/makervideo`.

Extras opcionales, solo si los vas a usar:

```
/plugin install 3dviz-pro-max@videomaker   # objetos 3D (three.js)
/plugin install anatomy@videomaker         # figuras isométricas que explican cómo funciona algo
```

Después cierra y vuelve a abrir Claude Code, entra a tu carpeta makervideo y pide un video.

## Actualizar

```
/plugin marketplace update videomaker
```

Las reglas del sistema viven en la skill `creador-de-videos`, así que cada actualización llega sola a todos los equipos. Vuelve a correr `/videomaker:preparar` si el README avisa de skills nuevas fuera del plugin.

### Si ya tenías el paquete V1 a V3 instalado

```
/videomaker:preparar --migrar
```

Mueve a `makervideo/respaldo/<fecha>/` las copias viejas de skills que ahora trae el plugin (catalogo-esteticas, el envoltorio de claude-banana, hyperframes, gsap, anatomy, 3dviz) y cambia el `CLAUDE.md` largo de la carpeta por uno corto que apunta al plugin. No borra nada. Tus reels de `catalogo-videos/` y tus proyectos quedan donde están.

## En la nube (Claude Code en la web)

Este repo trae `.claude/settings.json`, que registra el marketplace y activa el plugin en cualquier sesión que abra este repo. Para otro repo, copia ese archivo a su `.claude/settings.json`. En una sesión nueva corre `/videomaker:preparar` para las skills que no son plugin (el contenedor de la nube se borra al terminar).

## Qué trae

| Parte | Qué es |
| --- | --- |
| `creador-de-videos` (skill) | Las reglas del sistema: fases, gancho, estética, las 5 instrucciones de animación, procedimiento por partes, transiciones, voz, subtítulos y revisión final. Incluye las fichas del Catálogo de videoestéticas en `referencias-video/` |
| `catalogo-esteticas` (skill) | 108 estéticas en 12 familias, una ficha por estética. El catálogo visual está en línea |
| `claude-banana` (skill) | Envoltorio para generar prompts e imágenes con Nano Banana usando [Hainrixz/claude-banana](https://github.com/Hainrixz/claude-banana) |
| `/videomaker:preparar` | Instala o repara lo que vive fuera del plugin |
| `/videomaker:nuevo-proyecto` | Crea la carpeta de un video desde la plantilla y arranca la fase 1 |

Lo que configuras tú (claves de Gemini y Apify, tus gemas de Gemini) está en [LO-QUE-PONES-TU.md](LO-QUE-PONES-TU.md). Lo que viene de otros autores está en [TERCEROS.md](TERCEROS.md).

## Qué no trae a propósito

- Los reels de referencia del Catálogo de videoestéticas: son de otras cuentas, así que solo van sus fichas de análisis. Los videos viven en `catalogo-videos/` de tu carpeta makervideo.
- prompt-master: es de otro autor. Si la tienes instalada, el sistema la usa; si no, sigue sin ella.
- Claves, cuentas o gemas de nadie.
