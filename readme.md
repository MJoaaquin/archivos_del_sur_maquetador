# Maquetador Archivos del Sur 📖

## REQUISITOS

1. Instalar el CLI de Typst
2. Instalar pandoc

## De Markdown a  Typst
```pandoc NOMBRE_MARKDOWN.md -t typst -o NOMBRE_TYPST.typ```

## Generar PDF
```typst compile TYPST_GENERADO.typ NOMBRE_PDF.pdf```

## Tareas pendientes

- [x] Remover archivos de los libros y hacer el repo público
- [ ] Modificar el código del template typst para que respete las convenciones.
- [ ] Agregar script para traer los archivos markdown del otro repo.
- [ ] Ajustar template para que las imagenes se adapten mejor al tamaño de la hoja
