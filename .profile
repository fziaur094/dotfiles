# .profile is executed for interactive login shells, but ~/.bash_profile, ~/.zsh_profile etc. have precedence

# appends a directory to local $PATH if directory exists and is not already in $PATH
append_to_path() {
    [[ -d "$1" ]] && [[ ":$PATH:" != *":$1:"* ]] &&
        PATH="${PATH:+"$PATH:"}$1"
}

# prepends a directory to local $PATH if directory exists and is not already in $PATH
prepend_to_path() {
    [[ -d "$1" ]] && [[ ":$PATH:" != *":$1:"* ]] &&
        PATH="$1${PATH:+":$PATH"}"
}

# enable color in shell commands output
export CLICOLOR=1

# Rio cDVR workspace integration
RIO_WORKSPACE_DIR="${RIO_WORKSPACE_DIR:-"$HOME/rio"}"
export RIO_WORKSPACE_DIR

RIO_PROFILE_ADDITIONS="$RIO_WORKSPACE_DIR/initial-setup-files/profile-additions"
if [[ -s "$RIO_PROFILE_ADDITIONS" ]]; then
    source $RIO_PROFILE_ADDITIONS
fi

### Some GNU coreutils have different parameters than BSD coreutils, can mess with macOS-specific tooling.
### Leave this block commented.
#
# gnu coreutils
#GNU_BIN="/usr/local/opt/coreutils/libexec/gnubin"
#[ -d "$GNU_BIN" ] && PATH="$GNU_BIN:$PATH"

# brew curl over bsd curl
CURL_BIN="/usr/local/opt/curl/bin"
if [[ -d "$CURL_BIN" ]]; then
    prepend_to_path "$CURL_BIN"
fi

### Go setup is tied in with Rio cDVR workspace setup.
### Leave this block commented.
#
# go setup
#if command -v go >/dev/null 2>&1; then
#    GOPATH="$HOME/.local/lib/go"
#    GOBIN="$HOME/.local/bin"
#    GOPRIVATE="github.comcast.com,code.comcast.com"
#fi

# rust, cargo setup
if command -v rustup-init >/dev/null 2>&1; then
    RUSTUP_HOME="$HOME/.rustup"
    export RUSTUP_HOME

    CARGO_HOME="$HOME/.cargo"
    export CARGO_HOME

    append_to_path "$CARGO_HOME/bin"
fi

# jvm, sdkman setup
SDKMAN_DIR="$HOME/.sdkman"
if [[ -d "$SDKMAN_DIR" ]] && [[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]]; then
    export SDKMAN_DIR
    source "$SDKMAN_DIR/bin/sdkman-init.sh"
fi

# python, pyenv setup
if command -v pyenv >/dev/null 2>&1; then
    PYENV_ROOT="$HOME/.local/lib/pyenv"
    export PYENV_ROOT
fi

# local bin directory
prepend_to_path "$HOME/.local/bin"

###
export PATH
