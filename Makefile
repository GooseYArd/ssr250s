all: index.html changelog.html $(PREVIEWS)

IMAGES := $(filter-out $(wildcard small_*.jpg),$(wildcard *.jpg))
PREVIEWS := $(addprefix small_,$(IMAGES))

foo:
	echo $(PREVIEWS)

index.html: index.md header.html
	 sed "s/@@TIMESTAMP@@/$$(date)/" $< | pandoc -s -o $@ -H header.html

changelog.md: index.md
	$(HOME)/gitchangelog/bin/gitchangelog > $@

changelog.html: changelog.md
	pandoc -s $< -o $@ -H header.html


small_%.jpg: %.jpg
	convert -resize 640x480 $< $@
