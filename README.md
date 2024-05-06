# DHBW Thesis

Unofficial [Typst](https://typst.app/) template for DHBW students.

The template is currently only available in English.

This template includes the package [codelst](https://github.com/jneug/typst-codelst), to display code snippets.

## Contents

- Title page
- Confidentiality Statement
- Declaration of Authorship
- List of figures
- List of tables
- Code snippets
- Table of contents
- Abstract
- Bibliography

A more detailed explanation of the features can be found in the `main.typ` file.

## Configuration
This template exports the dhbw-thesis function with the following named arguments:

`title`: Title of the document

`authors`: List of authors with the following named arguments:
    
    - name: Name of the author
    - student-id: Student ID of the author
    - course: Course of the author
    - course-of-studies: Course of studies of the author
    - company: Company of the author

`at-dhbw`: Whether the document is written at the DHBW or not, default is false

`show-confidentiality-statement`: Whether the confidentiality statement should be shown, default is true

`show-declaration-of-authorship`: Whether the declaration of authorship should be shown, default is true

`show-table-of-contents`: Whether the table of contents should be shown, default is true

`show-acronyms`: Whether the list of acronyms should be shown, default 
is true

`show-list-of-figures`: Whether the list of figures should be shown, default is true

`show-list-of-tables`: Whether the list of tables should be shown, default is true

`show-code-snippets`: Whether the code snippets should be shown, default is true

`show-bibliography`: Whether the bibliography should be shown, default is true

`show-appendix`: Whether the appendix should be shown, default is false

`show-abstract`: Whether the abstract should be shown, default is true
`abstract`: Content of the abstract

`university`: Name of the university

`university-location`: Campus or city of the university

`supervisor`: Name of the supervisor at the university or company

`date`: Date of the document

`logo-left`: Path to the logo on the left side of the title page

`logo-right`: Path to the logo on the right side of the title page

## Examples

The `main.typ` file in the root folder contains an example document.
A compiled pdf (`example.pdf`) can be found in the root folder as well.