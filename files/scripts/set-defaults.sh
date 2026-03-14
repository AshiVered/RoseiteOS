#!/usr/bin/env bash
set -euo pipefail

mkdir -p /etc/skel/.config


# הגדרת מקלדת
cat <<EOF > /etc/skel/.config/kxkbrc
[Layout]
LayoutList=us,il
Options=grp:alt_shift_toggle
Use=true
EOF

# מחיקה פיזית של תמונת הרקע Autumn מהמערכת
rm -rf /usr/share/wallpapers/Autumn

# הגדרת הרקע summer_1am כברירת המחדל החדשה של המערכת
ln -sfn /usr/share/wallpapers/summer_1am /usr/share/wallpapers/Default
ln -sfn /usr/share/wallpapers/summer_1am /usr/share/wallpapers/Fedora
