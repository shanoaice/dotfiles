if status is-interactive
    and test "$TERM_PROGRAM" != "vscode"
    # Commands to run in interactive sessions can go here
#   eval (zellij setup --generate-auto-start fish | string collect)
    fastfetch
end

# ASDF configuration code
if test -z $ASDF_DATA_DIR
    set _asdf_shims "$HOME/.asdf/shims"
else
    set _asdf_shims "$ASDF_DATA_DIR/shims"
end

# Do not use fish_add_path (added in Fish 3.2) because it
# potentially changes the order of items in PATH
if not contains $_asdf_shims $PATH
    set -gx --prepend PATH $_asdf_shims
end
set --erase _asdf_shims

#export RUSTUP_DIST_SERVER=https://mirrors.ustc.edu.cn/rust-static
#export RUSTUP_UPDATE_ROOT=https://mirrors.ustc.edu.cn/rust-static/rustup

export EDITOR=nano
export SUDO_EDITOR=rnano

alias ls exa
alias ll "ls -l"
alias la "ll -a"

#set -ax PATH $HOME/.local/texlive/2025/bin/x86_64-linux
#set -ax MANPATH $HOME/.local/texlive/2025/texmf-dist/doc/man
#set -ax INFOPATH $HOME/.local/texlive/2025/texmf-dist/doc/info

starship init fish | source

set -g fish_greeting
