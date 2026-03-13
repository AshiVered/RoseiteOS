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

# --- Wallpaper Cleanup ---

# 1. מחיקת כל תיקיות הרקעים השונות של פדורה ו-KDE (השארת תיקיית F43 בלבד)
ls -d /usr/share/wallpapers/* | grep -v 'F43' | xargs rm -rf

# 2. בתוך תיקיית F43, מחיקת כל התמונות המקוריות של פדורה והשארת התמונה שלנו בלבד
find /usr/share/wallpapers/F43/contents/images/ -type f ! -name '3264x2448.jpg' -delete
