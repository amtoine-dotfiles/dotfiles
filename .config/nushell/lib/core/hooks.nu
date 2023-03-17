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

export def main [] {
  {
    pre_prompt: [{||
      $nothing  # replace with source code to run before the prompt is shown
    }]
    pre_execution: [{||
      $nothing  # replace with source code to run before the repl input is run
    }]
    env_change: {
      PWD: [
        { code: "hide toolkit" }
        {
          condition: {|_, after| $after | path join 'toolkit.nu' | path exists}
          code: "
            print $'(ansi default_underline)(ansi default_bold)toolkit(ansi reset) module (ansi green_italic)detected(ansi reset)...'
            print $'(ansi yellow_italic)activating(ansi reset) (ansi default_underline)(ansi default_bold)toolkit(ansi reset) module with `(ansi default_dimmed)(ansi default_italic)use toolkit.nu(ansi reset)`'
            use toolkit.nu
          "
        }
      ]
    }
    display_output: {||
      if (term size).columns >= 100 { table -e } else { table }
    }
  }
}
