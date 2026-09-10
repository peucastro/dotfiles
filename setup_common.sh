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

backup_conflict() {
	local path="$1"
	if [ -e "$path" ] || [ -L "$path" ]; then
		echo "Backing up conflicting path: $path"
		mv "$path" "$path.bak.$(date +%s)"
	fi
}

stow_module() {
	local module="$1" rel
	while IFS= read -r rel; do
		[ -n "$rel" ] || continue
		backup_conflict "$HOME/$rel"
	done < <(LC_ALL=C stow --simulate --verbose=0 "$module" 2>&1 >/dev/null |
		sed -n \
			-e 's/.*existing target is not owned by stow: //p' \
			-e 's/.*existing target is stowed to a different package: \([^ ]*\) =>.*/\1/p' \
			-e 's/.*over existing directory target //p' \
			-e 's/.*over existing non-directory target //p' \
			-e 's/.*over existing target \(.*\) since .*/\1/p')
	stow "$module"
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
		stow_module "$module"
	done <"$list"
}
