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

Multiple shortcuts can be assigned to the same action, but not through the
Gnome UI. You have to use `dconf-editor`. Some of the interesting key bindings
are under `/org/gnome/desktop/wm/keybindings`.

To create dconf dumps:
```sh
dconf dump / > config/linux/dconf.backup
```
To load the dump:
```sh
dconf load / < config/linux/dconf.backup
```

### App-launching shortcuts

I'm using the [Run or raise](https://extensions.gnome.org/extension/1336/run-or-raise/) Gnome extension to set keyboard shortcuts for launching and switching to the windows of a couple of apps. The shortcuts are configured in `~/.config/run-or-raise/shortcuts.conf`.

```
<Super><Alt>Return,gnome-terminal,gnome-terminal-server,
<Super><Alt>c,google-chrome,google-chrome,
<Super><Alt>s,slack,Slack,
<Super><Alt>/,gvim,Gvim,
<Super><Alt>a,atom,atom,
<Super><Alt>x,code --enable-features=UseOzonePlatform --ozone-platform=wayland --enable-features=WaylandWindowDecorations,Code,
<Super><Alt>\,goland,jetbrains-goland,
```

Before using this extension, I was using the `dotfiles/scripts/win_focus.sh` script, but at first it didn't work for Wayland apps, and then on Ubuntu 23.10 I think it stopped workling altogether because `wmctrl -l` doesn't seem to work any more.
These are part of the dconf backup. They are also accessible in the Settings UI under Keyboard Shortcuts -> Custom Shortcuts.
I also played with [this other Gnome extention](https://extensions.gnome.org/extension/5021/activate-window-by-title/) but it's not as good as Run or Raise.

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
I have exported all the shortcuts in `extra/shortkeys-export.txt`

# Framework laptop

The screen resolution on the Framework is high, so I want to use "fractional scaling" in Gnome. When using Wayland, some applications look good under fractional scaling, but for X11 applications the text looks blury. Chrome and Electron applications are using X11 by default (Chrome, VS Code, Slack). I've managed to switch Chrome and VS Code, but not Slack:
- Chrome: go to chrome://flags and switch `Preferred Ozone platform` from `Default` to `auto`.
- VS Code: it needs to be started with `--enable-features=UseOzonePlatform --ozone-platform=wayland --enable-features=WaylandWindowDecorations`. To add these args to the link in the dock, I edited `/usr/share/applications/code.desktop`.

