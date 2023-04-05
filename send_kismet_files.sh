#!/bin/bash

# Replace these variables with your values
REMOTE_SERVER="user@remote_server_ip_or_hostname"
REMOTE_PATH="/path/to/remote/directory"
LOCAL_PATH="/path/to/local/kismet/files"
SSH_KEY="/path/to/ssh_private_key"

# Check for internet connectivity
if ping -c 1 google.com &> /dev/null; then
  echo "Internet connection available, transferring Kismet files..."
  
  # Compress Kismet files into a single archive
  TIMESTAMP=$(date +%Y%m%d%H%M%S)
  ARCHIVE_NAME="kismet_files_${TIMESTAMP}.tar.gz"
  tar -czvf "${ARCHIVE_NAME}" -C "${LOCAL_PATH}" .

  # Transfer the archive to the remote server
  scp -i "${SSH_KEY}" "${ARCHIVE_NAME}" "${REMOTE_SERVER}:${REMOTE_PATH}/${ARCHIVE_NAME}"

  # Remove the archive after successful transfer
  if [ $? -eq 0 ]; then
    echo "Transfer successful, removing local archive."
    rm "${ARCHIVE_NAME}"
  else
    echo "Transfer failed."
  fi

else
  echo "No internet connection available, skipping transfer."
fi
