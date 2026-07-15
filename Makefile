MAIN = main
PDF  = $(MAIN).pdf
MD   = framework-eval-llm-cs-doc.md

.PHONY: all clean

all: $(PDF) $(MD)

$(PDF): $(MAIN).tex
	latexmk -xelatex -interaction=nonstopmode $(MAIN).tex

$(MD): $(PDF)
	python3 -c "import pymupdf4llm; md = pymupdf4llm.to_markdown('$(PDF)'); open('$(MD)', 'w').write(md)"
	@echo "✔ framework-eval-llm-cs-doc.md actualizado"

clean:
	latexmk -C
	rm -f $(MD)