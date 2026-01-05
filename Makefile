all: help

help:
	@printf "\n\033[1;35m───── Dots — Multi-Distro Bootstrap ─────\033[0m\n"
	@printf "\n\033[1;35m──── Usage \033[0m"
	@printf "\n\033[1;35m─── make install: run the install script \033[0m"
	@printf "\n\033[1;35m─── make get: run the online install script \033[0m"
	@printf "\n\033[1;35m─── make check: run basic sanity checks \033[0m"
	@printf "\n\033[1;35m─── make nix: use nix flakes to install(if applicable) \033[0m"
	@printf "\n\033[1;35m─── make tree: show repo structure \033[0m"
	@printf "\n\033[1;35m─── make clean: remove generated files(safe) \033[0m"

install:
	@./scripts/posix/install.sh

get:
	@./get

check:
	@bash scripts/bash/detect_os.sh
	@python3 scripts/python/detect_os.py

nix:
	@printf "\n\033[1;35m─── Nix support is experimental \033[0m\n"
	@nix flake show

tree:
	@command -v eza >/dev/null && eza --tree || tree

clean:
	@printf "\n\033[1;35m─── nothing to clean(symlink-based setup) \033[0m\n"

.PHONY: help install get check nix clean tree all