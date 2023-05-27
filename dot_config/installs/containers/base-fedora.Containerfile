FROM registry.fedoraproject.org/fedora:38

# needed for copr enable
RUN dnf -y install 'dnf-command(copr)'

# standard base packages
RUN dnf -y install bat
RUN dnf -y install exa
RUN dnf -y install entr
RUN dnf -y install fd-find
RUN dnf -y install fortune-mod
RUN dnf -y install fzf
RUN dnf -y install ripgrep
RUN dnf -y install shellcheck
RUN dnf -y install tealdeer
RUN dnf -y install jetbrains-mono-fonts

# starship prompt
RUN dnf -y copr enable atim/starship
RUN dnf -y install starship

# list files - file manager
RUN dnf -y copr enable pennbauman/ports
RUN dnf -y install lf

# neovim
RUN dnf -y install gcc "gcc-c++" glibc-all-langpacks
RUN dnf -y install neovim
RUN git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

