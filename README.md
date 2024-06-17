# Supercharged DHBW

Unofficial [Typst](https://typst.app/) template for DHBW students.

You can see an example PDF [here](https://github.com/DannySeidel/typst-dhbw-template/blob/main/example.pdf).

## Usage

You can use this template in the Typst web app by clicking "Start from template" on the dashboard and searching for `supercharged-dhbw`.

Alternatively, you can use the CLI to kick this project off using the command

```shell
typst init @preview/supercharged-dhbw
```

Typst will create a new directory with all the files needed to get you started.

## Fonts

This template uses the following fonts:
- [Montserrat](https://fonts.google.com/specimen/Montserrat)
- [Open Sans](https://fonts.google.com/specimen/Open+Sans)

If you want to use typst locally, you can download the fonts from the links above and install them on your system.
Otherwise, when using the web version add the fonts to your project.

For further information on how to add fonts to your project, please refer to the [Typst documentation](https://typst.app/docs/reference/text/text/#parameters-font).

## Used Packages

This template uses the following packages:

- [codelst](https://typst.app/universe/package/codelst): To create code snippets
- [acrostiche](https://typst.app/universe/package/acrostiche): To manage acronyms


## Contents

- Title page
- Confidentiality Statement
- Declaration of Authorship
- List of figures
- List of tables
- Code snippets
- Table of contents
- Acronyms
- Abstract
- Bibliography
- Appendix

A more detailed explanation of the features can be found in the `main.typ` file.

## Configuration
This template exports the `supercharged-dhbw` function with the following named arguments:

`title`: Title of the document

`typeOfThesis` (optional*): The type of thesis (i.e. Project work, seminar paper, etc.).

`typeOfDegree` (optional*): The degree that is pursued (i.e. Bachelor of Science, Master of Engineering, etc.).

`timeOfProject`: The timeframe, in which the thesis was developed.

`authors`: List of authors with the following named arguments (example below):
    
    - name: Name of the author
    - student-id: Student ID of the author
    - course: Course of the author
    - course-of-studies: Course of studies of the author
    - company: Company of the author

`language`: Language of the document which is either `en` or `de`, default is `en`

`at-dhbw`: Whether the document is written at the DHBW or not, default is `false`

`show-confidentiality-statement`: Whether the confidentiality statement should be shown, default is `true`

`show-declaration-of-authorship`: Whether the declaration of authorship should be shown, default is `true`

`show-table-of-contents`: Whether the table of contents should be shown, default is `true`

`show-acronyms`: Whether the list of acronyms should be shown, default 
is `true`

`show-list-of-figures`: Whether the list of figures should be shown, default is `true`

`show-list-of-tables`: Whether the list of tables should be shown, default is `true`

`show-code-snippets`: Whether the code snippets should be shown, default is `true`

`show-appendix`: Whether the appendix should be shown, default is `false`

`show-abstract`: Whether the abstract should be shown, default is `true`

`show-header`: Whether the header should be shown, default is `true`

`numbering-style`: Style of the page numbering, default is `1 of 1`

`numbering-alignment`: Alignment of the page numbering, default is `center`

`abstract`: Content of the abstract

`appendix`: Content of the appendix

`acronyms`: Content of the acronyms

`university`: Name of the university

`university-location`: Campus or city of the university

`supervisor`: Name of the supervisor at the university or company

`date`: Date of the document

`bibliography`: path to the bibliography file

`logo-left`: Path to the logo on the left side of the title page

`logo-right`: Path to the logo on the right side of the title page

`logo-size-ratio`: Ratio between the right logo and the left logo height (left-logo:right-logo), default is `1:1`

(*) Optional parameters can be left out by giving an empty String (`""`) or `none`. The sheet format correspondingly.

If you want to change an existing project to use this template, you can add a show rule like this at the top of your file:

```typst
#import "@preview/supercharged-dhbw:1.3.0": *

#show: supercharged-dhbw.with(
  title: "Exploration of Typst for the Composition of a University Thesis",
  authors: (
    (name: "Juan Pérez", student-id: "1234567", course: "TIM21", course-of-studies: "Mobile Computer Science", company: (
      (name: "ABC AG", post-code: "08005", city: "Barcelona", country: "Spain")
    )),
    (name: "Max Mustermann", student-id: "7654321", course: "TIS21", course-of-studies: "IT-Security", company: (
      (name: "YXZ GmbH", post-code: "70435", city: "Stuttgart", country: "")
    )),
  ),
  language: "en", // en, de
  at-dhbw: false, // if true the company name on the title page and the confidentiality statement are hidden
  show-confidentiality-statement: true,
  show-declaration-of-authorship: true,
  show-table-of-contents: true,
  show-acronyms: true,
  show-list-of-figures: true,
  show-list-of-tables: true,
  show-code-snippets: true,
  show-appendix: false,
  show-abstract: true,
  show-header: true,
  numbering-style: "1 of 1", // https://typst.app/docs/reference/model/numbering
  numbering-alignment: center, // left, center, right
  abstract: abstract, // displays the abstract defined in the abstract.typ file
  appendix: appendix, // displays the appendix defined in the appendix.typ file
  acronyms: acronyms, // displays the acronyms defined in the acronyms.typ file
  university: "Cooperative State University Baden-Württemberg",
  university-location: "Ravensburg Campus Friedrichshafen",
  supervisor: "John Appleseed",
  date: datetime.today(),
  bibliography: bibliography("sources.bib"),
  logo-left: image("assets/logos/dhbw.svg"),
  // logo-right: image("assets/logos/company.svg"),
  // logo-size-ratio: "2:1" // ratio between the right logo and the left logo height (left-logo:right-logo) only the right logo is resized
)

// Your content goes here
```