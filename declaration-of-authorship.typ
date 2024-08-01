#import "locale.typ": *

#let declaration-of-authorship(
  authors,
  title,
  date,
  lang,
  at-university,
  city,
  date-format
) = {
  let authors_by_city = authors.map(author => author.company.city).dedup()

  v(2em)
  text(size: 20pt, weight: "bold", DECLARATION_OF_OWNERSHIP_TITLE.at(lang))
  v(1em)

  if (authors.len() == 1) {
    par(justify: true, DECLARATION_OF_OWNERSHIP_SECTION_A_SINGLE.at(lang))
    v(1em)
    align(center, text(weight: "bold", title))
    v(1em)
    par(justify: true, DECLARATION_OF_OWNERSHIP_SECTION_B_SINGLE.at(lang))

  } else {
    par(justify: true, DECLARATION_OF_OWNERSHIP_SECTION_A_PLURAL.at(lang))
    v(1em)
    align(center, text(weight: "bold", title))
    v(1em)
    par(justify: true, DECLARATION_OF_OWNERSHIP_SECTION_B_PLURAL.at(lang))

  }

  let end-date = if (type(date) == datetime) {
    date

  } else {
    date.at(1)

  }

  v(2em)
  if (at-university) {
    text(city + [, ] + end-date.display(date-format))

  } else {
    text(
      authors_by_city.join(", ", last: AND.at(lang)) +
      [ ] +
      end-date.display(date-format)
    )
  }

  v(1em)
  if (authors.len() > 3) {
    grid(
      columns: (1fr, 1fr),
      gutter: 20pt,
      ..authors.map(author => {
        v(3.5em)
        line(length: 80%)
        author.name
      })
    )

  } else {
    for author in authors {
      v(4em)
      line(length: 40%)
      author.name
    }
  }
}
