# Typst Expert Knowledge for Book Publishing

## Overview
Typst is a modern markup-based typesetting system designed as an alternative to LaTeX and word processors. It's particularly powerful for creating books, academic papers, and professional documents.

## Core Concepts

### 1. Template Creation
Templates in Typst are functions that wrap entire documents, allowing for reusable and configurable document styling.

#### Basic Template Structure
```typst
#let conf(
  title: none,
  authors: (),
  doc,
) = {
  // Page setup
  set page(paper: "a5", margin: 2cm)
  
  // Text formatting
  set text(font: "Libertinus Serif", size: 11pt)
  
  // Paragraph settings
  set par(justify: true)
  
  // Apply the document content
  doc
}

// Usage
#show: doc => conf(title: [My Book], doc)
```

#### Advanced Template Features
- **Parameters with defaults**: Use named arguments with sensible defaults
- **Dynamic content**: Use `.map()` for iterating over collections
- **Spread operator**: Use `..` for flexible argument handling
- **Separate files**: Store templates in `.typ` files for reusability

### 2. Styling System

#### Set Rules
Control element appearance by modifying default parameters:
```typst
#set heading(numbering: "1.")
#set text(font: "Libertinus Serif", size: 12pt)
#set par(justify: true, leading: 0.65em)
#set page(margin: (x: 2cm, y: 3cm))
```

#### Show Rules
Transform how elements are displayed:
```typst
// Center and style level 1 headings
#show heading.where(level: 1): it => {
  pagebreak()
  v(2cm)
  set align(center)
  set text(size: 24pt, weight: "bold")
  it
  v(1cm)
}

// Style emphasized text
#show emph: it => text(style: "italic", fill: rgb("#4A5568"), it)
```

### 3. Page Layout for Books

#### Page Setup
```typst
set page(
  paper: "a5",  // Common book size
  margin: (
    top: 2.5cm,
    bottom: 3cm,
    inside: 2cm,   // For bound edge
    outside: 1.5cm
  ),
  header: [#h(1fr) #counter(page).display()],
  footer: [#text(size: 9pt, fill: gray)[Chapter Title]]
)
```

#### Headers and Footers
```typst
// Dynamic headers showing chapter names
set page(
  header: context {
    if calc.odd(here().page()) {
      align(right)[_#current-heading()_]
    } else {
      align(left)[_Book Title_]
    }
  }
)
```

### 4. Book-Specific Features

#### Chapter Styling
```typst
#show heading.where(level: 1): it => {
  pagebreak(weak: true)
  v(3cm)
  block[
    #set align(center)
    #set text(size: 28pt)
    Chapter #counter(heading).display()
    #linebreak()
    #text(size: 24pt)[#it.body]
  ]
  v(2cm)
}
```

#### Table of Contents
```typst
#outline(
  title: "Contents",
  indent: auto,
  depth: 2
)
```

#### Page Breaks
```typst
#pagebreak()  // Force new page
#pagebreak(weak: true)  // New page only if content follows
```

### 5. Typography Best Practices

#### Font Selection
```typst
set text(
  font: ("Libertinus Serif", "Linux Libertine", "serif"),
  size: 11pt,
  hyphenate: true,
  lang: "es"  // Spanish hyphenation
)
```

#### Paragraph Formatting
```typst
set par(
  justify: true,
  first-line-indent: 1em,
  leading: 0.65em,  // Line spacing
  spacing: 1em      // Space between paragraphs
)
```

### 6. Images in Books
```typst
// Centered images with captions
#figure(
  image("path/to/image.jpg", width: 80%),
  caption: [Image caption here]
)

// Custom image styling
#show figure: it => {
  set align(center)
  v(1em)
  it
  v(1em)
}
```

### 7. Advanced Book Template Example
```typst
#let book(
  title: "Untitled",
  author: "Anonymous",
  chapters: (),
  doc,
) = {
  // Metadata
  set document(title: title, author: author)
  
  // Page setup
  set page(
    paper: "a5",
    margin: (inside: 2.5cm, outside: 2cm, y: 2.5cm),
    header: context {
      if counter(page).get().first() > 1 {
        if calc.odd(here().page()) {
          align(right)[_#title_]
        } else {
          align(left)[_#author_]
        }
      }
    },
    footer: context {
      let page-num = counter(page).get().first()
      if page-num > 1 {
        align(center)[#page-num]
      }
    }
  )
  
  // Typography
  set text(font: "Libertinus Serif", size: 11pt, lang: "es")
  set par(justify: true, first-line-indent: 1em)
  
  // Heading styles
  show heading.where(level: 1): it => {
    pagebreak(weak: true)
    v(3cm)
    set align(center)
    set text(size: 24pt)
    it
    v(2cm)
  }
  
  show heading.where(level: 2): it => {
    v(1em)
    set text(size: 16pt)
    it
    v(0.5em)
  }
  
  // Front matter
  align(center + horizon)[
    #text(size: 32pt, weight: "bold")[#title]
    #v(2cm)
    #text(size: 18pt)[#author]
  ]
  
  pagebreak()
  
  // Table of contents
  outline(title: "Índice", indent: auto)
  
  pagebreak()
  counter(page).update(1)
  
  // Main content
  doc
}
```

### 8. Special Markers for Your Project

Your project uses special markers that get converted:
- `SALTODEPAGINA` → `#pagebreak()`

You could add more markers:
```typst
// In your sed replacements:
// CAPITULO:Title → #heading(level: 1)[Title]
// SECCION:Title → #heading(level: 2)[Title]
// CENTRAR:text → #align(center)[text]
```

### 9. Tips for Professional Book Publishing

1. **Consistent Spacing**: Use `v()` for vertical spacing instead of empty lines
2. **Smart Quotes**: Enable with `set smartquote(enabled: true)`
3. **Hyphenation**: Set language for proper hyphenation rules
4. **Widows/Orphans**: Control with `set par(orphans: 3, widows: 3)`
5. **Small Caps**: Use `#smallcaps[text]` for elegant typography
6. **Drop Caps**: Create with custom show rules for first letter

### 10. Debugging and Development

```typst
// Show layout guides
#set page(margin: (x: 2cm, y: 3cm), fill: rgb("#f0f0f0"))

// Debug element properties
#context [
  Current page: #here().page()
  Page dimensions: #page.width × #page.height
]
```

## Integration with Your Project

To enhance your current setup:

1. **Enhance conf.typ**:
```typst
#let conf(
  title: none,
  author: none,
  doc,
) = {
  set page("a5", margin: (inside: 2.5cm, outside: 2cm, y: 2.5cm))
  set text(font: "Libertinus Serif", lang: "es", hyphenate: true)
  set par(justify: true, first-line-indent: 1em)
  set smartquote(enabled: true)
  
  // ... rest of your styling
  
  doc
}
```

2. **Add to crear_pdf.sh**:
- Support for metadata extraction from Markdown frontmatter
- Multiple output formats (print vs digital)
- Automatic TOC generation

This knowledge base provides the foundation for creating professional book templates in Typst.