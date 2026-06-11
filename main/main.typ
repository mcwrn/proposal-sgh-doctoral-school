// Zmiana tekst na polski
#set text(lang: "en")

//Zmiana czcionki
#set text(font: "New Computer Modern", size: 12pt)

// Ustawienia dotyczące strony
#set page(
  paper: "a4", 
  margin: (x: 2cm, y: 2cm), 
  header: none)

// Ustawienia dotyczące paragrafów
#set par(justify: true, first-line-indent: 0em, leading: .5em)

// Ustawienia dotyczące tabel
#show figure.where(kind: table): set figure.caption(position: top)
#set figure(gap: 2em) // Adjust '2em' to your preferred spacing

#show figure.caption: it => {
  // 1. Center the block on the page
  align(center, block(width: 80%)[
    // 2. Reset text to left-aligned so 'justify' works correctly
    #set align(left)
    #set par(justify: true)
    #it
  ])
}

//Ustawienia dotyczące numerowania
#set heading(numbering: "1.1")
#set math.equation(numbering: "(1)")

//Ustawienia dotyczące tytułu
#set document(title: [TODO WSTAW TYTUŁ PROJEKTU])
#show title: set text(size: 1.3em, bottom-edge: "bounds")
#show title: set block(below: 2cm)
#show title: set align(center)

// Bieżąca data z odpowiednim formatowaniem
#let date = datetime.today().display("[month repr:long] [day], [year]")

// Ustawienia zmiennych
#let color1 = rgb("#d6a309")
#let color2 = rgb("#B0C4D0")

// Zmiana referencji na takie, które dają tylko numery
#show ref: it => {
  if it.element != none and it.element.has("supplement") {
    let el = it.element
    let num = numbering(
      el.numbering,
      ..counter(el.func()).at(el.location()) // tutaj interesujące rozwinięcie listy argumentów
    )
    link(it.target, num)
  } else {
    it
  }
}

// Twierdzenia i definicje
#let theorem(title: none, body) = block[
  *Theorem.*
  #if title != none [#title]
  #body
]

#let proposition(title: none, body) = block[
  *Proposition.*
  #if title != none [#title]
  #body
]

#let corollary(title: none, body) = block[
  *Corollary.*
  #if title != none [#title]
  #body
]


#let proof(body) = block[
  *Proof.*
  #body
  #h(1fr) $square$
]


// ----------------------------------------------------------------------------
// Ustawienia prostych funkcji
#let varx(a) = $x_(#a)$
#let note(n) = {
    line(length: 10cm, stroke: color1)
    text(fill: blue)[#n]
    line(length: 10cm, stroke: color1)
}

// -------------------------------------------------
// Tytuł
// -------------------------------------------------

#title()

// -------------------------------------------------
// Autorzy
// -------------------------------------------------

#block(below: 1cm)[
    #grid(columns: (1fr, 1fr),
        align(center)[Michał Ramsza\ SGH Warsaw School of Economics\ #link("michal.ramsza@sgh.waw.pl")],
        align(center)[Maciej Wrona\ SGH Warsaw School of Economics\ #link("maciej.wrona@sgh.waw.pl")]
    )]

// -------------------------------------------------
// Streszczenie
// -------------------------------------------------

#align(center)[
    #block(fill: rgb("#FFFFFF"), inset: 7pt,  width: 80%, below: 1cm, above: 1cm)[
        #set par(justify: true)
        #set align(left)
        #align(center)[*Opis zamierzeń badawczych ma zawierać*]

        1. Wstępny tytuł rozprawy doktorskiej (do 300 znaków)
2. Wprowadzenie (określenie obszaru badawczego, powody wyboru problemu badawczego i jego znaczenie dla rozwoju danej dziedziny nauki)
3. Krótki przegląd literatury (kluczowe pozycje na temat danego problemu badawczego ze wskazaniem luk, które kandydat zamierza wypełnić, to nie jest bibliografia)
4. Główne pytania badawcze, które dezagregują na cząstkowe elementy stawiany przez kandydata problem badawczy
5. Metody badawcze do rozwiązania problemu badawczego
6. Oczekiwane teoretyczne i praktyczne wyniki problemu badawczego wybranego przez kandydata

    ]]

= Fisher-Pry jako gra różniczkowa - substytucja technologiczna

- #cite(<fisher1971simple>, form: "full")
- #cite(<marchetti1977primary>, form: "full")
- #cite(<mercure2012ftt>, form: "full")
 

= Differential Game of Resource Depletion and Energy Transition (?)

- #cite(<hotelling1931economics>, form: "full")
- #cite(<dasgupta1979economic>, form: "full")
- #cite(<karp2005global>, form: "full") -- gra różniczkowa
- #cite(<long2011dynamic>, form: "full") -- survey
- #cite(<benchekroun2019mergers>, form: "full")
- #cite(<benchekroun2019oligopoly>, form: "full")


= Dynamic Bertrand Competition and Energy Transition (?)

- #cite(<ludkovski2015game>, form: "full")
- #cite(<green1992competition>, form: "full")


= Metodologia

- #cite(<dockner2000differential>, form: "full")
- #cite(<bacsar1998dynamic>, form: "full")\
- #cite(<bressan2007introduction>, form: "full")




= Ad 6) Oczekiwane wyniki

Oczekiwanym jest, iż uzyskam warunków istnienia i charakterystyki równowag dynamicznych prowadzących do długookresowej substytucji technologii energetycznych. Analiza będzie obejmowała zarówno równowagi typu open-loop, jak i feedback, a także badanie ich stabilności oraz własności jakościowych rozwiązań.  



// ----------------------------------------------------------------------------
// Literatura
#bibliography("refs.bib", style: "harvard-cite-them-right")



