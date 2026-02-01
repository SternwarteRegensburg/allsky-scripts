# Directories
SYSTEMD_SRC := systemd
BIN_SRC     := bin

SYSTEMD_DST := /etc/systemd/system
BIN_DST     := /usr/local/bin

# Files
SYSTEMD_FILES := $(wildcard $(SYSTEMD_SRC)/*.service $(SYSTEMD_SRC)/*.timer)
BIN_FILES     := $(wildcard $(BIN_SRC)/*.sh)

# Default target
.PHONY: all install uninstall clean

all: install

install: install-systemd install-bin

install-systemd: $(SYSTEMD_FILES)
	@mkdir -p $(SYSTEMD_DST)
	@install -m 0644 $^ $(SYSTEMD_DST)

install-bin: $(BIN_FILES)
	@mkdir -p $(BIN_DST)
	@install -m 0755 $^ $(BIN_DST)

uninstall:
	@rm -f $(addprefix $(SYSTEMD_DST)/,$(notdir $(SYSTEMD_FILES)))
	@rm -f $(addprefix $(BIN_DST)/,$(notdir $(BIN_FILES)))

clean:
	@true
