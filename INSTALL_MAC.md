# Reinstall a Mac

## Apple Command Line tools

```bash
xcode-select --install
```

## Tools installed via `curl`

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

## dotfiles / dotfiles-private
Can only be transferred via USB stick from 1 laptop to a new laptop.

## Colorschemes

See https://rainglow.io/

gcl rainglow/vim
gcl rainglow/macdown
gcl rainglow/slack

For Emacs: https://github.com/daylerees/colour-schemes/tree/master/emacs

## Applications through `brew cask`

```bash
brew tap caskroom/cask
brew tap caskroom/versions
brew cask zap amazon-music

brew_cask_apps=(
  amazon-music
  appcleaner
  emacs
  firefox
  fluid
  google-backup-and-sync
  google-chrome
  intellij-idea-ce
  iterm2
  java
  keepingyouawake
  macdown
  macvim
  md5sha1sum
  postman
  psequel
  sequel-pro
  tableplus
  tunnelblick
  1password
  1password-cli
)

brew cask reinstall ${brew_cask_apps[@]}
```

## Tools through `brew`

```bash
brew tap Yleisradio/terraforms
brew install mu

brew_apps=(
  awscli
  chtf
  elixir
  go
  goreleaser
  gnupg
  hub
  ispell
  isync
  jq
  lynx
  openconnect
  pandoc
  pinentry-mac
  privoxy
  pyenv
  rbenv
  the_silver_searcher
  wget
)

brew install ${brew_apps[@]}

chtf 0.11.11
```

## Dependencies for `golang`

Following are proposed to be installed in order for golang to work properly in spacemacs (see https://github.com/syl20bnr/spacemacs/tree/master/layers/%2Blang/go):

```bash
go get -u -v github.com/kisielk/errcheck
go get -u -v github.com/nsf/gocode
go get -u -v github.com/rogpeppe/godef
go get -u -v github.com/dougm/goflymake
go get -u -v golang.org/x/tools/cmd/...
go get -u -v golang.org/x/tools/cmd/guru
go get -u -v golang.org/x/tools/cmd/gorename
go get -u -v golang.org/x/tools/cmd/goimports
```

## Fonts

```bash
git clone git@github.com:andreberg/Meslo-Font.git
git clone https://github.com/powerline/fonts.git --depth=1
```

## Applications via Apple App Store

Following links will redirect you to the app in the App Store:

- [Boxy](https://itunes.apple.com/de/app/boxy-for-inbox-by-gmail/id1053031090?l=en&mt=12)
- [YubiKey Personalization Tool](https://itunes.apple.com/de/app/yubikey-personalization-tool/id638161122?l=en&mt=12)

## Python

```
easy_install --user pip
pip install --user powerline-status
pip install --user git+https://github.com/makethunder/awsudo.git
pip install --user git+https://github.com/otype/aws-helpers
```

## Docker
Download [Docker for Mac](https://docs.docker.com/docker-for-mac/install/#download-docker-for-mac).
