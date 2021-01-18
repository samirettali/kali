#!/usr/bin/env bash

install_dotfiles() {
	git clone -q https://github.com/samirettali/dotfiles
	rm $HOME/.zshrc
	rm $HOME/.bashrc
	bash ./dotfiles/install.sh
}

cd ${HOME}

if [[ ! -f "${HOME}/.first-run" ]]; then
	touch "${HOME}/.first-run"

	echo "Looks like you are running this container for the first time."

	read -p "Do you want to download wordlists? (y/any) " answer
	case $answer in
			[Yy]* ) ./download-wordlists.sh ;;
	esac

	read -p "Do you want to install dotfiles? (y/any) " answer
	case $answer in
			[Yy]*) install_dotfiles ;;
	esac

	read -p "Do you want to set zsh as default? (y/any) " answer
	case $answer in
			# Exporting SHELL is needed as chsh does not update it immediately
			[Yy]* ) chsh -s /bin/zsh; export SHELL=/bin/zsh ;;
	esac

	echo "Have fun :)"
fi

while true; do
	${SHELL}
	read -p "Do you want to stop the container? (y/any) " answer
	case $answer in
			[Yy]* ) exit; break;;
	esac
done
