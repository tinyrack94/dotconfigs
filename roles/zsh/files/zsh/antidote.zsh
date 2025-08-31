local DIRNAME="antidote"

# Clone Antidote if not exists
git_clone_if_not_exists "https://github.com/mattmc3/antidote.git" "--depth=1" "$HOME/.config/zsh/plugins/$DIRNAME"

# Load Antidote
source "$HOME/.config/zsh/plugins/$DIRNAME/antidote.zsh"
antidote load ${ZDOTDIR:-$HOME}/.config/zsh/zsh_plugins.txt
