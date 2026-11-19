---
name: creador-de-videos
description: Sistema por fases para crear videos y reels (guion, gancho, estética, hyperframes HTML parte por parte con vista previa web, MP4 solo con aprobación, transiciones, voz y subtítulos). Úsala siempre que la persona usuaria pida un video, reel, promo o propuesta en video, o siga trabajando uno.
---

# Sistema para crear videos y reels

Instrucciones del sistema "Creador de videos" (plugin videomaker). Aplican siempre que la persona usuaria pida un video o reel. Se trabaja dentro de la carpeta de trabajo (makervideo) con Claude Code; si falta alguna skill de las que se nombran abajo, sugiere correr `/videomaker:preparar`.

Principio central: cada movimiento debe tener intención. Meta: contenido vistoso y original, sin rastros de IA.

## Lo primero: preguntar

Antes de hacer nada, pregunta qué vamos a hacer y trabaja por fases. Haz pocas preguntas a la vez (máximo 3), cada una con opciones cortas y tu recomendación marcada.

## Fase 1. Pre-idea y guion

Preguntas:
1. ¿Hay una idea de qué va el video o reel y de cómo lo queremos hacer?
2. ¿La intención es redes sociales o producción profesional?
3. ¿El video tiene personajes? Si sí: ¿quiénes son? Pide que cargue sus fichas de personaje (ver sección Personajes).

Escenario A, hay idea o referencia:
- Con idea: pide el prompt de estructura de la idea.
- Con video de referencia (archivo o link): míralo con claude-video-vision para entender qué busca.

Escenario B, no hay idea ni referencia:
- Pregunta la temática e investígala con last30days.

En ambos escenarios, arma el prompt del video con hyperframes.

Guion según intención:
- Redes: mantén el guion y muestra cómo quedaría la idea usando Apify (ejemplos reales de contenido parecido).
- Profesional: Gancho -> Presentación -> Contenido neto del video -> Visión hacia el futuro -> Cierre.

## Personajes

El diseño de personajes es parte de la esencia del video.
- Pregunta siempre si el video tiene personajes y quiénes son.
- Pide que cargue la ficha de cada personaje: cabeza en varios ángulos y cuerpo completo de frente, perfil y espalda. Las genera su gema generadora de personajes en Gemini.
- Si un personaje aún no tiene ficha, ofrécele el prompt para generarla en esa gema.
- Las fichas sí son material del video (a diferencia de las referencias de estética) y son la fuente de verdad: el personaje debe verse idéntico en todas las escenas (rasgos, ropa, colores, proporciones).
- Cada prompt de imagen o video donde aparezca un personaje debe describirlo según su ficha y pedir que se respete la ficha adjunta.

## Fase 2. El video

Arranca cuando el guion, o al menos la idea base, está escrito y más o menos fijo.

### 2.1 Diseño gráfico y recopilación de elementos

Preguntas antes de diseñar:
1. Formato y duración: 9:16 reel, 16:9 o 1:1; cuántos segundos.
2. Personalidad del movimiento: juguetón, premium, corporativo o enérgico (son los 4 arquetipos de la skill motion-design; elige uno por video y mantenlo).
3. Marca: ¿hay logo, colores, tipografías, fotos o videos propios? Pide los archivos; no los inventes.
   Personajes: confirma que están cargadas las fichas de todos los personajes del guion.
4. Estética, siempre antes de huashu-design. Ofrece tres caminos:
   a. Tiene referencias propias: pide que las cargue (imágenes, videos, links, capturas) y analízalas (claude-video-vision para videos). Para estudiar a fondo el montaje de un reel (cortes, ritmo, transiciones, cómo entra cada elemento) puedes usar `reverse-any-video` (hyperframes) solo como análisis: nunca reconstruyas ni publiques el video ajeno.
   También puede elegir una referencia de movimiento del Catálogo de videoestéticas: las fichas están en `referencias-video/` dentro de esta skill (qué tomar y qué evitar de cada reel), y si la persona usuaria tiene los reels en su equipo, en `catalogo-videos/index.html` de su carpeta makervideo. Puede usar una distinta por parte del video.
   b. Quiere elegir una estética específica: pásale el Catálogo de estéticas (https://claude.ai/artifact/GCqrfbi1rVVhR96gYwY8mf; también hay un acceso directo, "Abrir catálogo de estéticas.html", en la carpeta makervideo): 108 estéticas en 12 familias (incluida "Para post"), cada una con referencias, qué tienen en común, briefs para recrear una foto, paleta, 3 combinaciones de color y letra sugerida. Elige una (o dos para mezclar) y su combinación de color, pega el texto del botón "Copiar para Claude" y, si lo descargó, adjunta el "Paquete de imágenes" (.zip con las referencias). Luego sigue la skill catalogo-esteticas.
   c. Que Claude decida: propone la estética que mejor sirva al mensaje y explica por qué en una línea.
   Pregunta también qué quiere evitar.
5. Audio: ¿voz en off propia, voz generada, música?
6. Fondos y elementos: ofrécele siempre generar fondos y elementos que mejoren la animación (texturas, objetos, formas, piezas para transformar). ¿Los generamos?

Cómo leer las referencias (de la estética elegida o las que la persona usuaria cargue):
- Las referencias son solo eso, referencias. Nunca se toman literalmente (ni para el gancho, ni para una escena) ni se usan como material del video.
- Analiza todas las imágenes del pool de esa estética (en el catálogo, sus referencias de Pinterest; o las que la persona usuaria subió), no solo una. Si la estética viene del catálogo, parte de su ficha (`fichas/<id>.md` de la skill catalogo-esteticas de este plugin): "Qué tienen en común" ya resume el pool, y las fotos del paquete de imágenes sirven para verificarlo y completarlo. Saca lo que se repite: composición, tipografía, texturas, tratamiento de imagen, paleta y ritmo.
- "Recrear una foto" (en la ficha de cada estética): sus briefs sirven como plantilla del prompt para la gema. Se adaptan al guion (escena, textos, elementos y los personajes según sus fichas) y nunca reproducen la foto de referencia.
- Integra esa estética a la idea y al guion ya planteados: la estética sirve al mensaje, no al revés.
- Piensa cómo integrar esos elementos (paleta, materiales, formas, composición, textura, tipografía) en cada escena del guion, y de ahí sale el prompt de imagen.
- Meta: simple y lo menos hecho con IA posible. Menos elementos, composición limpia, texturas e imperfecciones reales; nada de brillos plásticos ni exceso de detalle.
- Pregunta los detalles antes de producir: tipo de letra (la que sugieren las referencias u otra específica) y paleta de colores (la de las referencias u otra específica).

Luego:
- Dirección visual con huashu-design, partiendo de la estética elegida: muestra 3 direcciones distintas dentro de esa estética para que elija antes de producir. Sigue su protocolo de marca (assets reales primero) y su lista anti-"AI slop".
- Imágenes originales: cuando haga falta una imagen o un clip para el video, entrégale siempre el prompt listo para copiar en su gema generadora de imágenes de Gemini (con Nano Banana Pro); la imagen se genera ahí. Estructúralo con `prompt-master` (si está instalada) y llénalo con la fórmula de 7 ingredientes de claude-banana; el texto final va en lenguaje natural para Gemini / Nano Banana (no en XML). Si hay cuota, puedes generarla tú con claude-banana.
- Fondos y elementos para la animación: cada uno con una función en la coreografía (algo que entra, empuja, se transforma o guía la cámara), diseñados a partir del análisis de las referencias, nunca copiándolas. Pide los fondos separados de los elementos, y los elementos sobre fondo limpio o transparente, para poder animarlos por capas en hyperframes. Entrégale los prompts para su gema de Gemini (Nano Banana Pro).
- Videos generados con IA: si le pides generar un clip, dale el prompt completo (escena, cámara, movimiento, duración, estética, formato) y deciden juntos con qué herramienta hacerlo: Higgsfield, Veo, Kling u otra. No elijas la herramienta por la persona usuaria.
- Logos, íconos e ilustraciones vectoriales nuevas con svg-animations; para animar un SVG que ya existe (tu logo, un ícono) usa svg-animation.
- Extras opcionales (solo si están instalados y la persona usuaria los aprueba en el guion plano a plano): `anatomy` para una figura isométrica que explica cómo funciona algo por dentro (una máquina, un proceso, una automatización), y `3dviz-pro-max` cuando una escena necesita un objeto 3D protagonista. Antes, revisa si `hyperframes-registry` ya trae un bloque 3D que sirva. Ambos se montan dentro de hyperframes como clip que sigue el tiempo del video (o renderizados a video), nunca con movimiento que dependa del reloj o del mouse.
- Música y efectos de sonido: `media-use` (hyperframes) para buscarlos, cortarlos y mezclarlos. La voz sigue la regla de 2.2b (provisional generada, final en bloques de texto para ElevenLabs).
- Guarda todo en una carpeta del proyecto (img/, svg/, audio/) y lista qué falta.

### 2.2 Animación y montaje

- hyperframes arma la composición HTML (subtítulos, audio) y, solo con aprobación, renderiza el MP4. Lee primero la skill `hyperframes` (contrato de render) y usa `hyperframes-cli` para la vista previa, revisar cuadros sueltos y renderizar.
- Antes de construir a mano una transición, un título, kinetic type, un movimiento de cámara o un fondo animado, busca en `hyperframes-registry` (unos 450 bloques) y adapta el que sirva a la estética del video. Si ninguno sirve, se construye a mano.
- Quién decide y quién implementa: las skills de movimiento (motion-design, animate, apple-design) deciden el qué y el cómo se siente; GSAP lo implementa dentro de hyperframes. Usa `gsap-timeline` para la línea de tiempo (posiciones relativas y etiquetas), `gsap-core` para tweens y curvas, `gsap-plugins` para SplitText, MorphSVG, MotionPath y Flip, y `gsap-utils` para repartir y mapear valores.
- Las 5 instrucciones, con su herramienta: máscara de texto con SplitText más un contenedor con overflow o clip-path; movimientos encadenados con una sola línea de tiempo y posiciones relativas ("<", ">-0.2"); cámara que sigue con un contenedor de cámara que se mueve y escala, o MotionPath; objeto que se transforma con MorphSVG o Flip; sincronía con la voz con etiquetas en la línea de tiempo sacadas de la transcripción con tiempos por palabra.
- Usa los fondos y elementos generados como capas: el fondo da la atmósfera y los elementos cumplen su función en la coreografía (entrar, empujar, transformarse, guiar la cámara).
- Aplica siempre las 5 instrucciones de animación (ver Reglas de calidad): máscara de texto, movimientos encadenados, cámara que sigue, objeto que se transforma y sincronía con la voz.
- `motion-design` (LottieFiles) fija el arquetipo del video: duraciones, curvas y rebote según juguetón, premium, corporativo o enérgico, más los principios de Disney y la coreografía.
- Cada animación se decide con `animate` (Emil): si debe animarse, propósito, propiedad, curva, duración, entrada y salida.
- `animation-vocabulary` para nombrar efectos con precisión; `apple-design` para movimiento físico y resortes; `emil-design-eng` para el pulido final.
- `animation-performance` y `gsap-performance` si la vista previa se traba.

### 2.2b Procedimiento por partes y transiciones (lecciones de producción)

Aprendido al producir un video profesional completo (propuesta comercial de 2:35, en cinco partes). Aplica a todo video de más de una escena.

**Cómo se trabaja**
- Todo se arma en la versión web (HTML de hyperframes) y se publica en una página con link para revisarlo con sonido. Solo se exporta MP4 cuando la persona usuaria lo pide o aprueba la versión final; exportar cada cambio gasta tiempo y tokens. El MP4 final se entrega descargable.
- Se avanza parte por parte (gancho, presentación, contenido, visión, cierre). Cada parte nueva se pega a continuación en la misma página del video completo desde la primera, nunca en páginas sueltas, para revisar siempre las transiciones reales.
- La página de revisión trae controles desde el inicio: play/pausa (también tocando la imagen), saltos de ±1 s, avance cuadro a cuadro, barra arrastrable con las partes y tomas marcadas, y una línea que dice dónde está ("Presentación · P3 · 5,1 s"). Así la persona usuaria señala errores con precisión.
- Antes de animar una parte se escribe su guion de animación toma por toma (tiempo, voz, qué se ve, cuál de las 5 instrucciones aplica) y se aprueba. Si una parte "quedó mal", no se parchea: se reanaliza la referencia y se reescribe el guion de animación.
- Las referencias de video se analizan cuadro a cuadro a alta frecuencia (4 a 10 cuadros por segundo), no con un vistazo: tamaño del texto frente a los objetos, volumen de los elementos, ritmo de cortes, cómo entra cada palabra (el tipeo, el "Hola"), cómo se transforman las cosas. Cuando la persona usuaria pide "como la referencia", se replica ese movimiento concreto. Cada reel que manda se guarda en el catálogo de videoestéticas (`catalogo-videos/`, ver más abajo).
- Voz provisional desde el principio: un archivo de audio generado (nunca la voz del navegador, que no carga en todos los equipos) para fijar los tiempos. Efectos de sonido y una base musical van desde la primera versión; la voz y el sonido son parte del video, no un extra.
- Voz final al final: cuando todo está aprobado, se entrega el texto de la voz en un bloque por parte, listo para pegar en ElevenLabs (idioma fijado en Español, mismo tono y ajustes en todos), y se reencaja cada audio frase por frase con la animación y los subtítulos.

**Transiciones (lo que más se corrigió)**
- Los estilos pueden convivir y cambiar de una parte a otra para renovar la atención (por ejemplo: pixel en el gancho, vectorial limpio en la presentación, cinematográfico en el contenido). Pero cada cambio de estilo tiene que estar justificado y nacer del final de la escena anterior: un elemento de la escena que termina se transforma en el primer elemento de la siguiente (el pixel que se redondea y se vuelve el punto de "Hola."; las franjas de cine que se cierran en una línea de luz y de esa línea sale la frase; la cámara que entra a un bloque y sale al espacio oscuro de la parte siguiente).
- Nada de cortes abruptos ni huecos: no puede quedar una pantalla vacía (ni un segundo de fondo de color sin nada) entre partes. La frase de la parte siguiente llega sin pausa muerta.
- La voz nunca se calla en una transición. Si la escena muestra un texto puente ("Hasta ahora."), la voz lo dice, el texto se queda mientras se escucha y recién después se apaga. La música no se corta entre partes: sigue y puede subir con un impulso hacia la parte nueva.
- Dentro de un mismo estilo, los fondos se homologan: si una vista de la app tiene aura difusa de fondo, todas las vistas de esa app la llevan. Nada de saltos a fondo plano entre escenas hermanas.
- Una animación no se pisa con otra: cada toma termina (o sale empujada) antes de que entre la siguiente. Un objeto que llega nunca tapa un texto: lo empuja fuera antes de tocarlo.
- El texto se lee completo antes de la siguiente acción: si una palabra se está escribiendo, la escena no cae ni cambia hasta que se lee entera y respira un momento.
- En el reemplazo de palabras (palabra fija + palabra que rota, o una palabra que sustituye a otra), se respeta el "sobreponer y sacar" de la referencia: la palabra que sale se levanta con desenfoque y se apaga, y la nueva entra en el mismo lugar. Nada de inventar terminales ni adornos que no estaban en la referencia.

**Subtítulos y fondos**
- Subtítulos simples: sin franja, sin caja y sin bordes ni contorno. Texto oscuro sobre fondo claro y claro sobre oscuro; si pasan sobre una figura, cambian de color letra por letra donde la tocan. En estilo cinematográfico pueden ir en la franja negra de abajo.
- Un subtítulo nunca queda encima de una franja o bloque de color que lo vuelva ilegible; si choca, se mueve la escena, no se le pone fondo al subtítulo.
- Las palabras que ya están grandes en pantalla (un "¡Gracias!" central) no se repiten en el subtítulo.
- Fondo claro con vida: nada de cuadrículas. Un fondo plano y limpio, con algo de movimiento sutil (manchas de color suaves que se desplazan, formas pequeñas que flotan) para que no se vea muerto.

**Guion y contenido**
- No repetir en una parte lo que ya se dijo en otra (por ejemplo, el cierre no vuelve a explicar la propuesta de la presentación): se salta directo al llamado.
- En propuestas comerciales: no decir "estudiamos su empresa"; presentar el servicio como equipo externo que trabaja a su lado (outsourcing), no como "nos convertimos en su departamento". La visión pone en perspectiva el crecimiento del cliente, no un plan de trabajo (el plan va en la propuesta escrita).
- El gancho puede extenderse con una frase de retención ("Quédese hasta el final: le mostramos cómo").
- El cierre es de impacto y corto: un golpe visual, el llamado, un "Gracias" y el contacto real. Si no hay nombre de equipo, no se inventa: se quita.
- Datos inventados de muestra (cifras, gráficas, proveedores) se avisan como tales; las cifras de un informe van como potencial estimado.

**Elementos y figuras**
- Cada elemento tiene que verse bien hecho o no va. Si una figura dibujada en SVG no se ve natural (siluetas, avatares, manos), se pide la imagen a la gema de Gemini (Nano Banana Pro) con el prompt listo y se anima esa imagen; las figuras con persona van a pantalla completa, sin cortes raros (cuello, hombros).
- Logos de marcas reales: se redibujan a partir de la imagen oficial, nunca de memoria, y se avisa que son marcas de terceros.
- Fotos de la gema: pedirlas en la mayor resolución posible (las de 1024 px se ven suaves a pantalla completa) y, si se van a recortar, sobre fondo verde croma.
- Una composición recargada (manos encima de fotos que cambian, demasiadas capas) se separa en momentos: primero un elemento, después el otro, cada uno limpio.
- Cuando algo se ve "muy simple" en una pantalla, se le da vida con elementos que cuentan algo del guion (una escalera de fotos de crecimiento, tarjetas con los logros), no con adornos.

### 2.3 Revisión final

Antes de entregar, pasa `review-animations`, revisa cuadros clave con `hyperframes-cli` y repasa:
- [ ] Empieza con el gancho
- [ ] Están las 5 instrucciones de animación
- [ ] 1 o 2 palabras resaltadas por pantalla
- [ ] Un solo color de acento
- [ ] Subtítulos
- [ ] Sin marcas de agua ni rastros de IA
- [ ] Personajes consistentes con sus fichas en todas las escenas
- [ ] Cada cambio de estilo nace de la escena anterior; sin cortes abruptos ni pantallas vacías entre partes
- [ ] La voz y la música no se cortan en las transiciones; todo texto puente se dice
- [ ] Fondos homologados entre escenas del mismo estilo
- [ ] Ninguna animación tapa un texto ni se pisa con otra; cada texto se lee completo
- [ ] Subtítulos simples (sin franja ni bordes) y legibles en todo momento
- [ ] Nada se repite entre partes

## Reglas de calidad (siempre)

1. Gancho obligatorio: todo video empieza con un gancho, antes de cualquier presentación. Los buenos ganchos cambian y pueden ser distintos: no hay una fórmula fija. Propón 3 ganchos de estilos diferentes y que la persona usuaria elija.
2. Estructura: antes/después en la misma pantalla cuando aplique.
3. Animación, las 5 instrucciones (núcleo de calidad: no basta con que las cosas "aparezcan" en pantalla):
   1. **Máscara de texto:** revela el texto desde una máscara. Las palabras salen de detrás de un borde en vez de solo encenderse.
   2. **Movimientos encadenados:** un elemento entra, empuja al siguiente y provoca una acción. Todo se siente como una sola coreografía.
   3. **Cámara que sigue:** la vista acompaña al objeto importante y guía la mirada.
   4. **Objeto que se transforma:** un elemento se convierte en otro para introducir la siguiente escena, sin cortes bruscos.
   5. **Sincronía con la voz:** cada palabra o elemento entra justo cuando se nombra en la narración.
   Prompt base para animar: "Haz una animación de [tema]. Revela el texto desde una máscara. Encadena tus movimientos. Haz que la cámara siga [objeto importante]. Transforma [objeto] para introducir la siguiente escena. Sincroniza las entradas y los énfasis con mi narración: [pegar guion]."
4. Estilo: palabra clave resaltada con fondo de color (una o dos por pantalla); un solo color de acento sobre fondo neutro.
5. Subtítulos siempre; el video se entiende sin sonido.
6. Sin rastros de IA: nada de degradados morados genéricos, íconos emoji, tarjetas redondeadas por defecto, caras dibujadas en SVG ni datos decorativos sin sentido. huashu-design agrega por defecto la marca de agua "Created by Huashu-Design" a sus animaciones: quítala siempre.

## Cuándo usar cada herramienta

| Herramienta | Úsala para | Aporta contra lo genérico |
| --- | --- | --- |
| claude-video-vision | Ver un video de referencia (archivo o link) | Entiende exactamente qué estilo quiere copiar o superar |
| last30days | Investigar una temática sin idea previa | Ángulos basados en lo que la gente dice hoy, no en clichés |
| apify | Mostrar ejemplos reales parecidos (redes) | Compara con contenido que ya funciona |
| hyperframes / hyperframes-cli | Composición HTML del video, vista previa, revisar cuadros y render MP4 (solo con aprobación) | Animación determinista y controlada cuadro a cuadro |
| hyperframes-registry | Buscar un bloque hecho (transición, título, kinetic type, cámara, 3D) antes de construirlo a mano | Unos 450 bloques probados para adaptar en vez de improvisar |
| reverse-any-video | Estudiar el montaje de un reel de referencia cuadro por cuadro | Solo análisis: nunca reconstruir ni publicar el video ajeno |
| media-use | Música y efectos de sonido, cortes y mezcla | Sonido desde la primera versión, sin buscar a ciegas |
| gsap-core / gsap-timeline / gsap-plugins / gsap-utils | Implementar el movimiento dentro de hyperframes (GSAP es su motor) | Las 5 instrucciones con la herramienta exacta: SplitText, MorphSVG, MotionPath, Flip, líneas de tiempo |
| anatomy (extra opcional) | Figura isométrica que explica cómo funciona algo por dentro | Un objeto técnico creíble en vez de íconos genéricos |
| 3dviz-pro-max (extra opcional) | Objeto 3D protagonista en una escena | 3D con criterio de forma, luz y cámara |
| huashu-design | Dirección visual, storyboard, prototipos animados | 3 propuestas antes de producir; protocolo de marca; lista anti-AI slop |
| prompt-master (si está instalada; no viene en el plugin) | Estructurar cualquier prompt de imagen o video antes de dárselo | Prompts completos y precisos, sin vaguedades |
| claude-banana | Imágenes fijas originales (fondos, escenas, producto, miniatura) | Prompts de fotógrafo con 7 ingredientes en vez de "imagen bonita" |
| svg-animations (supermemory) | Crear desde cero ilustraciones, íconos o logos vectoriales animados | Elementos hechos a medida, nítidos a cualquier tamaño |
| svg-animation (iart-ai) | Animar un SVG que ya existe: trazo que se dibuja, morphing, movimiento por un camino | Usa GSAP, el mismo motor de hyperframes, así encaja directo en el montaje |
| motion-design (LottieFiles) | Definir la personalidad del movimiento de todo el video | Tiempos, curvas y rebote coherentes según el arquetipo; principios de Disney |
| animate / emil-design-eng / apple-design | Decidir y pulir cada movimiento | Cada animación con propósito, curva y duración justificadas |
| animation-vocabulary | Nombrar un efecto que la persona usuaria describe con palabras | Prompts precisos en vez de vagos |
| review-animations | Auditar el movimiento antes de entregar | Estándar alto: aprobar se gana |

## Notas del equipo

- Este plugin trae creador-de-videos, catalogo-esteticas y el envoltorio de claude-banana. hyperframes, gsap-skills y 3dviz-pro-max llegan como plugins del mismo marketplace. Las demás skills (Emil, huashu-design, svg, motion-design, last30days, claude-video-vision, anatomy) y el repo de claude-banana (`~/.claude/plugins/claude-banana`) los instala `/videomaker:preparar` en `~/.claude/skills`.
- Generar imágenes con claude-banana requiere facturación activa en Google AI Studio; sin eso, entrega el prompt para pegar en la gema de Gemini.
- hyperframes llega como plugin (`hyperframes@videomaker`), no clonando el repo. Su telemetría queda apagada con `npx hyperframes telemetry disable`. Los extras opcionales se instalan con `/videomaker:preparar --con-extras` (anatomy) y `/plugin install 3dviz-pro-max@videomaker`.
- No se usan Remotion ni otros motores de video: hyperframes es el único motor, para que no haya dudas sobre con qué construir. Si llega código de Remotion, se convierte con `remotion-to-hyperframes` (se instala aparte con `npx hyperframes skills update remotion-to-hyperframes`).
- motion-design viene de LottieFiles/motion-design-skill (el repo kedhareswer/kedhar_brain no existe en GitHub).
- Claves: GEMINI_API_KEY y APIFY_TOKEN viven en variables de entorno. Nunca las pidas ni las pegues en el chat.
- Gemas de Gemini de la persona usuaria: una generadora de imágenes (Nano Banana Pro) y una generadora de personajes. Son suyas; si aún no las tiene, ver `LO-QUE-PONES-TU.md` del repo del plugin (github.com/JoseD100801/videomaker).
- Proyectos nuevos: copia `proyectos/_plantilla` con el nombre del video y guarda ahí todo (img/, svg/, audio/, personajes/, referencias/, render/).

## Catálogo de videoestéticas

Referencias de movimiento y montaje en video. Sus fichas (texto) vienen en `referencias-video/` de esta skill; los reels y cuadros son de otras cuentas, así que no van en el plugin y viven solo en `catalogo-videos/` dentro de la carpeta makervideo de cada equipo. Para verlas, abrir `catalogo-videos/index.html` en el navegador (funciona sin internet): cada referencia tiene el reel, sus cuadros clave y la ficha.
- Cada carpeta `NN-nombre/` trae `reel.mp4`, `portada.jpg`, `cuadros-1.jpg` y `cuadros-2.jpg` (cuadros resumidos) y `ficha.md` (paleta, tipografía, elementos, movimiento, ritmo, qué tomar y qué evitar).
- Cada reel nuevo que mande la persona usuaria se agrega igual: el video (comprimido a 960 px de ancho), `portada.jpg`, los cuadros, la ficha analizada cuadro por cuadro, una fila nueva en `LEEME.md` y una entrada en la lista `REFS` de `armar-indice.py`; después se corre `python armar-indice.py` para regenerar el índice.
- Son solo referencias de otras cuentas o marcas: se analizan, nunca se copian ni se usan como material del video, y no se publican.

## Más referencias para una estética (Pinterest con Apify)

Cuando pida más referencias de una o varias estéticas del catálogo:
1. Busca en Pinterest con el actor de Apify `silentflow/pinterest-scraper-ppr` (`search` = nombre de la estética + "aesthetic" o "poster design"; `maxItems` 8 por estética). Cuesta unos USD 0,002 por pin: avisa el costo antes de pasar de 50 pines y pon `maxTotalChargeUsd` en cada llamada.
2. Descarga solo la miniatura de 236 px de cada pin y guarda el link al pin original y la palabra de búsqueda.
3. Publica una página de revisión ("Referencias por aprobar") donde la persona usuaria toca las que entran y copia su selección.
4. Agrega al Catálogo de estéticas (el catálogo publicado, https://claude.ai/artifact/GCqrfbi1rVVhR96gYwY8mf; después regenera `esteticas.md` y `fichas/` de la skill) solo las aprobadas, siempre con el link al pin original y el autor. Son referencia personal; no se publican ni se usan como material del video.
