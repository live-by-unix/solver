#!/bin/bash

if [ "$1" = "undo" ]; then
    [ ! -f "$HOME/.solver_last" ] && { echo "No undo available"; exit 1; }
    bak="$(cat "$HOME/.solver_last")"
    orig="${bak%.*.*}"
    cp "$bak" "$orig"
    echo "Restored $orig"
    exit 0
fi

nobackup=0
log=0
undo=0
while getopts "nlu" opt; do
    case $opt in
        n) nobackup=1 ;;
        l) log=1 ;;
        u) undo=1 ;;
    esac
done
shift $((OPTIND - 1))

[ -z "$1" ] && { echo "Usage: solver [-n] [-l] [-u] <file> | solver undo"; exit 1; }

file="$1"
dir="$(dirname "$file")"
[ ! -d "$dir" ] && mkdir -p "$dir"
ts="$(date '+%Y%m%d_%H%M%S')"
[ -f "$file" ] && [ $nobackup -eq 0 ] && cp "$file" "$file.$ts.bak"
[ $undo -eq 1 ] && echo "$file.$ts.bak" > "$HOME/.solver_last"
rm -f "$file"
ext="${file##*.}"
tmpl="$HOME/.solver_templates/$ext"
[ -f "$tmpl" ] && cat "$tmpl" > "$file"
editor="${EDITOR:-nano}"
[ $log -eq 1 ] && echo "$(date '+%F %T') solver $file" >> "$HOME/.solver.log"
$editor "$file"
