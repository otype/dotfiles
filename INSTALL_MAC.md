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

## dotfiles
Can only be transferred via USB stick from 1 laptop to a new laptop.

## Applications through `brew cask`

```bash
brew tap caskroom/cask
brew tap caskroom/versions
brew cask zap amazon-music

brew_cask_apps=(
  amazon-music
  appcleaner
  firefox
  fluid
  gitx
  google-backup-and-sync
  google-chrome
  hipchat
  intellij-idea-ce
  iterm2
  java
  java8
  keepassx
  keepingyouawake
  macvim
  maOBrked
  postman
  psequel
  tunnelblick
  1password
)

brew cask reinstall ${brew_cask_apps[@]}
```

## Tools through `brew`

```bash
brew tap Yleisradio/terraforms
brew tap d12frosted/emacs-plus && brew install emacs-plus

brew_apps=(
  asdf
  chtf
  dep
  elixir
  golang
  hub
  ispell
  jq
  node
  openconnect
  privoxy
  pyenv
  rbenv
  the_silver_searcher
  wget
)

brew install ${brew_apps[@]}

chtf 0.8.8
```

## Fonts

```bash
git clone git@github.com:andreberg/Meslo-Font.git
git clone https://github.com/powerline/fonts.git --depth=1
```

## Applications via Apple App Store

Following links will redirect you to the app in the App Store:

- [amphetamine](https://itunes.apple.com/de/app/amphetamine/id937984704?l=en&mt=12)
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
