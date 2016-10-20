### symlink example ###
```
ln -s ~/.dotfiles/bash/bash_profile ~/.bash_profile
```

#### Verify link ####
```
cd ~
ls -la | grep .-\>
```

### Neovim ###
ln -s ~/.dotfiles/neovim/* ~/.config/nvim
