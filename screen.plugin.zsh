#
# Defines GNU Screen aliases and provides for auto launching it at start-up.
#
# Authors:
#   Coleton Pierson <coleton.pierson@gmail.com>
#

# Return if requirements are not found.
if (( ! $+commands[screen] )); then
  return 1
fi

if [[ -z "$STY" && -z "$EMACS" && -z "$VIM" ]] && ( \
  ( [[ -n "$SSH_TTY" ]] )
  # Uncoment below in order to launch when opening a local terminal session
  # || ( [[ -z "$SSH_TTY" ]] )
  \
); then
  screen -S "$(whoami)-$(date +"%H-%M-%S-%b-%d-%G")"
fi
