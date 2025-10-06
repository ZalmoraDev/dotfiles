Here follows a brief summary on stowing these configuration files. If you want to clone and use these, you should remove your own config files,
and then use `stow <DIRNAME>` within this folder on which file(s) you want to use. Or take elements you like by editing your own configs.

1) Use `mkdir -p` with the name of the first dir being your choice (like hypr, sddm, waybar),
followed by the path relative to the location of this dotfiles directory, or absolute to the filesystem root.
A 'dotfiles' directory is normally stored at ~/dotfiles, so for hyprland and it's hyprcomponents, you can do something like:
`cd ~/dotfiles`
`mkdir -p hypr/.config/hypr/`
See how the first dir 'hypr' is what the `stow` command will use for the subsequent paths (it does not need to be named something specific)


2) Use `mv` to move the files you want to stow to the dotfiles-dir's equaivalant folder structure.
To store multiple of the hypr components, you can do something like:
`mv ~/.config/hypr/hypridle.conf ~/dotfiles/hypr/.config/hypr/`
`mv ~/.config/hypr/hyprland.conf ~/dotfiles/hypr/.config/hypr/`
`mv ~/.config/hypr/hyprlock.conf ~/dotfiles/hypr/.config/hypr/`
OR
`mv ~/.config/hypr/*.conf ~/dotfiles/hypr/.config/hypr/`


3) Then use `stow <DIRNAME>`, which creates a symlink for each file (2) found in the relative path to the dotfiles directory(1)
Or use `sudo stow -t <DIRNAME>` to stow files from a different directory TARGET, like root '/' (/etc, /usr etc.)
If done correct, you should have symlinks at the original location(s) pointing to your folder/files in your 'dotfiles' directory.

Backup your own files, and mind that this is just a brief summary.
You use Linux so docs and man pages shouldn't be a problem :)

<p align="center">
  <img src="./skull131.gif" alt="Skull">
</p>
