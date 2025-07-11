#!/usr/bin/env bash

# Uso: ./md2pdf.sh nombre_base
# Ejemplo: ./md2pdf.sh coti

set -euo pipefail

if [ "$#" -ne 1 ]; then
  echo "Uso: $0 nombre_base"
  echo "Ejemplo: $0 coti"
  exit 1
fi

BASE="$1"
DIR="libro_${BASE}"
MD_FILE="${DIR}/${BASE}.md"
TYP_FILE="${DIR}/${BASE}.typ"
FINAL_TYP_FILE="${DIR}/final_${BASE}.typ"
PDF_FILE="${DIR}/${BASE}.pdf"

# Verificar existencia de archivos necesarios
if [ ! -f "$MD_FILE" ]; then
  echo "❌ No se encontró el archivo: $MD_FILE"
  exit 1
fi


echo "📄 Procesando $MD_FILE..."

# 1. Convertir de Markdown a Typst (provisional)
pandoc "$MD_FILE" -t typst -o "$TYP_FILE"

# 2. Reemplazar SALTODEPAGINA por #pagebreak()
sed -i 's/^SALTODEPAGINA$/#pagebreak()/' "$TYP_FILE"

# 3. Combinar con la plantilla
{
  echo '
  #import "../conf.typ": conf
  #show: conf.with()
  '
  echo ""
  cat "$TYP_FILE"
} > "$FINAL_TYP_FILE"

# 4. Compilar archivo final con plantilla a PDF
typst compile --root . "$FINAL_TYP_FILE" "$PDF_FILE"

echo "✅ PDF generado: $PDF_FILE"
