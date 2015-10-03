FACES = sans-serif serif monospace
.PHONY: all $(FACES)

all: $(FACES)

$(FACES): %: generated/%.conf

generated/%.conf: %.list
	@mkdir -p $(@D)
	./list2conf $* <$< >$@
