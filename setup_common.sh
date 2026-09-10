#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

log() {
	printf '\n\033[1;34m=== %s ===\033[0m\n' "$1"
}

require_cmds() {
	for cmd in "$@"; do
		if ! command -v "$cmd" &>/dev/null; then
			echo "Error: $cmd is not installed."
			exit 1
		fi
	done
}

backup_path() {
	for path in "$@"; do
		if [ -e "$path" ] && [ ! -L "$path" ]; then
			mv "$path" "$path.bak.$(date +%s)"
		fi
	done
}

stow_list() {
	local list="$1"
	if [ ! -f "$list" ]; then
		echo "Warning: $list not found. Skipping."
		return 0
	fi
	while IFS= read -r module; do
		[ -z "$module" ] && continue
		case "$module" in \#*) continue ;; esac
		stow "$module"
	done <"$list"
}
