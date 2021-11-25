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
	bat                                            \
	direnv                                         \
	entr                                           \
	exa                                            \
	fd-find                                        \
	fzf                                            \
	gcc-c++                                        \
	git                                            \
	golang                                         \
	jetbrains-mono-fonts-all                       \
	kitty                                          \
	make                                           \
	neovim                                         \
	openssl-devel                                  \
	openssl                                        \
	python3-tmuxp                                  \
	sd                                             \
	starship                                       \
	stow                                           \
	the_silver_searcher                            \
	tig                                            \
	tmux                                           \
	tree                                           \
	xsel                                           \
	yank                                           \
	zlib-devel                                     \
	zsh
