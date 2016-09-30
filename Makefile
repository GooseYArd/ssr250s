all: index.html

index.html: index.md header.html
	pandoc -s $< -o $@ -H header.html

changelog.md: index.md
	$(HOME)/gitchangelog/bin/gitchangelog > $@

changelog.html: changelog.md
	pandoc -s $< -o $@ -H header.html
