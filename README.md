> [!warning]
> This is **NOT** a community facing dotfiles repo;  
> using my biased keybinds, workspaces etc.  
> all in combination with my custom keyboard binds
> 
> But feel free to adapt the syntax/logic to how you see fit.

## What is this?
1) Dotfiles, using GNU stow
2) Boostrapping, for installing essential AND/OR extra packages

## [1/2] Dotfiles
Dotfile structure based on **symlink farm manager [GNU Stow](https://www.gnu.org/software/stow/)**.<br>
Watch [this video](https://youtu.be/NoFiYOqnC4o?si=IwDg7Sd0f2mg0v-r&t=480) to get a brief explanation on how to use `stow`.

For every warning you get per target file **stow** wants to replace with a symlink:
* Remove target
* Temporarily move target
* Adapt your file into mine, then delete target  
```bash
stow -d stow -t ~ *            # All
stow -d stow -t ~ hypr waybar  # Selection based
```

## [2/2] Packages
WIP
