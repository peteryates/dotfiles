dirs:=$(shell fd -td -d1 .)

up:
	stow --stow ${dirs}

down:
	stow --delete ${dirs}

refresh:
	stow --restow ${dirs}

bootstrap:
	sudo dnf install           \
		make                     \
		neovim                   \
		stow direnv              \
		the_silver_searcher      \
		fd-find                  \
		fzf                      \
		entr                     \
		tree                     \
		tmux                     \
		python3-tmuxp            \
		exa                      \
		zsh                      \
		git                      \
		git-delta                \
		jetbrains-mono-fonts-all \
		zsh                      \
		yank                     \
		sd                       \
		starship
