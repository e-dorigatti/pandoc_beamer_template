# Pandoc Beamer Template

Convert a markdown file to PDF slides based on [Beamer][bm].

See the source markdown in [presentation.md](presentation.md) and the resulting
slides in [presentation.pdf](presentation.pdf).

## Usage

The slides can be generated via `make`, which in turn will call [pandoc][pdc]
(see the [Makefile](Makefile) for the specifics). I am sorry for you if you are
on Windows.

To automate the edit-compile-view slide development loop, use `make watch`,
which will automatically generate the slides whenever a file is modified.
This functionality requires [inotofy tools][int].

## Citations

Things to be cited are in the file [presentation.bib](presentation.bib).

By default, citations are processed by [pandoc-citeproc][pcp], not bib(la)tex,
and specified as `[@entry_name]`. The citation style can be changed in the
header of the markdown file (`citation-style`); it requires a [CSL
specification][csl] file (e.g., the included
[vancouver-brackets.csl](vancouver-brackets.csl)). CSL files for common
bibliography formats can be downloaded from [here][csllist].

If you prefer to use natbib to handle citations, add the following snipped to
the header in the presentation:

```
natbib: yes
natbiboptions: round
biblio-style: plainnat
```

The `natbiboptions` entry specifies options when loading the package; in this
example, natbib will be loaded as `\usepackage[round]{natbib}`, while the
`biblio-style` option will be used within `\bibliographystyle`.

If you prefer biblatex rather than natbib, use:

```
biblatex: yes
biblatexoptions: backend=biber
```

Where the `biblatexoptions` are again used when loading the package.

## Compilation to latex

As it is, the project uses `pandoc` to directly generate the pdf file without
producing the intermediate tex output. If you would like to have that, for
example to debug latex issues, or if you want the latex file to be compiled in a
certain way, you can modify the [Makefile](Makefile) in one of two ways.

The first option is to change the output format to tex in the
[Makefile](Makefile), i.e. change `-o presentation.pdf` to `-o
presentation.tex`. This is a quick-and-dirty solution to debug minor issues.

To customize the latex compilation, first follow the step above to generate the
latex file, then add a second target to the makefile, for example:

```
presentation.pdf: presentation.tex
	latexmk -f -latexoption="--interaction=nonstopmode" presentation.tex

presentation.tex: presentation.md presentation.bib presentation.template Makefile files/
	pandoc presentation.md --to beamer -o presentation.tex  # ... etc
```

## Custom latex code

You can include custom code in the latex header, for example to define commands
or import additional packages, by modifying the [header.tex](header.tex) file.

## Template

The latex file is generated by rendering the [template](presentation.template),
which is a slightly modified version of the one that comes with pandoc. If you
have particular latex or beamer needs beyond what can be achieved by adding
things to the header, modify this template.


 [bm]: https://en.wikibooks.org/wiki/LaTeX/Presentations
 [pdc]: https://pandoc.org/
 [int]: https://github.com/inotify-tools/inotify-tools/wiki
 [pcp]: https://github.com/jgm/pandoc-citeproc
 [csl]: https://citationstyles.org/
 [csllist]: https://www.zotero.org/styles
