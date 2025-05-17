#!/bin/bash

LOG_FILE="/var/log/clamav/clamscan.log"
TMP_SCAN="/tmp/clamav_scan_raw.txt"
TMP_HASH="/tmp/clamav_hashes.txt"

# Clear temporary files
> "$TMP_SCAN"
> "$TMP_HASH"

# Loop through all users' Downloads directories
for HOME_DIR in /home/*; do
    # Skip if not a directory
    [ -d "$HOME_DIR/Downloads" ] || continue
    SCAN_DIR="$HOME_DIR/Downloads"

    # Scan the Downloads directory
    clamscan -r --infected --no-summary "$SCAN_DIR" >> "$TMP_SCAN"
done

# Exit if no threats found
[ ! -s "$TMP_SCAN" ] && exit 0

# Calculate hashes
grep 'FOUND$' "$TMP_SCAN" | cut -d: -f1 | while read -r FILE; do
    HASH=$(sha256sum "$FILE" 2>/dev/null | awk '{print $1}')
    echo "$FILE:$HASH" >> "$TMP_HASH"
done

# Formatted output
while read -r LINE; do
    FILE=$(echo "$LINE" | cut -d: -f1)
    SIG=$(echo "$LINE" | sed -E 's/.*: (.+) FOUND$/\1/')
    HASH=$(grep "^$FILE:" "$TMP_HASH" | cut -d: -f2)
    echo "$SIG FOUND on $FILE - HASH: $HASH" >> "$LOG_FILE"
done < "$TMP_SCAN"
