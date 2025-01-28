#!/bin/bash

# FTP credentials
FTP_HOST="demo.qerajobs.com"
FTP_USER="demo_qerajobs_ftp"
FTP_PASS="6PJx@x!Gb0v-ONN8"
LOCAL_DIR="/home/dinesh/Git"
FTP_DIR="/home/qerajobs.com/demo.qerajobs.com"

# Sync files from FTP to local directory
lftp -e "
set ftp:ssl-allow yes;
open $FTP_HOST;
user $FTP_USER $FTP_PASS;
mirror --delete --verbose $FTP_DIR $LOCAL_DIR;
bye
"

# Navigate to local Git repository
cd $LOCAL_DIR

# Add changes to Git
git add .

# Commit changes
git commit -m "Sync from FTP: 28-01-2025"

# Push changes to Git
git push origin master
