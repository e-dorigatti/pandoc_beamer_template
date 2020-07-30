.PHONY: update

presentation.pdf: presentation.md presentation.bib presentation.template Makefile files/
	pandoc presentation.md --from markdown+raw_tex --to beamer -o presentation.pdf --slide-level 2 --wrap=preserve --standalone --filter=pandoc-citeproc --template presentation.template

watch:
	while true; do inotifywait -e modify,close_write,moved_to .; make presentation.pdf  ; done
