#!/bin/bash
set -e

if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Usage: $0 <input.tex> <output.pdf>" >&2
    exit 1
fi

if [ ! -f "$1" ]; then
    echo "Error: input file '$1' does not exist" >&2
    exit 1
fi

output_dir="$(dirname "$2")"
if [ ! -d "$output_dir" ]; then
    echo "Error: output directory '$output_dir' does not exist" >&2
    exit 1
fi

eval "$(/usr/libexec/path_helper)"

echo "Generating file ${2} from .tex source ${1}"

rm -f "$2"

output_name="$(basename "${2%.pdf}")"
xelatex -output-directory="$output_dir" -jobname="$output_name" "$1"
