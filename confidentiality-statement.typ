#import "locale.typ": *

#let confidentiality-statement(
  authors,
  title,
  confidentiality-statement-content,
  university,
  university-location,
  date,
  lang,
  date-format
) = {
  let authors_by_city    = authors.map(author => author.company.city).dedup()

  v(2em)
  text(size: 20pt, weight: "bold", CONFIDENTIALITY_STATEMENT_TITLE.at(lang))
  v(1em)

  if (confidentiality-statement-content != none) {
    confidentiality-statement-content

  } else {
    let authors_by_company = authors.map(author => author.company.name).dedup()
    let authors_by_study   = authors.map(author => author.course-of-studies).dedup()
    let companies          = authors_by_company.join(", ", last: AND.at(lang))

    let institution = if (authors_by_company.len() == 1) {
      INSTITUTION_SINGLE.at(lang)
    } else {
      INSTITUTION_PLURAL.at(lang)
    }

    text(CONFIDENTIALITY_STATEMENT_SECTION_A.at(lang))
    v(1em)
    align(center,text(weight: "bold", title))
    v(1em)

    par(
      justify: true,
      CONFIDENTIALITY_STATEMENT_SECTION_B.at(lang) +
      [ ]                                          +
      companies                                    +
      CONFIDENTIALITY_STATEMENT_SECTION_C.at(lang) +
      [ ]                                          +
      authors_by_study.join(" | ")                 +
      CONFIDENTIALITY_STATEMENT_SECTION_D.at(lang) +
      university                                   +
      [ ]                                          +
      university-location                          +
      CONFIDENTIALITY_STATEMENT_SECTION_E.at(lang) +
      institution                                  +
      [ (#companies)]                              +
      CONFIDENTIALITY_STATEMENT_SECTION_F.at(lang)
    )
  }

  let end-date = if (type(date) == datetime) {
    date
  } else {
    date.at(1)
  }

  v(2em)
  text(
    authors_by_city.dedup().join(", ", last: AND.at(lang)) +
    [ ] +
    end-date.display(date-format)
  )

  v(0.5em)
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
