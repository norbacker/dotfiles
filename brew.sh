#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed
# Install a modern version of Bash.
brew install bash
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
  echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
  chsh -s "${BREW_PREFIX}/bin/bash";
fi;

# Install `wget` with IRI support.
brew install wget

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Install more recent versions of some macOS tools.
brew install vim
brew install grep
# skip openssh in order to use keychain
#brew install openssh
brew install screen
#brew install php
brew install gmp

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

# Install other useful binaries.
brew install ack
#brew install exiv2
brew install git
brew install git-lfs
brew install gs
brew install imagemagick
brew install lua
brew install lynx
brew install p7zip
brew install pigz
brew install pv
brew install rename
brew install rlwrap
brew install ssh-copy-id
brew install tree
brew install vbindiff
brew install zopfli

# Additional binaries
brew install openjdk
brew install maven
brew install jenv
brew install ansible
brew install docker
brew install go
brew install hexedit
brew install jq
brew install kcat
brew install kubernetes-cli
brew install openshift-cli
brew install python

# Install casks
brew install --cask sourcetree
brew install --cask sublime-text
brew install --cask dbvisualizer
brew install --cask robo-3t
brew install --cask iterm2
brew install --cask sublime-text
brew install --cask intellij-idea-ce
brew install --cask virtualbox
brew install --cask docker
brew install --cask flux
brew install --cask spectacle
brew install --cask slack
brew install --cask spotify
brew install --cask whatsapp
brew install --cask google-chrome
brew install --cask microsoft-teams

# Remove outdated versions from the cellar.
brew cleanup

# jEnv setup
eval "$(jenv init -)"
jenv enable-plugin maven
jenv enable-plugin export
for version in /Library/Java/JavaVirtualMachines/*/; do jenv add ${version}Contents/Home/; done
