#set page(
  paper: "a4",
  flipped: true,
  margin: 0pt,
)

#set text(
  font: "Alatsi"
)

#let contenido_tapa = grid(
  columns: (100%),
  rows: (8%, 2%, 80%, 10%),
  align(
    center + horizon,
    text(30pt, fill: maroon, "ARCHIVOS DEL SUR")
  ),
  align(
    center + horizon,
    text(size: 14pt, fill: maroon, weight: "bold", "Subcomisión de la Biblioteca Popular Osvando Bayer")
  ),
  align(
    center + horizon,
    box[
      #box(width: 80%)[
        #image("libro_coti/imagenes/tapa.jpg", width: 100%)
        #place(bottom, box(
          width: 100%,
          height: 12%,
          fill: black.transparentize(50%),
        ))
      ]
      #place(
        right + bottom,
        dy: -30pt,
        dx: -15pt,
        text(fill: white, size: 25pt, weight: "bold", "La Historia de los Carmoney")
      )
      #place(
        right + bottom,
        dy: -10pt,
        dx: -15pt,
        text(fill: white, size: 14pt, weight: "bold", "contada por Coti Carmoney")
      )
   ]
  ),
  align(center + bottom, box(
        inset: (bottom: 25pt),
        text(12pt, fill: maroon, "Publicación N° 12 | Septiembre 2025 | Villa La Angostura | Neuquén")
      )),
)

#let contenedor_tapa = box(
  width: 100%,
  height: 100%,
  inset: 0pt,
  contenido_tapa
)

#let contenido_lomo = align(center + horizon)[
  #rotate(
    -90deg,
    reflow: true,
    text(
      14pt,
      fill: white,
      "Archivos del Sur - Coti Carmoney"
    )
  )
]

#let contenedor_lomo = align(
  center + horizon,
    box(
    width: 100%,
    height: 85%,
    fill: maroon,
    inset: 0pt,
    contenido_lomo
  )
)

#let contenido_contra_tapa = grid(
  columns: (100%),
  rows: (50%, 50%),
  align(center + top, box(
        inset: (top: 17pt),
        text(15pt, fill: maroon, "Archivos del Sur")
      )),
  align(center + bottom, box(
        inset: (bottom: 17pt),
        text(12pt, fill: maroon, "LOGOS + ISBN")
      )),
)

#let contenedor_contra_tapa = box(
  width: 100%,
  height: 100%,
  inset: 0pt,
  contenido_contra_tapa
)

#grid(
  columns: (47.5%, 5%, 47.5%),
  contenedor_contra_tapa, contenedor_lomo, contenedor_tapa,
)
