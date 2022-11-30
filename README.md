# dotfiles

personal dot files managed via [chezmoi](https://www.chezmoi.io/)

## install

```
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply https://github.com/jeffwindsor/dotfiles-chezmoi
```

## config 

```
$XDG_CONFIG_HOME/chezmoi/chezmoi.toml
```

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
