# JJ's dotfiles for Sway and Arch Linux

This is my new dotfiles repository.  Originally I had a bare git repository for my dotfiles.  However I have several machines and not all my dotfiles need to be installed on each one.  I switched to using GNU Stow (or XStow) to manage my dotfiles.  

There is a setup.sh in the _setup directory that will installed the base apps (i.e git, zsh, etc) and any others you enter as arguments.  To install an individual app run `stow -Rvt $HOME --no-folding --dotfiles appname` in the main dotfiles directory. 

## Main Software

- Distribution: Arch Linux
- Filesystem: ZFS
- Security: App Armor, Firejail
- Window manager: sway
- Status bar: waybar
- Status bar indicators: redshift,blueman,qsyncthing
- Notifications: mako
- Menu: wofi (rofi for font awesome)
- Terminal: kitty
- Shell: zsh (zplugin manager)
- File manager: ranger
- Editor: nvim
- Browsers: Firefox and qutebrowser
- PDF viewer: zathura
- Email: Thunderbird (looking at mutt)
- Video player: mpv

