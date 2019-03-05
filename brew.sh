#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew.
brew update

# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
brew install gnu-tar
brew install gnu-time
# Install Bash 4.
brew install bash
brew install bash-completion2
# We installed the new shell, now we have to activate it
echo "Adding the newly installed shell to the list of allowed shells"
# Prompts for password
sudo bash -c 'echo /usr/local/bin/bash >> /etc/shells'
# Change to the new shell, prompts for password
chsh -s /usr/local/bin/bash

# Install `wget` with IRI support.
brew install wget --with-iri

# Install Python
brew install python
brew install python@2
brew install pipenv

# Install Elixir
brew install erlang
brew install elixir

# Install HashiCorp tools
brew install consul
brew install terraform
brew install terraform-docs
brew install vault

# Install more recent versions of some OS X tools.
brew install vim --override-system-vi
brew install git
brew install grep
brew install openssh
brew install rsync
brew install screen

# Install other useful binaries.
brew install asciinema
brew install htop
brew install jq
brew install mtr
brew install nmap
brew install p7zip
brew install pandoc
brew install pigz
brew install pkg-config libffi
brew install pv
brew install pwgen
brew install readline
brew install socat
brew install tree
brew install wget
brew install xz

# Core casks
brew cask install --appdir="/Applications" iterm2
brew cask install --appdir="/Applications" java

# Misc casks
brew cask install --appdir="/Applications" filezilla
brew cask install --appdir="/Applications" google-chrome
brew cask install --appdir="/Applications" gpg-suite
brew cask install --appdir="/Applications" jetbrains-toolbox
brew cask install --appdir="/Applications" skype
brew cask install --appdir="/Applications" slack
brew cask install --appdir="/Applications" teamviewer
brew cask install --appdir="/Applications" textual

# Install Docker, which requires virtualbox
brew cask install --appdir="/Applications" virtualbox
brew install docker

# Remove outdated versions from the cellar.
brew cleanup
