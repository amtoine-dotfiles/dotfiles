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

# base up-to-date with Nushell version 0.67.0

source personal/aliases.nu

source default_config.nu

use core/hooks.nu *
use core/menus.nu *
use core/keybindings.nu *

let custom_config = {
  ls: {
    use_ls_colors: true
    clickable_links: false
  }
  rm: {
    always_trash: true
  }
  cd: {
    abbreviations: true
  }
  history: {
    file_format: "sqlite"
  }
  cursor_shape: {
    vi_insert: underscore
    vi_normal: underscore
  }

  color_config: $dark_theme

  edit_mode: vi
  show_banner: false

  hooks: (hooks)
  menus: (menus)
  keybindings: (keybindings)
}
let-env config = ($env.config | merge $custom_config)

# the scripts coming from $env.NU_SCRIPTS.goatfiles.directory
use scripts/misc.nu *
use scripts/community.nu *
use scripts/dotfiles.nu
use scripts/vm.nu
use scripts/venv.nu
use scripts/job.nu
use scripts/repo.nu
use scripts/gf.nu
use scripts/hx.nu
use scripts/gh.nu
use scripts/gpg.nu
use scripts/sys.nu
use scripts/docker.nu
use scripts/downloads.nu
use scripts/ipfs.nu
use scripts/ssh.nu
use scripts/trash.nu
use scripts/xdg.nu

# the scripts coming from $env.NU_SCRIPTS.nushell.directory
use custom-completions/git/git-completions.nu *
use custom-completions/cargo/cargo-completions.nu *
use custom-completions/glow/glow-completions.nu *
use custom-completions/make/make-completions.nu *

source personal/final.nu

# this script comes from $env.NU_SCRIPTS.goatfiles.directory
use scripts/shell_prompt.nu
shell_prompt setup --no-left-prompt --use-right-prompt --indicators $env.PROMPT_INDICATORS

def edit [] {
    let files = $in

    if ($files | is-empty) {
        error make --unspanned {
            msg: $"no file given to `(ansi default_dimmed)edit(ansi reset)`"
        }
    }

    if ($files | describe) != "list<string>" {
        error make --unspanned {
            msg: $"please give a list of strings to `(ansi default_dimmed)(ansi default_italic)edit(ansi reset)`
    => found `(ansi default_dimmed)(ansi default_italic)($files | describe)(ansi reset)`
($files | table | lines | each {|file| $'($file)' } | to text)"
        }
    }

    ^$env.EDITOR $files
}
