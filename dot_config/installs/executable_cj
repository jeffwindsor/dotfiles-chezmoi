#!/usr/bin/env bash
cd "$(dirname "${0}")"

#   
#   ███╗   ███╗ █████╗  ██████╗ ██████╗ ███████╗
#   ████╗ ████║██╔══██╗██╔════╝██╔═══██╗██╔════╝
#   ██╔████╔██║███████║██║     ██║   ██║███████╗
#   ██║╚██╔╝██║██╔══██║██║     ██║   ██║╚════██║
#   ██║ ╚═╝ ██║██║  ██║╚██████╗╚██████╔╝███████║
#   ╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝ ╚═════╝ ╚══════╝
#                                               

install() {
	if brew list $1 &> /dev/null; then
  		echo "==> "$1" [installed]"
	else
    	echo "==> "$1
    	brew install $1
    fi
}

install_cask() {
	if brew list --cask $1 &> /dev/null; then
  		echo "==> "$1" [installed]"
	else
    	echo "==> "$1
    	brew install --cask $1
    fi
}

clone-if-missing(){
    [[ ! -d $2 ]] && git clone https://github.com/${1}/${2}.git $2
}


##########################################################
read -r -p "Set zsh as default? [y/n] " response
response=${response,,}    # tolower
if [[ "$response" =~ ^(yes|y)$ ]]
then            
    sudo cat > /etc/shells <<EOL
/bin/sh
/usr/local/bin/bash
/usr/local/bin/fish
/usr/local/bin/zsh
EOL

    # set default shell
    chsh -s "$(which zsh)"
fi 

##########################################################
read -r -p "Add Homebrew? [y/n] " response
if [[ "$response" =~ ^(yes|y)$ ]]
then            
    xcode-select --install
    
    # homebrew
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    
    brew tap homebrew/core
    brew tap homebrew/cask
    brew tap homebrew/cask-fonts 
    brew tap homebrew/services
    brew tap railwaycat/emacsmacport
    #brew tap mas-cli/tap

    # apple store integration
    install mas
fi 

##########################################################
install bat
install exa
install fd
install fzf
install git
install neovim
#vimplug - neovim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim --headless +PlugInstall +qall
install ripgrep
install starship
install tldr
install topgrade
install zsh
install zsh-autosuggestions
install zsh-completions
install zsh-history-substring-search
install zsh-syntax-highlighting

brew tap InstantClientTap/instantclient
#install parquet-tools
install aws-cdk
install awscli
install awscli@1
install cassandra
install clojure
install kafka
install koekeishiya/formulae/skhd  && brew services start skhd
install maven
install maven-completion
install selenium-server-standalone

install_cask instantclient-basic
install_cask instantclient-sqlplus
install_cask intellij-idea
install_cask keybase
install_cask alacritty
install_cask alfred
install_cask Amethyst
install_cask firefox
install_cask font-fira-code-nerd-font
install_cask font-hack-nerd-font
install_cask font-jetbrains-mono-nerd-font
install_cask keepingyouawake
install_cask slack
install_cask spotify
install_cask whichspace

################################################################
echo "==> SDKMAN"
curl -s "https://get.sdkman.io" | bash

echo "==> initial source SDKMAN"
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk install java
skd install scala

################################################################
source ./shared/sshkeys
source ./shared/gitclones
