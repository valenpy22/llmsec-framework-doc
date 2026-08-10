# LLM-Sec Framework Document

Documento standalone del marco LLM-Sec (LaTeX, clase propia `llmsec.cls`) — fuente de verdad sobre la tesis.

## Compilación

```
make
```

Compila `main.tex` con `latexmk -xelatex` y genera además `framework-eval-llm-cs-doc.md` (vía `pymupdf4llm`). Usar `make clean` para limpiar artefactos.

## Estructura

- `chapters/` — capítulos (`01-introduccion.tex` … `06-guia-uso.tex`), apéndices (`appendix-a` a `appendix-d`) y `references.tex`, todos incluidos por `\input` desde `main.tex`.
- `tables/` — reservado para tablas externas; actualmente todas las tablas están inline dentro de los capítulos.
- `figures/` — figuras del documento.

## Reglas de estilo obligatorias

- Prosa en español académico. Prohibido usar rayas (—) y dobles guiones (--) en el texto en español.
- Cambios mínimos y localizados: no reescribir párrafos completos.
- No modificar contenido técnico (definiciones de controles, niveles, métricas) salvo que se indique explícitamente.
