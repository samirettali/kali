#!/usr/bin/env bash

if [[ -f "${HOME}/.lock" ]]; 
	echo "Finish the setup before"
	exit
fi

touch "${HOME}/.lock"

install_dotfiles() {
	git clone -q https://github.com/samirettali/dotfiles
	rm $HOME/.zshrc
	rm $HOME/.bashrc
	bash ./dotfiles/install.sh
}

cd ${HOME}

if [[ ! -f "${HOME}/.first-run" ]]; then
	echo "Looks like you are running this container for the first time."

	read -p "Do you want to download wordlists? (y/any) " answer
	case $answer in
			[Yy]* ) ./download-wordlists.sh ;;
	esac

	read -p "Do you want to install dotfiles? (y/any) " answer
	case $answer in
			[Yy]*) install_dotfiles ;;
	esac

  # Exporting SHELL is needed as chsh does not update it immediately
	read -p "Do you want to set zsh as default? (y/any) " answer
	case $answer in
			[Yy]* ) chsh -s /bin/zsh;;
	esac

	touch "${HOME}/.first-run"

	echo "Have fun :)"
fi

rm "${HOME}/.lock"

shell=$(grep root /etc/passwd | sed 's/^.*://g')
exec ${shell}
