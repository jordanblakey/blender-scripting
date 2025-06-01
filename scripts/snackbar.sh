#!/usr/bin/env sh
# snackbar.sh - display a message with optional color
# Usage: . ./snackbar.sh "Hello, World!" "green"

message="$1"
[ "$2" = "green" ] && color="32"
[ "$2" = "magenta" ] && color="35"
[ -z "$color" ] && color="0"
reset="0"

printf "\033[%sm" "$color" # apply color
printf "\n======================================================================\n"
printf "%s\n\n" "$message"
printf "\033[%sm" "$reset" # reset color
