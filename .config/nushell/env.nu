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

# Directories to search for plugin binaries when calling register
#
# By default, <nushell-config-dir>/plugins is added
let-env NU_PLUGIN_DIRS = [
    ($nu.config-path | path dirname | path join 'plugins')
]

let-env XDG_DATA_HOME = ($env.HOME | path join ".local" "share")
let-env XDG_CONFIG_HOME = ($env.HOME | path join ".config")
let-env XDG_STATE_HOME = ($env.HOME | path join ".local" "state")
let-env XDG_CACHE_HOME = ($env.HOME | path join ".cache")

# move all moveable config to the right location, outside $HOME.
let-env TERMINFO_DIRS = (
  [
      ($env.XDG_DATA_HOME | path join "terminfo")
      "/usr/share/terminfo"
  ]
  | str join ":"
)
let-env _JAVA_OPTIONS = $"-Djava.util.prefs.userRoot=($env.XDG_CONFIG_HOME | path join java)"
let-env HISTFILE = ($env.XDG_STATE_HOME | path join "bash" "history")
let-env CARGO_HOME = ($env.XDG_DATA_HOME | path join "cargo")
let-env DOOMDIR = ($env.XDG_CONFIG_HOME | path join "doom")
let-env GNUPGHOME = ($env.XDG_DATA_HOME | path join "gnupg")
let-env PASSWORD_STORE_DIR = ($env.XDG_DATA_HOME | path join "pass")
let-env GOPATH = ($env.XDG_DATA_HOME | path join "go")
let-env GRIPHOME = ($env.XDG_CONFIG_HOME | path join "grip")
let-env GTK2_RC_FILES = ($env.XDG_CONFIG_HOME | path join "gtk-2.0" "gtkrc")
let-env JUPYTER_CONFIG_DIR = ($env.XDG_CONFIG_HOME | path join "jupyter")
let-env LESSHISTFILE = ($env.XDG_CACHE_HOME | path join "less" "history")
let-env TERMINFO = ($env.XDG_DATA_HOME | path join "terminfo")
let-env NODE_REPL_HISTORY = ($env.XDG_DATA_HOME | path join "node_repl_history")
let-env NPM_CONFIG_USERCONFIG = ($env.XDG_CONFIG_HOME | path join "npm" "npmrc")
let-env PYTHONSTARTUP = ($env.XDG_CONFIG_HOME | path join "python" "pythonrc")
let-env SQLITE_HISTORY = ($env.XDG_CACHE_HOME | path join "sqlite_history")
let-env XINITRC = ($env.XDG_CONFIG_HOME | path join "X11" "xinitrc")
let-env ZDOTDIR = ($env.XDG_CONFIG_HOME | path join "zsh")
let-env _Z_DATA = ($env.XDG_DATA_HOME | path join "z")
let-env CABAL_CONFIG = ($env.XDG_CONFIG_HOME | path join "cabal" "config")
let-env CABAL_DIR = ($env.XDG_DATA_HOME | path join "cabal")
let-env KERAS_HOME = ($env.XDG_STATE_HOME | path join "keras")
let-env EMACS_HOME = ($env.HOME | path join ".emacs.d")
let-env MUJOCO_BIN = ($env.HOME | path join ".mujoco" "mujoco210" "bin")

let-env BROWSER = "qutebrowser"
let-env TERMINAL = "alacritty -e"
# changes the editor in the terminal, to edit long commands.
let-env EDITOR = 'nvim'
let-env VISUAL = $env.EDITOR

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
let-env WORKON_HOME = ($env.XDG_DATA_HOME | path join "virtualenvs")

let-env GHQ_ROOT = ($env.XDG_DATA_HOME | path join "ghq")
let-env GIT_REPOS_HOME = $env.GHQ_ROOT

let-env QUICKEMU_HOME = ($env.XDG_DATA_HOME | path join "quickemu")

let-env DOTFILES_GIT_DIR = ($env.GIT_REPOS_HOME| path join "github.com" "goatfiles" "dotfiles")
let-env DOTFILES_WORKTREE = $env.HOME

let-env DOWNLOADS_DIR = ($env.HOME | path join "downloads")

let-env FZF_DEFAULT_OPTS = "
--bind ctrl-d:half-page-down
--bind ctrl-u:half-page-up
--bind shift-right:preview-half-page-down
--bind shift-left:preview-half-page-up
--bind shift-down:preview-down
--bind shift-up:preview-up
"

# To add entries to PATH (on Windows you might use Path), you can use the following pattern:
# let-env PATH = ($env.PATH | split row (char esep) | prepend '/some/path')
let-env PATH = (
    $env.PATH | split row (char esep)
    | prepend ($env.HOME | path join ".local" "bin")
    | prepend ($env.EMACS_HOME | path join "bin")
    | prepend ($env.CARGO_HOME | path join "bin")
    | prepend ($env.XDG_DATA_HOME | path join "clang-15" "bin")
)
let-env LD_LIBRARY_PATH = (
    $env.LD_LIBRARY_PATH | split row (char esep)
    | prepend $env.MUJOCO_BIN
)


# disable or enable final configuration commands in ./scripts/final.nu
#
let-env USE_FINAL_CONFIG_HOOK = false

let-env QT_QPA_PLATFORMTHEME = "qt5ct"

let-env TOMB_HOME = ($env.XDG_DATA_HOME | path join "tombs")

let-env LS_THEME = "dracula"
let-env LS_COLORS = (vivid generate $env.LS_THEME)


# Directories to search for scripts when calling source or use
#
# By default, <nushell-config-dir>/scripts is added
let-env NU_LIB_DIR = ($nu.config-path | path dirname | path join 'lib')
let-env NU_SCRIPTS_REMOTE = "https://github.com/goatfiles/nu_scripts"
let-env NU_SCRIPTS_DIR = ($env.GIT_REPOS_HOME | path join "github.com/goatfiles/nu_scripts")

let-env NU_LIB_DIRS = [
    $env.NU_LIB_DIR
    $env.NU_SCRIPTS_DIR
]

if not ($env.NU_SCRIPTS_DIR | path exists) {
  print $"(ansi red_bold)error(ansi reset): ($env.NU_SCRIPTS_DIR) does not exist..."
  print $"(ansi cyan)info(ansi reset): pulling the scripts from ($env.NU_SCRIPTS_REMOTE)..."
  git clone $env.NU_SCRIPTS_REMOTE $env.NU_SCRIPTS_DIR
}

let-env DEFAULT_CONFIG_FILE = (
  $env.NU_LIB_DIR
  | path join "default_config.nu"
)
let-env DEFAULT_CONFIG_REMOTE = (
  "https://raw.githubusercontent.com/nushell/nushell/main/crates/nu-utils/src/sample_config"
)

# TODO
# credit to @kubouch
# https://discord.com/channels/601130461678272522/1050117978403917834/1051457787663761518
export def "config update default" [ --help (-h) ] {
  let name = ($env.DEFAULT_CONFIG_FILE | path basename)
  let default_url = ($env.DEFAULT_CONFIG_REMOTE | path join $name)

  if ($env.DEFAULT_CONFIG_FILE| path expand | path exists) {
    let new = (fetch $default_url)
    let old = (open $env.DEFAULT_CONFIG_FILE)

    if $old != $new {
      $new | save --force --raw $env.DEFAULT_CONFIG_FILE
      print $'Updated ($name)'
    } else {
      print $'($name): No change'
    }
  } else {
    fetch $default_url | save --force --raw $env.DEFAULT_CONFIG_FILE
    print $'Downloaded new ($name)'
  }
}

if not ($env.DEFAULT_CONFIG_FILE | path exists) {
  print $"(ansi red_bold)error(ansi reset): ($env.DEFAULT_CONFIG_FILE) does not exist..."
  print $"(ansi cyan)info(ansi reset): pulling default config file..."
  config update default
}

let-env PROMPT_MULTILINE_INDICATOR = {(
    (
      [(ansi red) (ansi yellow) (ansi green) (ansi reset)]
      | str join ")"
    ) + " "
)}
