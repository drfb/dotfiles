setup:
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	cp ./vimrc ~/.vimrc
	cp ./zshrc ~/.zshrc
	cp ./gitconfig ~/.gitconfig
