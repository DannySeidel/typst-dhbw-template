#let titlepage(authors, title, language, typeOfThesis, typeOfDegree, timeOfProject, date, at-dhbw, logo-left, logo-right, left-logo-height, right-logo-height, university, university-location, supervisor, heading-font) = {
  stack(dir: ltr,
    spacing: 1fr,
   // Logo at top left if given
    align(horizon,
      if logo-left != none {
        set image(height: left-logo-height)
        logo-left
      }
    ),

    // Logo at top right if given
    align(horizon,
      if logo-right != none {
        set image(height: right-logo-height)
        logo-right
      }
    )
  )
  
  v(1.2fr)

  //  TITLE
  align(center, text(weight: "semibold", font: heading-font, 2.2em, title))
  v(2em)

  //  TYPE OF THESIS
  [#if (typeOfThesis != none and typeOfThesis.len() > 0) {
  align(center, text(weight: "semibold", font: heading-font, 1.4em, typeOfThesis))
  v(2em)
  }]

  //  TYPE OF DEGREE
  [#if (typeOfDegree != none and typeOfDegree.len() > 0) {
    align(center, text(1em, [#if (language == "de") {
      [für den Erwerb des]
    } else {
      [for the]
    }]))
    v(0.3em)
    align(center, text(weight: "semibold", font: heading-font, 1.4em, typeOfDegree))
    v(2em)
  }]


  //  COURSE OF STUDIES
  align(center, text(1.2em, [#if (language == "de") {
    [aus dem Studiengang #authors.map(author => author.course-of-studies).dedup().join(" | ")]
  } else {
    [from the course of studies #authors.map(author => author.course-of-studies).dedup().join(" | ")]
  }]))
  v(1em)

  //  UNIVERSITY
  align(center, text(1.2em, [#if (language == "de") {
    [an der #university #university-location]
  } else {
    [at the #university #university-location]
  }]))
  v(2em)

  // AUTHOR
  align(center, text(1em, if (language == "de") {
    "von"
  } else {
    "by"
  }))
  v(0.3em)

  grid(
    columns: 100%,
    rows: auto,
    gutter: 18pt,
    ..authors.map(author => align(center, {
      text(weight: "medium", 1.5em, [#author.name])
    }))
  )
  v(1.5em)

  //  DATE
  align(center, text(1.2em, [#if (language == "de") {
    date.display("[day].[month].[year]") 
  } else {
    date.display("[month]/[day]/[year]")
  }]))
  v(1fr)

  // Author information

  grid(
    columns: (if (language == "de") {
      200pt
    } else {
      180pt
    }, auto),
    gutter: 11pt,
    text(weight: "semibold", if (language == "de") {
      [Zeitraum:]
    } else {
      [Time of project:]
    }),
    text(timeOfProject),
    text(weight: "semibold", if (language == "de") {
      [Matrikelnummer, Kurs:]
    } else {
      [Student ID, Course:]
    }),
    stack(
      dir: ttb,
      for author in authors {
        text([#author.student-id, #author.course])
        linebreak()
      }
    ),

    //  SUPERVISOR IN DHBW
    [#if (at-dhbw) {
      text(weight: "semibold", if (language == "de") {
        "Betreuer an der DHBW:"
      } else {
        "Supervisor at DHBW:"
    })}],
    [#if (at-dhbw) {
        text[#supervisor]
    }],   
        
    //  NAME OF COMPANY
    [#if not (at-dhbw) {
      text(weight: "semibold", if (language == "de") {
        "Unternehmen:"
      } else {
        "Company:"
      })}],

    //  COMPANY ADRESS
    [#if not (at-dhbw) {
      stack(
        dir: ttb,
        for author in authors {
          let company-address = text([#author.company.name, #author.company.post-code, #author.company.city])
          if (author.company.country != "") {
            company-address+= text([, #author.company.country])
          }
          
          company-address
          linebreak()
        }
      )}],

    //  SUPERVISOR IN COMPANY
    [#if not (at-dhbw) {
      text(weight: "semibold", if (language == "de") {
        "Betreuer im Unternehmen:"
      } else {
        "Supervisor in the Company:"
    })}],

    [#if not (at-dhbw) {
      text[#supervisor]
    }]
  )
}