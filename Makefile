all: index.html changelog.html

index.html: index.md header.html
	 sed "s/@@TIMESTAMP@@/$$(date)/" $< | pandoc -s -o $@ -H header.html

changelog.md: index.md
	$(HOME)/gitchangelog/bin/gitchangelog > $@

changelog.html: changelog.md
	pandoc -s $< -o $@ -H header.html
