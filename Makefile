PREFIX ?= /usr/local

default:
	@echo "No default target."
	@echo "Use make install to install to $(PREFIX)"
	@echo "Set the PREFIX variable to change this path"
	@exit 2
.PHONY: default

install: $(PREFIX)/bin/rl $(PREFIX)/bin/rlmk
.PHONY: install

$(PREFIX)/bin/%: % | $(PREFIX)/bin/
	install $* $(PREFIX)/bin/

$(PREFIX)/bin/:
	mkdir -p $@

rl rlmk:
	$(error missing file "$@")

push:
	git remote | xargs -n1 git push
.PHONY: push
