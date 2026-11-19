---
description: Crea la carpeta de un video nuevo a partir de la plantilla (img, svg, audio, personajes, referencias, render) y arranca la fase 1.
argument-hint: "<nombre-del-video>"
---

1. Busca la carpeta de trabajo: el directorio actual si tiene `proyectos/_plantilla`; si no, `~/Desktop/makervideo` o `~/Escritorio/makervideo`. Si no existe ninguna, ofrece correr `/videomaker:preparar --carpeta`.
2. Nombre del proyecto: `$ARGUMENTS` en minúsculas y con guiones. Si viene vacío, pregúntalo.
3. Copia `proyectos/_plantilla` a `proyectos/<nombre>` sin pisar una carpeta que ya exista.
4. Carga la skill `creador-de-videos` y empieza por la Fase 1: pregunta qué vamos a hacer (máximo 3 preguntas, con opciones cortas y tu recomendación).
