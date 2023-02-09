# .bash_profile is executed first for interactive login shells

# disable macOS warning about zsh being the default shell
export BASH_SILENCE_DEPRECATION_WARNING=1

# RIO cDVR workspace integration
RIO_WORKSPACE_DIR="${RIO_WORKSPACE_DIR:-$HOME/rio}"
export RIO_WORKSPACE_DIR

RIO_BASH_PROFILE_ADDITIONS="$RIO_WORKSPACE_DIR/initial-setup-files/bash_profile-additions"
RIO_WORKSPACE_FUNCTIONS="$RIO_WORKSPACE_DIR/workspace-scripts/workspace-functions.sh"
[ -f "$RIO_BASH_PROFILE_ADDITIONS" ] && source "$RIO_BASH_PROFILE_ADDITIONS"
[ -f "$RIO_WORKSPACE_FUNCTIONS" ] && source "$RIO_WORKSPACE_FUNCTIONS"

# force execution of .bashrc for non-login shells
[[ -f "$HOME/.bashrc" ]] && source "$HOME/.bashrc"

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/fziaur094/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
