#!/bin/bash
set -euo pipefail

echo "Adding OnlyOffice repository..."

# יצירת קובץ המאגר הרשמי בתוך נתיב המאגרים של פדורה
cat <<EOF > /etc/yum.repos.d/onlyoffice.repo
[onlyoffice]
name=onlyoffice repo
baseurl=https://download.onlyoffice.com/repo/centos/main/noarch/
gpgcheck=0
enabled=1
EOF

echo "Repository added successfully."
