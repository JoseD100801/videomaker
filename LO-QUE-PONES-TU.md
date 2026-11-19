# Lo que pones tú

El plugin no trae claves, cuentas ni gemas de nadie. Cada persona configura lo suyo.

## 1. Clave de Gemini (GEMINI_API_KEY)

La usan claude-video-vision (para entender videos de referencia) y claude-banana (para generar imágenes).

1. Entra a aistudio.google.com con tu cuenta de Google y crea una API key.
2. Guárdala como variable de entorno llamada `GEMINI_API_KEY`:
   - Windows, a mano (PowerShell): `[Environment]::SetEnvironmentVariable("GEMINI_API_KEY", "TU-CLAVE", "User")`
   - Mac: agrega `export GEMINI_API_KEY="TU-CLAVE"` al final de `~/.zshrc`. Linux: en `~/.bashrc`.
3. Cierra y abre la terminal y Claude Code.

Para que claude-banana genere imágenes directamente, tu proyecto de Google AI Studio necesita facturación activa. Sin facturación, Claude te entrega el prompt para tu gema de Gemini.

## 2. Token de Apify (APIFY_TOKEN)

Lo usa el MCP de Apify para ver ejemplos reales en redes y buscar más referencias en Pinterest (cuesta centavos por búsqueda; Claude avisa antes de gastar).

1. Crea una cuenta en apify.com y copia tu token en Settings, API & Integrations.
2. Guárdalo como variable de entorno `APIFY_TOKEN`, igual que la clave de Gemini.

## 3. Tu gema de Gemini para imágenes (Nano Banana Pro)

Claude te entrega los prompts de imágenes y fondos para que los pegues en esta gema.

1. Entra a gemini.google.com, abre Gems y crea una nueva, por ejemplo "Generador de imágenes".
2. Instrucciones sugeridas: "Generas imágenes con Nano Banana Pro a partir del prompt que te pego. Respeta el formato pedido (9:16, 16:9 o 1:1). Estilo simple, limpio, con texturas reales y sin aspecto de IA. Si pido fondo, entrégalo sin personajes ni textos; si pido un elemento suelto, sobre fondo liso o transparente."
3. Elige el modelo de imagen Nano Banana Pro cuando esté disponible en tu cuenta.

## 4. Tu gema de personajes

Genera la ficha de cada personaje (cabeza en varios ángulos y cuerpo completo de frente, perfil y espalda). Las fichas son la fuente de verdad: Claude mantiene al personaje idéntico en todas las escenas.

1. Crea otra gema, por ejemplo "Generador de personajes".
2. Instrucciones sugeridas: "Creas hojas de personaje (character sheet) sobre fondo blanco: arriba la cabeza en 4 ángulos (frente, tres cuartos, perfil y espalda), abajo el cuerpo completo de frente, perfil y espalda. Mismo rostro, proporciones, vestuario y paleta en todas las vistas. Estilo limpio, sin texto ni marcas de agua."
3. Si tienes una imagen de referencia de cómo debe verse la hoja, súbela como conocimiento de la gema.

Cuando Claude te pida las fichas y aún no existan, te dará el prompt de cada personaje listo para esta gema.

## 5. Opcional

- **Catálogo de estéticas en línea:** el catálogo visual es un link. Quien te pasó el plugin tiene que compartírtelo (en el catálogo: Compartir, cualquiera con el link). Las 108 estéticas en texto y sus fichas ya vienen en la skill catalogo-esteticas.
- **Herramientas de video con IA** (Higgsfield, Veo, Kling): si las usas, ten tu cuenta lista; Claude te da el prompt y eligen juntos la herramienta.
