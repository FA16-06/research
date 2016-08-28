#!/bin/bash
set -euo pipefail

usage() {
    cat <<EOF >&2
Usage: $0 [-u URL] [-q] [{-t TAG}...] [-T TITLE] [-d DESC] [-m]
   or: echo URL | $0 [-q] [{-t TAG}...] [-T TITLE] [-d DESC] [-m]

   -q          Enable quiet mode.
   -m          Mirror the page to the local filesystem.
   -u URL      Add URL to notes.
   -t TAG      Add TAG to list of tags for this note.
   -T TITLE    Set title of note to TITLE.
   -d DESC     Set description of note to DESC.

EOF
    exit
}

take_notes() {
    local opt_url opt_quiet opt_tags opt_desc opt_title opt_mirror
    opt_url=
    opt_quiet=
    opt_desc=
    opt_title=
    opt_mirror=
    opt_tags=( )
    while getopts "u:qt:T:d:" o; do
        case "$o" in
            (u) opt_url=$OPTARG;;
            (q) opt_quiet=1;;
            (t) opt_tags+=( "$OPTARG" );;
            (d) opt_desc=$OPTARG;;
            (T) opt_title=$OPTARG;;
            (m) opt_mirror=1;;
            (*) usage;;
        esac
    done
    shift $((OPTIND-1))

    if [ -z "$opt_url" ]; then
        if [ -z "$opt_quiet" ]; then
            read -p "URL: " opt_url || exit 1
        else
            read opt_url || exit 1
        fi
    fi

    local wget_opts
    wget_opts=()
    wget_opts+=( --convert-links ) # Convert links to be relative
    wget_opts+=( --adjust-extension ) # Make extension match content-type
    wget_opts+=( --page-requisites ) # Download CSS and anything else to mirror page correctly
    wget_opts+=( --no-parent ) # Do not ascend to parent directory
    wget_opts+=( --no-clobber ) # Don't overwrite files

    if [ -n "$opt_quiet" ]; then
        wget_opts+=( --no-verbose ) # turn off verboseness, without being quiet
    fi

    local filesystem_path
    if [ -n "$opt_mirror" ]; then
        wget "${wget_opts[@]}" "$opt_url"

        filesystem_path=${opt_url#http://}
        filesystem_path=${filesystem_path#https://}
        case "$filesystem_path" in
            (*/) filesystem_path=${filesystem_path}index.html
        esac
        filesystem_path=$filesystem_path.html
        filesystem_path=${filesystem_path/.html.html/.html}

    else
        filesystem_path=$(mktemp -t take_notes.XXXXXXXXX || exit 1)
        export filesystem_path
        cleanup() {
            rm -f "$filesystem_path"
            exit
        }

        trap 'cleanup' EXIT INT TERM

        wget --quiet -O "$filesystem_path" "$opt_url"
    fi

    local html_title
    html_title=$(sed -ne '\!<title>! { s!.*<title>\([^<]*\)</title>!\1!; s![^[:print:]]!!g; p; q; }' "$filesystem_path")

    local header
    header=$opt_title
    if [ -z "$header" ]; then
        header=$html_title
    fi

    local desc
    desc=$opt_desc
    if [ -z "$desc" ]; then
        desc="Description goes here..."
    fi

    local date
    date=$(date +'%Y-%m-%d %H:%M:%S')

    local notes_path
    notes_path=${header,,}
    notes_path=${notes_path// /_}
    notes_path=notes/$notes_path.md

    local index_path
    index_path=README.md

    if [ -e "$notes_path" ]; then
        printf $'Path %s already exists, exiting\n' "$notes_path" >&2
        exit 2
    fi

    cat <<EOF > "$notes_path"
# $header

Tags: ${opt_tags[@]:-}

Created: $date

[$html_title]($opt_url)
([local](http://localhost:8889/$filesystem_path))

$desc
EOF

    cat <<EOF >> "$index_path"
    * [$header]($notes_path) (${opt_tags[@]:-})
EOF

    cat <<EOF
Notes created at:

    $notes_path

Index item added to:

    $index_path

EOF
}

take_notes "$@"
