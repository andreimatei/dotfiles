# Linux configuration

## Gnome

Disable the `Super` key from showing `Activities`. I'm using `Super + Space` for that. 
```
gsettings set org.gnome.mutter overlay-key ''
```

I'm using customized keyboard shortcut for:
- `Switch applications`
- `Switch windows of an app directly`
- `Show the activities overview`
- `View split on left` / `View split on right`
- `Toggle maximization state`

Multiple shortcuts can be assigned to the same action, but not through the Gnome UI. You have to use `dconf-editor`. Some of the interesting key bindings are under `/org/gnome/desktop/wm/keybindings`.

### App-launching shortcuts

These are part of the dconf backup.

- Launch/focus on Chrome: `Super+Alt+C` - `~/dotfiles/scripts/win_focus.sh chrome /opt/google/chrome/chrome`
- Launch/focus on Konsole: `Super+Alt+Enter` - `~/dotfiles/scripts/win_focus.sh konsole konsole`
- Focus on Goland: `Super+Alt+\` - `~/dotfiles/scripts/win_focus.sh Goland`
- Focus on Gvim: `Super+Alt+/` - `~/dotfiles/scripts/win_focus.sh Gvim`
- Launch/focus on Slack: `Super+Alt+Enter` - `~/dotfiles/scripts/win_focus.sh Slack slack`
- Launch/focus on Atom: `Super+Alt+a` - `~/dotfiles/scripts/win_focus.sh Atom atom`

### Custom key map for Dell XPS laptop

I've made Gnome load a custom key map on session startup. See
`xkbmap-arrows-dell{.diff}`.  
To load it on startup, I've added a startup app with
`gnome-session-properties`: `xkbcomp
/home/andrei/dotfiles/config/xkbmap-arrows-dell ":0"`. This is what
`xkbcomp.desktop`, which needs to be symlinked in `.config/autostart`.

## Chrome
I use [Shortkeys](https://chrome.google.com/webstore/detail/shortkeys-custom-keyboard/logpjaacgmcbpdkdchjiaagddngobkck) to configure tab next/prev shortcuts and to remap ctrl+shift+c from opening Dev Tools to copy to clipboard.
The tab shortcuts are configured from [chrome://extensions/shortcuts](chrome://extensions/shortcuts).  
`Ctrl+Shift+c` is configured as described [here](https://askubuntu.com/questions/604434/chrome-disable-or-change-keyboard-shortcut-ctrlshiftc-developer-tools-console/991632#991632?newreg=9711ffc8ba2b4e349e87efa4b2fd3542).

