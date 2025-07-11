#let conf(
  doc,
) = {
  set page(
    "a5",
    numbering: "1",
    number-align: center + bottom,
    margin: (x: 2cm, top: 2.5cm, bottom: 2cm),
    header: [
      #set text(10pt, fill: gray)
      #align(center)[_Archivos del Sur_]
      #v(0.3cm)
    ]
  )
  show heading.where(level: 1): set align(center)
  show heading.where(level: 1): set align(horizon)
  show heading.where(level: 1): set text(30pt)

  show heading.where(level: 2): it => {
    pad(text(20pt, it), bottom: 10pt)
  }

  set figure(supplement: none)
  
  show figure: it => {
    block(breakable: false, width: 100%, height: 100%)[
      #place(center + horizon)[
        #align(center)[
          #it.body
          #v(0.5em)
          #it.caption.body
        ]
      ]
    ]
  }

  doc
}
