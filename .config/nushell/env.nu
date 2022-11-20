#*
#*                  _    __ _ _
#*   __ _ ___  __ _| |_ / _(_) |___ ___  WEBSITE: https://goatfiles.github.io
#*  / _` / _ \/ _` |  _|  _| | / -_|_-<  REPOS:   https://github.com/goatfiles
#*  \__, \___/\__,_|\__|_| |_|_\___/__/  LICENCE: https://github.com/goatfiles/dotfiles/blob/main/LICENSE
#*  |___/
#*          MAINTAINERS:
#*              AMTOINE: https://github.com/amtoine antoine#1306 7C5EE50BA27B86B7F9D5A7BA37AAE9B486CFF1AB
#*              ATXR:    https://github.com/atxr    atxr#6214    3B25AF716B608D41AB86C3D20E55E4B1DE5B2C8B
#*

# Nushell Environment Config File

def create_left_prompt [] {
    let simplified_pwd = ($env.PWD | str replace $nu.home-path '~' -s)

    let path_segment = if (is-admin) {
        $"(ansi red_bold)($simplified_pwd)"
    } else {
        $"(ansi green_bold)($simplified_pwd)"
    }

    let branch = (do -i { git branch --show-current } | str trim)

    if ($branch == '') {
        $path_segment
    } else {
        $path_segment + $" (ansi reset)\((ansi yellow_bold)($branch)(ansi reset)\)"
    }
}


def create_right_prompt [] {
    let time_segment = ([
        (date now | date format '%m/%d/%Y %r')
    ] | str collect)

    #$time_segment
}


# Use nushell functions to define your right and left prompt
let-env PROMPT_COMMAND = { create_left_prompt }
let-env PROMPT_COMMAND_RIGHT = { create_right_prompt }

# The prompt indicators are environmental variables that represent
# the state of the prompt
let-env PROMPT_INDICATOR = { "〉" }
let-env PROMPT_INDICATOR_VI_INSERT = { ": " }
let-env PROMPT_INDICATOR_VI_NORMAL = { "〉" }
let-env PROMPT_MULTILINE_INDICATOR = { "::: " }

# Specifies how environment variables are:
# - converted from a string to a value on Nushell startup (from_string)
# - converted from a value back to a string when running external commands (to_string)
# Note: The conversions happen *after* config.nu is loaded
let-env ENV_CONVERSIONS = {
  "PATH": {
    from_string: { |s| $s | split row (char esep) | path expand -n }
    to_string: { |v| $v | path expand -n | str collect (char esep) }
  }
  "Path": {
    from_string: { |s| $s | split row (char esep) }
    to_string: { |v| $v | str collect (char esep) }
  }
}

# Directories to search for scripts when calling source or use
#
# By default, <nushell-config-dir>/scripts is added
let-env NU_LIB_DIRS = [
    ($nu.config-path | path dirname | path join 'scripts')
]

# Directories to search for plugin binaries when calling register
#
# By default, <nushell-config-dir>/plugins is added
let-env NU_PLUGIN_DIRS = [
    ($nu.config-path | path dirname | path join 'plugins')
]

let-env XDG_DATA_HOME = $"($env.HOME)/.local/share"
let-env XDG_CONFIG_HOME = $"($env.HOME)/.config"
let-env XDG_STATE_HOME = $"($env.HOME)/.local/state"
let-env XDG_CACHE_HOME = $"($env.HOME)/.cache"

# move all moveable config to the right location, outside $HOME.
let-env HISTFILE = $"($env.XDG_STATE_HOME)/bash/history"
let-env CARGO_HOME = $"($env.XDG_DATA_HOME)/cargo"
let-env DOOMDIR = $"($env.XDG_CONFIG_HOME)/doom"
let-env GNUPGHOME = $"($env.XDG_DATA_HOME)/gnupg"
let-env PASSWORD_STORE_DIR = $"($env.XDG_DATA_HOME)/pass"
let-env GOPATH = $"($env.XDG_DATA_HOME)/go"
let-env GRIPHOME = $"($env.XDG_CONFIG_HOME)/grip"
let-env GTK2_RC_FILES = $"($env.XDG_CONFIG_HOME)/gtk-2.0/gtkrc"
let-env JUPYTER_CONFIG_DIR = $"($env.XDG_CONFIG_HOME)/jupyter"
let-env LESSHISTFILE = $"($env.XDG_CACHE_HOME)/less/history"
let-env TERMINFO = $"($env.XDG_DATA_HOME)/terminfo"
let-env TERMINFO_DIRS = $"($env.XDG_DATA_HOME)/terminfo:/usr/share/terminfo"
let-env NODE_REPL_HISTORY = $"($env.XDG_DATA_HOME)/node_repl_history"
let-env NPM_CONFIG_USERCONFIG = $"($env.XDG_CONFIG_HOME)/npm/npmrc"
let-env _JAVA_OPTIONS = $"-Djava.util.prefs.userRoot=($env.XDG_CONFIG_HOME)/java"
let-env PYTHONSTARTUP = $"($env.XDG_CONFIG_HOME)/python/pythonrc"
let-env SQLITE_HISTORY = $"($env.XDG_CACHE_HOME)/sqlite_history"
let-env XINITRC = $"($env.XDG_CONFIG_HOME)/X11/xinitrc"
let-env ZDOTDIR = $"($env.XDG_CONFIG_HOME)/zsh"
let-env _Z_DATA = $"($env.XDG_DATA_HOME)/z"
let-env CABAL_CONFIG = $"($env.XDG_CONFIG_HOME)/cabal/config"
let-env CABAL_DIR = $"($env.XDG_DATA_HOME)/cabal"
let-env KERAS_HOME = $"($env.XDG_STATE_HOME)/keras"
let-env EMACS_HOME = $"($env.HOME)/.emacs.d"
let-env MUJOCO_BIN = $"($env.HOME)/.mujoco/mujoco210/bin"
let-env VIMINIT = 'let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'

# changes the editor in the terminal, to edit long commands.
let-env EDITOR = 'vim'
let-env VISAL = 'vim'

### SET MANPAGER
### Uncomment only one of these!
# make "less" man pages prettier
#let-env LESS_TERMCAP_mb = $(tput bold; tput setaf 2)  # green
#let-env LESS_TERMCAP_md = $(tput bold; tput setaf 2)  # green
#let-env LESS_TERMCAP_so = $(tput bold; tput rev; tput setaf 3)  # yellow
#let-env LESS_TERMCAP_se = $(tput smul; tput sgr0)
#let-env LESS_TERMCAP_us = $(tput bold; tput bold; tput setaf 1)  # red
#let-env LESS_TERMCAP_me = $(tput sgr0)
### "bat" as manpager
let-env MANPAGER = "sh -c 'col -bx | bat -l man -p'"
### "vim" as manpager
# export MANPAGER = '/bin/bash -c "vim -MRn -c \"set buftype=nofile showtabline=0 ft=man ts=8 nomod nolist norelativenumber nonu noma\" -c \"normal L\" -c \"nmap q :qa<CR>\"</dev/tty <(col -b)"'
### "nvim" as manpager
# export MANPAGER = "nvim -c 'set ft=man' -"

# activates virtualenvwrapper to manage python virtual environments.
let-env WORKON_HOME = $"($env.XDG_DATA_HOME)/virtualenvs"

# To add entries to PATH (on Windows you might use Path), you can use the following pattern:
# let-env PATH = ($env.PATH | split row (char esep) | prepend '/some/path')
let-env PATH = ($env.PATH | split row (char esep) |
    prepend $"($env.HOME)/.local/bin" |
    prepend $"($env.EMACS_HOME)/bin" |
    prepend $"($env.CARGO_HOME)/bin"
)
let-env LD_LIBRARY_PATH = ($env.LD_LIBRARY_PATH | split row (char esep) |
    prepend $"($env.MUJOCO_BIN)"
)


# disable or enable final configuration commands in ./scripts/final.nu
#
let-env USE_FINAL_CONFIG_HOOK = false
let-env QT_QPA_PLATFORMTHEME = "qt5ct"
