---
name: catalogo-esteticas
description: Catálogo de 108 estéticas visuales en 12 familias (retro, Y2K, glitch, editorial, hecho a mano, soñador, oscuro, folclórico, Para post y más) con descripción, paleta, combinaciones de color, letra sugerida, movimiento, análisis de sus referencias y briefs para recrear fotos. Úsala antes de diseñar cualquier video, post, imagen o pieza gráfica para definir la estética, y cuando la persona usuaria nombre una estética o pegue un texto que empiece con "Elegí del Catálogo de estéticas".
---

# Catálogo de estéticas

Catálogo visual (para que la persona usuaria elija viendo las referencias): https://claude.ai/artifact/GCqrfbi1rVVhR96gYwY8mf (en la carpeta makervideo hay un acceso directo: "Abrir catálogo de estéticas.html").
En texto, en esta carpeta:
- `esteticas.md`: las 108 estéticas, una línea cada una (id, cómo se ve, movimiento, paleta, letra, ejemplo, cuántas referencias y qué tienen en común sus fotos).
- `fichas/<id>.md`: la ficha completa de cada estética, con "Qué tienen en común las fotos" y los briefs de "Recrear una foto". Lee la ficha de la estética elegida antes de diseñar.

Cada ficha del catálogo tiene: referencias (fotos), "Qué tienen en común", "Recrear una foto" (un brief por foto, con botón "Copiar para recrear"), cómo se ve, movimiento, reel de origen, paleta, tres combinaciones de color (Clara, Oscura y una intensa) y letra sugerida (de DaFont con su licencia cuando la hay; si no, de Google Fonts).

## Antes de diseñar, pregunta siempre la estética

Ofrece tres caminos, con opciones cortas:
1. Tiene referencias propias: pide que las cargue (imágenes, videos, links, capturas) y analízalas.
2. Quiere elegir una estética: pásale el link del catálogo. Elige una (o dos para mezclar) y su combinación de color, y pega el texto del botón "Copiar para Claude". Si el botón "Paquete de imágenes" está activo, pídele que descargue el .zip de referencias y lo adjunte junto con el texto.
3. Que Claude decida: propone 2 o 3 estéticas de `esteticas.md` que sirvan al mensaje, cada una con una línea de por qué, y que elija.

Pregunta también qué quiere evitar. Para posts y carruseles, mira primero la familia "Para post" (Girly Post, iOS Post).

## Cuando pega "Elegí del Catálogo de estéticas"

El texto trae, por estética: principal o mezcla, combinación de color (fondo, texto y acento), letra sugerida, cómo se ve, movimiento, paleta, ejemplo, qué tienen en común las fotos y cuántas referencias hay.
1. Abre `fichas/<id>.md` de cada estética elegida (busca el id en `esteticas.md` por el nombre).
2. Análisis: parte de "Qué tienen en común" y complétalo con las fotos del paquete de imágenes si lo adjuntó (o pídele capturas de la ficha si no hay paquete). Saca lo que se repite: composición, tipografía, texturas, tratamiento de imagen, paleta y ritmo.
3. Usa la combinación de color que eligió como punto de partida (fondo, texto y un solo acento).
4. Confirma la letra antes de producir: la sugerida (si es de DaFont, revisa la licencia que trae la ficha antes de usarla en algo comercial) u otra.
5. Ofrece "Recrear una foto" solo como estructura: los briefs de la ficha ya vienen en el formato de prompt de la gema (FORMATO, ESCENA, ELEMENTOS, TEXTO, PALETA, TIPOGRAFÍA, ZONAS LIBRES, EVITAR). Tómalos como plantilla y cámbiales escena, personajes, textos y elementos por los del guion. Los marcadores [PERSONAJE], [TITULAR], [MARCA], etc. se llenan con lo del video (los personajes, según sus fichas). La foto de referencia no se reproduce.

## Cómo aplicar la estética elegida

- Usa su paleta como base: un color de fondo, uno de texto y un solo acento, salvo que la estética sea maximalista por naturaleza.
- Traduce "cómo se ve" en decisiones concretas: tipografía, texturas, composición y tipo de imagen.
- En video, usa la línea de movimiento como guía para transiciones y animaciones.
- Si mezcla dos estéticas, la primera manda (composición y paleta) y la segunda aporta un detalle (textura, tipografía o efecto).
- En prompts de imagen (claude-banana, Gemini), nombra la estética y describe sus rasgos; no te quedes solo con el nombre.
- Evita los rastros de IA: nada de degradados morados genéricos, íconos emoji ni tarjetas redondeadas por defecto si la estética no lo pide.

## Cómo leer las referencias

- Las referencias son solo eso, referencias: nunca se toman literalmente (ni para el gancho, ni para una escena) ni se usan como material.
- Analiza todas las fotos de la estética, no solo una. "Qué tienen en común" es el resumen ya hecho; úsalo y verifícalo con las fotos.
- Integra la estética a la idea y al guion ya planteados: piensa cómo llevar paleta, materiales, formas, composición, textura y tipografía a cada escena, y de ahí sale el prompt.
- Meta: simple y lo menos hecho con IA posible (pocos elementos, composición limpia, texturas reales, nada plástico ni recargado).
- Antes de producir pregunta: tipo de letra (la sugerida u otra) y paleta (la combinación elegida u otra).
- Si hacen falta imágenes o clips, entrega el prompt listo (estructurado con prompt-master, contenido con la fórmula de claude-banana, texto final en lenguaje natural para su gema generadora de imágenes en Gemini, con Nano Banana Pro). Para video, da el prompt y decide con la persona usuaria la herramienta (Higgsfield, Veo, Kling u otra).

## Más referencias de una estética

Si pide más referencias, búscalas en Pinterest con Apify (`silentflow/pinterest-scraper-ppr`, unos USD 0,002 por pin; avisa el costo si pasa de 50 pines). Muéstraselas en una página de revisión y agrega al catálogo publicado (mismo link) solo las que apruebe, siempre con el link al pin original y el autor.

Cómo está hecho el catálogo publicado (para actualizarlo): `index.html` con los datos dentro (`var DATA`: families, styles y refs; cada estilo con `an.common`, `an.pins` y `df`), `covers.json` con las portadas y `packs/<id>.wasm` con las fotos de cada estética. Al cambiar el catálogo, regenera `esteticas.md` y `fichas/` desde `DATA`.

## Fondos y elementos para animar

Ofrece siempre generar fondos y elementos que mejoren la animación, hilados en la estructura del video: cada elemento con una función en la coreografía, diseñado a partir del análisis de las referencias (nunca copiándolas). Fondos separados de los elementos; elementos sobre fondo limpio o transparente para animarlos por capas. Entrega los prompts para su gema de Gemini (Nano Banana Pro).

## Personajes y estética

Si el video tiene personajes, sus fichas (de la gema de personajes en Gemini) mandan sobre la estética: la estética se aplica al entorno, la luz y el tratamiento, pero el personaje se mantiene idéntico a su ficha en todas las escenas. En los briefs de "Recrear una foto", cada [PERSONAJE] se reemplaza por el personaje del video descrito según su ficha.

## Núcleo de calidad en video (siempre, con cualquier estética)

La estética define cómo se ve; estas 5 instrucciones definen cómo se mueve. Aplícalas siempre:
1. **Máscara de texto:** las palabras salen de detrás de un borde en vez de solo encenderse.
2. **Movimientos encadenados:** un elemento entra, empuja al siguiente y provoca una acción; una sola coreografía.
3. **Cámara que sigue:** la vista acompaña al objeto importante y guía la mirada.
4. **Objeto que se transforma:** un elemento se convierte en otro para introducir la siguiente escena, sin cortes bruscos.
5. **Sincronía con la voz:** cada palabra o elemento entra justo cuando se nombra en la narración.
