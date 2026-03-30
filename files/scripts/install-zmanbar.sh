#!/usr/bin/env bash
set -euo pipefail

EXT1="ZmanBar@dev-in-the-bm.github.io"
EXT2="dash-to-dock@micxgx.gmail.com"

# התקנת ZmanBar
cp /tmp/files/ZmanBar.zip /tmp/ZmanBar.zip
mkdir -p /usr/share/gnome-shell/extensions/${EXT1}
unzip -o /tmp/ZmanBar.zip -d /usr/share/gnome-shell/extensions/${EXT1}
chmod -R 755 /usr/share/gnome-shell/extensions/${EXT1}
SCHEMA_DIR="/usr/share/gnome-shell/extensions/${EXT1}/schemas"

if [ -d "$SCHEMA_DIR" ]; then
    glib-compile-schemas "$SCHEMA_DIR"
fi

# dconf system defaults
mkdir -p /etc/dconf/db/local.d

cat <<EOF > /etc/dconf/db/local.d/00-gnome
[org/gnome/shell]
enabled-extensions=['${EXT1}','${EXT2}']
disable-user-extensions=false

[org/gnome/shell/extensions/dash-to-dock]
dock-fixed=true
autohide=false
intellihide=false
EOF

# קומפילציה של dconf
dconf update || true
