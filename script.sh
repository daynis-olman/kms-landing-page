#!/bin/bash

# Set the current working directory (parent of the 'skr' folder where index.html is located)
SCRIPT_DIR="$(dirname "$0")"
TARGET_FILE="$SCRIPT_DIR/index.html"
OUTPUT_FILE="$SCRIPT_DIR/src_paths.txt"

# Check if the index.html file exists
if [[ ! -f "$TARGET_FILE" ]]; then
    echo "File $TARGET_FILE does not exist!"
    exit 1
fi

# Extract all src values, remove duplicates, and save to src_paths.txt
# This uses awk to extract everything between 'src="' and the following '"'
awk -F'src="' '{for(i=2;i<=NF;i++){split($i,a,"\""); print a[1]}}' "$TARGET_FILE" | sort | uniq > "$OUTPUT_FILE"

echo "All unique src paths have been extracted to $OUTPUT_FILE"
