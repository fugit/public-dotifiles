# README for future fugit

## TODO

1. **DONE**: volume
1. **DONE**: fzf
1. **DONE**: zoxide (z) needed some re-working
1. **DONE**: git setup including aliases
1. **MOVED**: ssh key setup
1. **DONE**: ssh-keychain setup
1. **DONE**: dotfile aliases
1. **DONE**: ranger
1. **DONE**: stow
1. **DONE**: ansible (remove debian?)
1. **DONE**: nvim
1. DONE: sensitve data to sub module; feels buggy...
1. DONE: ssh-add w pass
1. DONE: screen sharing
1. DONE: Generate [public-dotfiles][public-dotfiles]

### Move to sub module

- **DONE**: was finicky and never seemed to work well.
  - gitconfig
  - ssh [config,keys,auth...]
  - pass (linux pass manager) already done
    - use pass to auth ssh-keys
    - pass moved to submodule
    - ended up having to use private repo in this repo
      - using the public one here and overriding was causing issues.
    - attempting to use local config for private repo
      - have public repo in .gitmodules.
      - this is in testing.

```bash
git config submodule.pass.url <PRIAVE_URL>
git config submodule.pass.path pass/.password-store
rm -rf .git/module/pass
echo "...?below?"
git rm pass
git submodule --init --recursive
```

## TMUX

- **DONE**: should likely update tmux config back to much cooler fugit version.
- **DONE**: rv178 is working for now but really should be replaced.
- **DONE**: powerline weeee
- [rv178-dotfiles][rv178-dotfiles]

## foot

- foot is good as is from rv178

## alacritty

- **DONE**: Is good

## Ghostty

- **DONE**: new term is nice, some small complaints
  - no app version in waybar
  - no app border in river

## nvim

- using lazynvim
- pulled from my other repo with some improvements
- latest version is working well.

## rofi

- mostly used old setup with some font updates.

## Browser

- set Browser
- ended up writing a rofi call for it
- required packages added
  - along with new packages
- Also wrote a bookmark picker

```bash
echo "below got it working... added missing items to river init/process"
export XDG_CURRENT_DESKTOP=river
export XDG_SESSION_DESKTOP=river
systemctl --user import-environment XDG_CURRENT_DESKTOP XDG_SESSION_DESKTOP XDG_SESSION_TYPE
echo "Below is how to test, maybe make it a rofi..."
xdg-settings check default-web-browser firefox.desktop
xdg-settings set default-web-browser firefoxdeveloperedition.desktop
xdg-settings --list
xdg-settings check default-web-browser firefoxdeveloperedition.desktop
echo "Get current Browser"
xdg-settings get default-web-browser
echo "Set FireFox Developer Edition Browser"
xdg-settings set default-web-browser firefoxdeveloperedition.desktop
echo "Set Brave Browser"
xdg-settings set default-web-browser brave-browser.desktop
```

## Safeeyes

- Safeeyes is a good generic isr monitor.
  - Still missing tracking keyboard and mouse...wayland issue
  - had to switch version from `aur/safeeyes-git` to `aur/safeeyes`
    - was crashing with git version...
  - additional package helped
    - wlrctl

## Screenshare

- Finally got this working
  - A list of the required packages below
  - Also had to add a restart to process.sh
  - required additional package was `xdg-desktop-portal-wlr`, the magic
  - also dependent on app provider such as zoom this support has been spotty.
    - as of `zoom 6.3.6-1` it has been working

```txt
wireplumber
xdg-desktop-portal
xdg-desktop-portal-gtk
xdg-desktop-portal-wlr
```

## Zoxide

- [github-aj-zoxide] [github-aj-zoxide]
- Finally figured out issue.

  - Old setup was using \_fz
  - zoxide has different format for using fzf search.
  - correct cmd `z path<space>+<TAB>` is fzf search
  - correct cmd `zi path<space>+<TAB>` is fzf selection

- Below for debugging really helped

```bash
echo "use type and pathing"
type z
z is a function
z ()
{
    __zoxide_z "$@"
}
type __zoxide_z
```

## Generate Public Dotfiles

- purge
  - .git
  - ranger (just purge yazi is way better)
  - ssh
- cleanup
  - git/.config/git/config (rm address/name)
  - .gitmodules private repo

```bash
echo "cleanup"
cat git/.config/git/config  | sed 's/example@gmail.com/example@fugit.com/g' \
| sed 's/example/Chad S/' | head
echo "dirs to remove"
DROP_DIRS="ranger ssh"
```

## LINKS

- [dotfiles-ansible-stow-public][dotfiles-ansible-stow-public]
- [github-aj-zoxide][github-aj-zoxide]
- [mozilla-webrtc-test-screenshare][mozilla-webrtc-test-screenshare]
- [nerdfont-cheat-sheet][nerdfont-cheat-sheet]
- [public-dotfiles][public-dotfiles]
- [rv178-dotfiles][rv178-dotfiles]
- [stack-ssh-add-w-pass][stack-ssh-add-w-pass]

<!-- Identifiers, in alphabetical order -->

[dotfiles-ansible-stow-public]: https://github.com/fugit/public-dots-ansible-stow
[github-aj-zoxide]: https://github.com/ajeetdsouza/zoxide
[mozilla-webrtc-test-screenshare]: https://mozilla.github.io/webrtc-landing/gum_test.html
[nerdfont-cheat-sheet]: https://www.nerdfonts.com/cheat-sheet
[public-dotfiles]: https://github.com/fugit/public-dotifiles
[rv178-dotfiles]: https://github.com/rv178/.dotfiles
[stack-ssh-add-w-pass]: https://unix.stackexchange.com/questions/585782/how-can-i-have-ssh-add-query-pass-the-password-manager-for-passwords-when-it-a
