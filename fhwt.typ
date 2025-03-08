#let conf(
  Title: "FHVirus' HomeWork template in Typst",
  Author: "Author",
  AuthorID: "b11902017",
  CourseName: "Typst Template",
  doc
) = {
  //---------------------- Typesetting ----------------------//
  set text(font: ("Libertinus Serif", "Noto Serif CJK TC"))
  set page(
    paper: "a4",
    flipped: false,
    margin: (
      top: 2cm + 1em,
      rest: 2cm
    ),
    columns: 1,
    header: context {
      if counter(page).get().first() > 1 [
        #grid(
          columns: (2fr, 1fr),
          align: (left, right),
          inset: (y: 5pt),
          [#CourseName $bar$ #Title],
          [#AuthorID #Author],
          grid.hline(stroke: 0.5pt),
        )
        #v(1em)
      ]
    },
    header-ascent: 0pt,
    numbering: "1"
  )
  set par(justify: true)
  set heading(numbering: "1.1")
  show link: underline

  //---------------------- Code Block Background ----------------------//
  show raw: set text(font: ("DejaVu Sans Mono", "Noto Sans Mono CJK TC"))
  show raw.where(block: false): box.with(
    fill: luma(240),
    inset: (x: 3pt, y: 0pt),
    outset: (y: 3pt),
    radius: 2pt,
  )
  show raw.where(block: true): block.with(
    fill: luma(240),
    inset: 10pt,
    radius: 4pt,
    width: 100%
  )

  //---------------------- Title Page Header ----------------------//
  context {
    block(
      fill: gradient.linear(rgb(2, 29, 95, 255), rgb(154, 152, 217, 255), angle: 90deg),
      width: 100%, height: 3cm,
      inset: (bottom: 1cm, rest: 0cm),
      outset: (left: page.margin.left, right: page.margin.right, top: page.margin.top),
    )[
      #set text(fill: white, weight: "bold")
      #set align(right + top)
      #AuthorID \
      #Author
      #set align(left + bottom)
      #CourseName \
      #text(20pt)[#Title]
    ]
  }

  //---------------------- Theorem Blocks ----------------------//
  // TODO: Can I not import twice?
  import "@preview/ctheorems:1.1.3": *
  show: thmrules.with(qed-symbol: $square$)

  //---------------------- End of Template ----------------------//
  doc
}

//---------------------- Theorem Blocks ----------------------//
#import "@preview/ctheorems:1.1.3": *
#let thmbox = thmbox.with(
  radius: 4pt,
  padding: (top: 0em, bottom: 0em),
)
#let theorem = thmbox("theorem", "Theorem", fill: luma(240))
#let lemma = thmbox("theorem", "Lemma", fill: luma(240))
#let corollary = thmplain( "corollary", "Corollary", base: "theorem", titlefmt: strong)
#let claim = thmplain("theorem", "Claim")
#let observation = thmplain("theorem", "Observation")
#let definition = thmplain("theorem", "Definition", titlefmt: strong)
#let example = thmplain("example", "Example").with(numbering: none)
#let proof = thmproof("proof", "Proof")

#let problemCounter = counter("problem")
#let problem(same-page: false, number: none, body) = {
  context { if not same-page and problemCounter.get().first() > 0 { pagebreak() } }
  problemCounter.step()
  block(width: 100%, above: 1.2em, below: 0.625em, sticky: true)[
    #text(size: 1.2em, weight: "bold")[Problem #context{
      if number == none {problemCounter.display()} else {number}
    }]
  ]
  body
}

#let codefile(filename, lang) = raw(read(filename), lang: lang, block: true)
