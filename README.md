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

## Chrome
I use [Shortkeys](https://chrome.google.com/webstore/detail/shortkeys-custom-keyboard/logpjaacgmcbpdkdchjiaagddngobkck) to configure tab next/prev shortcuts and to remap ctrl+shift+c from opening Dev Tools to copy to clipboard.
The tab shortcuts are configured from [chrome://extensions/shortcuts](chrome://extensions/shortcuts).  
`Ctrl+Shift+c` is configured as described [here](https://askubuntu.com/questions/604434/chrome-disable-or-change-keyboard-shortcut-ctrlshiftc-developer-tools-console/991632#991632?newreg=9711ffc8ba2b4e349e87efa4b2fd3542).
