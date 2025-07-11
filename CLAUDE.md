# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a book publishing/typesetting project that converts books written in Markdown to professionally formatted PDFs using Typst. The project is designed for publishing historical testimonies and oral histories from southern Argentina.

## Key Commands

### Converting a book from Markdown to PDF
```bash
./crear_pdf.sh nombre_base
```
Example: `./crear_pdf.sh coti` (processes libro_coti/coti.md)

### Manual conversion steps
1. Convert Markdown to Typst: `pandoc libro_nombre/nombre.md -t typst -o libro_nombre/nombre.typ`
2. Replace markers: `sed -i 's/^SALTODEPAGINA$/#pagebreak()/' libro_nombre/nombre.typ`
3. Compile to PDF: `typst compile libro_nombre/final_nombre.typ libro_nombre/nombre.pdf`

## Architecture

### Directory Structure
- Each book lives in its own directory: `libro_nombre/`
- Within each book directory:
  - `nombre.md` - Source Markdown file
  - `conf.typ` - Typst configuration (page size, heading styles, image formatting)
  - `imagenes/` - Images used in the book
  - Generated files: `nombre.typ`, `final_nombre.typ`, `nombre.pdf`

### Processing Pipeline
1. Authors write in Markdown with special markers (e.g., `SALTODEPAGINA` for page breaks)
2. `crear_pdf.sh` script:
   - Converts Markdown to Typst using Pandoc
   - Replaces special markers with Typst commands
   - Wraps content with configuration template
   - Compiles to PDF using Typst

### Key Files
- `crear_pdf.sh` - Main build script
- `plantilla.typ` - Basic template (A5 page size, Libertinus Serif font)
- Book-specific `conf.typ` - Detailed formatting configuration

## Book Configuration

The `conf.typ` file in each book directory controls:
- Page size (A5 default)
- Heading styles (level 1: centered, 30pt; level 2: 20pt with padding)
- Image formatting (90% width with automatic padding)

## Special Markdown Conventions

- `SALTODEPAGINA` - Insert a page break (converted to `#pagebreak()`)
- Standard Markdown syntax for headings, lists, images, etc.
- See `markdown_sintaxis.md` for complete syntax reference