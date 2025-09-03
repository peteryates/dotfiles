dirs:=$(shell fd -td -d1 .)

up:
	stow --stow ${dirs}

down:
	stow --delete ${dirs}

refresh:
	stow --restow ${dirs}

bootstrap:
	mkdir -p ~/projects &&                         \
	mkdir -p ~/bin &&                              \
	sudo dnf -y install                            \
	bat                                            \
	btop                                           \
	direnv                                         \
	entr                                           \
	fd-find                                        \
	fish                                           \
	fzf                                            \
	gcc-c++                                        \
	git                                            \
	git-delta                                      \
	gh                                             \
	golang                                         \
	jetbrains-mono-fonts-all                       \
	kitty                                          \
	libyaml-devel                                  \
	make                                           \
	neovim                                         \
	openssl-devel                                  \
	openssl                                        \
	python3-tmuxp                                  \
	postgresql                                     \
	postgresql-contrib                             \
	postgresql-server                              \
	moreutils-parallel                             \
	redis                                          \
	stow                                           \
	the_silver_searcher                            \
	tig                                            \
	tmux                                           \
	xh                                             \
	xsel                                           \
	yank                                           \
	zlib-devel                                     \

gh-cli:
	sudo dnf config-manager addrepo --from-repofile=https://cli.github.com/packages/rpm/gh-cli.repo

ht-rust:
	sudo dnf copr enable -y gourlaysama/ht-rust

fix-weak-deps:
	sudo echo "install_weak_deps=False" >> /etc/dnf/dnf.conf
