setopt vi                      # allow vi mode
setopt interactivecomments     # allow comments in shell
setopt long_list_jobs          # list jobs in long format
setopt auto_menu               # use menu completion
setopt complete_in_word        # allow tab completion inside words
setopt always_to_end           # move cursor to end of word after completion
setopt append_history          # append to history rather than replacing
setopt extended_history        # save timestamp and duration in history
setopt hist_expire_dups_first  # delete oldest duplicates first
setopt hist_ignore_dups        # ignore duplication command history list
setopt hist_ignore_space       # ignore space-prefaced commands for history
setopt hist_verify             # load history expansions
setopt inc_append_history      # append history lines when they are entered
setopt share_history           # share command history data
setopt auto_cd                 # assume cd when directory is entered
setopt auto_pushd              # cd pushes directories onto the stack
setopt pushd_ignore_dups       # ignore duplicates in directory stack
setopt pushdminus              # flip the signs interpreted by popd
unsetopt menu_complete         # do not jump to first match in menu
unsetopt flowcontrol           # disable flow control via start/stop chars
