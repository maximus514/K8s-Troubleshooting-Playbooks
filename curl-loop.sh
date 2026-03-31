#!/bin/bash

OUTPUT_FILE="failed_curls.log"
URL="https://www.google.com"

# Infinite loop
while true; do
    TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")

    # Perform curl silently, capture HTTP status
    HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "$URL")

    # Check if request failed (non-200 response or curl error)
    if [[ "$HTTP_CODE" -ne 200 ]]; then
        echo "[$TIMESTAMP] FAILED - HTTP_CODE: $HTTP_CODE" >> "$OUTPUT_FILE"
    fi

    # Optional: small delay to avoid hammering
    sleep 1
done