#!/usr/bin/env sh
# run shfmt and shellcheck against current working directory
# suitable to use alone or in a pre-commit hook
# example usage: ~/.scripts/shfmt_and_shellcheck.sh

set -e

alias shfmt="\$(bash -c \". ~/.bashrc && which shfmt\")"
alias shellcheck="\$(bash -c \". ~/.bashrc && which shellcheck\")"
script=$(basename "$0")

# check shfmt and shellcheck are installed
printf "\033[35m%s: checking dependencies... \033[0m \n" "$script"
printf "shfmt version: %s \n" "$(shfmt --version)"
printf "shellcheck %s \n" "$(shellcheck --version | grep version:)"

# format with shfmt - this will show the diff and write changes
printf "\033[35m%s: formatting shell scripts with shfmt... \033[0m \n" "$script"
# format: auto fix as much as possible
shfmt --diff --write .
echo 'done formatting shell scripts with shfmt.'

# lint with shellcheck - stops and shows rules
printf "\033[35m%s: linting shell scripts with shellcheck... \033[0m \n" "$script"
find . -type f -name "*.sh" -not -path "./.git/*" -not -path "./.venv/*" | while read -r file; do
	printf "%s " "$file"
	shellcheck -x "$file"
	printf "\033[32mdone\033[0m \n"
done

printf "\033[35m%s: formatting and linting complete. \033[0m \n" "$script"
