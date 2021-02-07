dirs:=$(shell fd -td -d1 .)
up:
	stow --stow ${dirs}

down:
	stow --delete ${dirs}

refresh:
	stow --restow ${dirs}
