#!/bin/bash
set -e

# Install Homebrew if missing
if [[ ! -f /opt/homebrew/bin/brew ]] && [[ ! -f /usr/local/bin/brew ]]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Add Homebrew to PATH
if [[ -f /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -f /usr/local/bin/brew ]]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

# Install xctesthtmlreport
brew install xctesthtmlreport
brew link xctesthtmlreport

# Install Ruby gems (Fastlane)
bundle install

# Install Fastlane plugins
bundle exec fastlane install_plugins

echo "✅ Setup complete! Run 'bundle exec fastlane ui_tests' to run tests."