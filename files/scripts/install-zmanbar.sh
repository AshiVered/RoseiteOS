#!/usr/bin/env bash
cp files/ZmanBar.zip /tmp/ZmanBar.zip
set -euo pipefail

EXT_ID="ZmanBar@dev-in-the-bm.github.io"
EXT_DIR="/usr/share/gnome-shell/extensions/${EXT_ID}"

mkdir -p "${EXT_DIR}"

# העתקה מהקובץ המקומי (במקום הורדה)
unzip /tmp/ZmanBar.zip -d "${EXT_DIR}"

chmod -R 755 "${EXT_DIR}"

# הפעלה אוטומטית דרך dconf
mkdir -p /etc/dconf/db/local.d

cat <<EOF > /etc/dconf/db/local.d/00-extensions
[org/gnome/shell]
enabled-extensions=['${EXT_ID}']
EOF

dconf update
