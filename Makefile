dirs:=$(shell fd -td -d1 .)

up:
	stow --stow ${dirs}

down:
	stow --delete ${dirs}

refresh:
	stow --restow ${dirs}

bootstrap:
	sudo dnf copr enable -y gourlaysama/ht-rust && \
	sudo dnf -y install                            \
	entr                                           \
	exa                                            \
	fd-find                                        \
	fzf                                            \
	git                                            \
	jetbrains-mono-fonts-all                       \
	make                                           \
	neovim                                         \
	python3-tmuxp                                  \
	sd                                             \
	starship                                       \
	stow                                           \
	direnv                                         \
	the_silver_searcher                            \
	tmux                                           \
	tree                                           \
	xsel                                           \
	yank                                           \
	zsh
