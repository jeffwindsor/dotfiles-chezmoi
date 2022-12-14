if [ -d /usr/local/opt/fzf ] # MACOS
then
  [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]] && export PATH="${PATH:+${PATH}:}/usr/local/opt/fzf/bin"
  [[ $- == *i* ]] && source "/usr/local/opt/fzf/shell/completion.zsh" 2> /dev/null
  source "/usr/local/opt/fzf/shell/key-bindings.zsh"

elif [ -d /usr/share/fzf/ ] # FEDORA
then
  source "/usr/share/fzf/shell/key-bindings.zsh"
fi
