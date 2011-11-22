# Define helper variable for interactive shells
[ -n "$BASH_VERSION" -a -n "$PS1" ] && shopt -q login_shell && BASH_INTERACTIVE=1

# Check for interactive bash and Linux
[ -z "$BASH_INTERACTIVE" -o "`uname -s`" != "Linux" ] && return

if [ -z "$SSH_AUTH_SOCK" ]; then
  # Load SSH agent if necessary
  exec ssh-agent -- bash --login
elif [ -z "$STY" -a -n "$SSH_CONNECTION" -a -x /usr/bin/screen ]; then
  # Load Screen for SSH sessions
  exec screen -qRR
fi
