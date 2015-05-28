override_git_prompt_colors() {
    # http://unix.stackexchange.com/questions/124407/what-color-codes-can-i-use-in-my-ps1-prompt
    BgGray="5;235";
    GreenWithBg="\[\e[38;5;10;48;${BgGray}m\]"
    CyanWithBg="\[\e[38;5;12;48;${BgGray}m\]"
    YellowWithBg="\[\e[38;5;11;48;${BgGray}m\]"
    RedWithBg="\[\e[38;5;9;48;${BgGray}m\]"
    BlueWithBg="\[\e[38;5;39;48;${BgGray}m\]"
    GrayWithBg="\[\e[38;5;252;48;${BgGray}m\]"
    BgToFg="\[\e[38;${BgGray}m\]"
    RedBg="\[\e[38;${BgGray};48;5;9m\]"
    BlueWithRedBg="\[\e[38;5;39;48;5;9m\]"
    RedWithGreenBg="\[\e[38;5;9;48;5;10m\]"
    GreenBg="\[\e[38;${BgGray};48;5;10m\]"
    BlueBg="\[\e[38;${BgGray};48;5;39m\]"
    ResetWithBg="\[\e[0;0;48;${BgGray}m\]"
    ResetGreenBg="\[\e[38;${BgGray};48;5;10m\]"
    GreenReset="\[\e[38;5;10m\]"
    RedReset="\[\e[38;5;9m\]"

    GIT_PROMT_THEME_NAME="fax"
    jobcount="${GrayWithBg}$(jobscount)"
    if [[ "$SSH_CLIENT" ]]; then
        local repo=`git rev-parse --show-toplevel 2> /dev/null`
        if [[ ! -e "$repo" ]]; then
            host_end_color="${RedWithGreenBg}"
        else
            host_end_color="${RedWithBg}"
        fi
        virtenv_suffix="${BlueWithRedBg} "
        host_prefix="${jobcount}${RedBg}\h${host_end_color} "
    else
        virtenv_suffix="${BlueWithBg} "
        host_prefix="${jobcount}"
    fi

    GIT_PROMPT_PREFIX="${GreenWithBg}"                    # start of the git info string
    GIT_PROMPT_SUFFIX="${ResetWithBg}${ResetGreenBg} "    # the end of the git info string
    GIT_PROMPT_SEPARATOR="${GreenWithBg}│"                  # separates each item

    GIT_PROMPT_BRANCH="${CyanWithBg}"                       # the git branch that is active in the current directory
    GIT_PROMPT_STAGED="${YellowWithBg}●"                    # the number of staged files/directories
    GIT_PROMPT_CONFLICTS="${RedWithBg}✖"                    # the number of files in conflict
    GIT_PROMPT_CHANGED="${YellowWithBg}✚"                   # the number of changed files

    GIT_PROMPT_REMOTE="${ResetWithBg}"                      # the remote branch name (if any) and the symbols for ahead and behind
    GIT_PROMPT_UNTRACKED="${BlueWithBg}…"                   # the number of untracked files/dirs
    GIT_PROMPT_STASHED="${BlueWithBg}⚑"                     # the number of stashed files/dir
    GIT_PROMPT_CLEAN="${GreenWithBg}✔"                      # a colored flag indicating a "clean" repo

    GIT_PROMPT_SYMBOLS_AHEAD="${ResetWithBg}↑·"             # The symbol for "n versions ahead of origin"
    GIT_PROMPT_SYMBOLS_BEHIND="${ResetWithBg}↓·"            # The symbol for "n versions behind of origin"
    GIT_PROMPT_SYMBOLS_PREHASH="${ResetWithBg}:"            # Written before hash of commit, if no name could be found
    GIT_PROMPT_SYMBOLS_NO_REMOTE_TRACKING="${ResetWithBg}✭" # This symbol is written after the branch, if the branch is not tracked

    ## For the command indicator, the placeholder _LAST_COMMAND_STATE_
    ## will be replaced with the exit code of the last command
    ## e.g.
    ## GIT_PROMPT_COMMAND_OK="${Green}✔-_LAST_COMMAND_STATE_ "    # indicator if the last command returned with an exit code of 0
    ## GIT_PROMPT_COMMAND_FAIL="${Red}✘-_LAST_COMMAND_STATE_ "    # indicator if the last command returned with an exit code of other than 0

    # GIT_PROMPT_COMMAND_OK="${Green}✔"    # indicator if the last command returned with an exit code of 0
    # GIT_PROMPT_COMMAND_FAIL="${Red}✘-_LAST_COMMAND_STATE_"    # indicator if the last command returned with an exit code of other than 0

    # Prompt
    GIT_PROMPT_VIRTUALENV="${BlueBg}_VIRTUALENV_${virtenv_suffix}"
    #GIT_PROMPT_START_USER="${GrayWithBg}$(jobscount)"
    GIT_PROMPT_START_USER="${host_prefix}"
    GIT_PROMPT_START_ROOT="${GIT_PROMPT_START_USER}"
    GIT_PROMPT_END_USER="${GreenBg}\$${ResetColor}${GreenReset}${ResetColor} "
    GIT_PROMPT_END_ROOT="${RedBg}#${ResetColor}${RedReset}${ResetColor} "

    GIT_PROMPT_LEADING_SPACE=0
}

reload_git_prompt_colors "fax"
