#let title(
  title: "",
  en-title: "",
  authors: (
    (
      name: "",
      en-name: "",
      organization: "",
      en-organization: "",
    ),
  ),
  title-size: 16pt,
  en-title-size: 9pt,
  author-size: 10.5pt,
  organization-size: 10.5pt,
  en-author-size: 9pt,
  en-organization-size: 9pt,
  default-size: 10.5pt,
) = [
  #place(
    top + center,
    scope: "parent",
    float: true,
    text(title-size, weight: "bold")[
      #title
      #footnote[
        #text(size: en-author-size)[#en-title]
      ] #label("title")
    ],
  )
  #place(
    top + center,
    scope: "parent",
    float: true,
    columns(
      authors.len(),
      gutter: 5pt,
    )[
      #for (i, author) in authors.enumerate() {
        text(size: author-size)[
          #author.name
        ]
        footnote[
          #text(size: en-author-size)[#author.en-name,]
          #text(size: en-organization-size)[#author.en-organization]
          #let nlabel = "title" + str(i)
          #label(nlabel)
        ]
        text(size: organization-size)[\ #author.organization \ ]
        colbreak()
      }
    ],
  )
  #place()[
    #counter(footnote).update(0)
    #hide()[
      #footnote[
        #text(size: en-title-size)[#en-title]
      ] @title
      #for (i, author) in authors.enumerate() {
        footnote[
          #text(size: en-author-size)[#author.en-name,]
          #text(size: en-organization-size)[#author.en-organization]
        ]
      }
    ]
  ]
]
