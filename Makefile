all: index.html

index.html: index.md header.html
	pandoc -s $< -o $@ -H header.html
