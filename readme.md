# Maquetador Archivos del Sur

## REQUISITOS

1. Instalar el CLI de Typst
2. Instalar pandoc

## De Markdown a  Typst
```pandoc NOMBRE_MARKDOWN.md -t typst -o NOMBRE_TYPST.typ``

## Generar PDF
```typst compile TYPST_GENERADO.typ NOMBRE_PDF.pdf```
