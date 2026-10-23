
#!/bin/bash

# Check whether a directory is provided
if [ $# -ne 1 ]; then
    echo "Usage: $0 <log-directory>"
    exit 1
fi

LOG_DIR="$1"

# Check whether the log directory exists
if [ ! -d "$LOG_DIR" ]; then
    echo "Error: Log directory does not exist."
    exit 1
fi

# Convert to absolute path
LOG_DIR=$(cd "$LOG_DIR" && pwd -P) || exit 1

# Create an archive directory outside the source
ARCHIVE_DIR="$HOME/log_archives"

# Prevent accidentally archiving the archive directory
case "$ARCHIVE_DIR/" in
    "$LOG_DIR/"*) 
        echo "Error: Archive directory is inside the log directory."
        exit 1
        ;;
esac

mkdir -p "$ARCHIVE_DIR" || exit 1

# Generate timestamp
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

# Archive filename
ARCHIVE_FILE="$ARCHIVE_DIR/logs_archive_$TIMESTAMP.tar.gz"

# Compress logs
tar -czf "$ARCHIVE_FILE" -C "$LOG_DIR" .

# Check whether compression succeeded
if [ $? -eq 0 ]; then
    echo "Archive created successfully!"
    echo "Location: $ARCHIVE_FILE"

    # Record archive date and time
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $ARCHIVE_FILE" \
        >> "$ARCHIVE_DIR/archive.log"
else
    echo "Error: Archiving failed."
    rm -f "$ARCHIVE_FILE"
    exit 1
fi

