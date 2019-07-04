LOCAL_INSTALL_PATH = ${HOME}/.local/bin

default:
	@echo "No default target. Use make install_local to install to ${LOCAL_INSTALL_PATH}"
	@exit 2
.PHONY: default

install_local: $(LOCAL_INSTALL_PATH)/rl
.PHONY: install_local

$(LOCAL_INSTALL_PATH)/rl : rl | $(LOCAL_INSTALL_PATH)
	cp rl $@

$(LOCAL_INSTALL_PATH):
	mkdir -p $@

