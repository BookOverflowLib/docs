#set text(size: 12pt)

#align(left)[
  #image("assets/imgs/logo_unipd_int.png", width: 50%)
]

#set align(center)
#text(size: 16pt)[TECNOLOGIE WEB \ A.A. 2024/2025]
#v(1em)
#image("assets/imgs/logo.svg", width: 10%)
#image("assets/imgs/BookOverflow.png", width: 40%)

#text(size: 20pt, style: "italic")[Relazione progetto]
#v(2em)
#text()[
  Bazzan Matteo - matteo.bazzan.1\@studenti.unipd.it - 2076422

  Bernardello Alessandro - alessandro.bernardello.1\@studenti.unipd.it  - 2077674

  Mathew Aleena - aleena.mathew\@studenti.unipd.it - 2068242

  Ribon Luca - luca.ribon\@studenti.unipd.it -  2075516 - *Referente*
]

#v(3em)
#text(size: 16pt, weight: "bold")[Indirizzo sito web]

#link("https://caa.studenti.math.unipd.it/lribon")
#v(1em)
#text(size: 16pt, weight: "bold")[Credenziali accessi al sito]
#table(
  columns: (auto, auto, auto),
  stroke: (x, y) => if y == 0 {
    (bottom: 0.7pt + black)
  },
  fill: (x, y) => if y == 0 {
    rgb("#fefae0")
  },
  inset: 10pt,
  align: horizon,
  table.header(
    [*Ruolo*],
    [*Username*],
    [*Password*],
  ),

  [User], [user], [user],
  [Utente], [utente], [utente],
  [Amministratore], [admin], [admin],
)

#pagebreak()
#show outline.entry.where(level: 1): it => {
  v(2em, weak: true)
  strong(it)
}