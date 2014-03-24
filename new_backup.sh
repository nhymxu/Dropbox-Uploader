#!/usr/bin/env bash
# Prepare and save snapshot locally
SUFFIX=$(date +'-%A')              # save one backup for a day of week
FILENAME=/tmp/zabolotnycom$SUFFIX
gear snapshot > $FILENAME

# Upload to dropbox (obviously)
RUN_DIR=$(dirname $0)
UPLOADER="$RUN_DIR/dropbox_uploader.sh -f $RUN_DIR/dropbox_uploader_config"

$UPLOADER upload $FILENAME

# Cleanup
rm $FILENAME
