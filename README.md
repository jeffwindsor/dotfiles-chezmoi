# dotfiles

personal dot files managed via [chezmoi](https://www.chezmoi.io/)

## local config

* file: `$XDG_CONFIG_HOME/chezmoi/chezmoi.toml`

* sample contents:

```
[data]
  # Git
  name  = "Yahoo Serious"
  email = "serious@yahoo.com"

  # alacritty
  terminal_font_size  = 12
  terminal_opacity    = 0.98

[git]
  # auto commit the github repo
  autoCommit  = true
```
