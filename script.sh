#!/bin/bash

README_START="<!-- START OF README -->"
README_END="<!-- END OF README -->"
DYNAMIC_START="<!-- START OF DYNAMIC CONTENT -->"
DYNAMIC_END="<!-- END OF DYNAMIC CONTENT -->"


HEAD=$(cat README.md | sed -n "/${README_START}/,/${DYNAMIC_START}/p")
BODY=$(cat README.md | sed -n "/${DYNAMIC_START}/,/${DYNAMIC_END}/p" |sed -e '1d;$d')
TAIL=$(cat README.md | sed -n "/${DYNAMIC_END}/,/${README_END}/p")


DATE=$(date)

# Override README.md
cat <<EOF > README.md
$HEAD
Last update: $DATE
$TAIL
EOF