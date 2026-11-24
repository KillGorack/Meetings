#!/bin/sh
# Removes the program. Your data is kept (records, pictures, settings).
set -e
PREFIX="${PREFIX:-$HOME/.local}"
rm -rf "$PREFIX/opt/meetings"
rm -f "$PREFIX/bin/meetings" "$PREFIX/share/applications/meetings.desktop" \
      "$PREFIX/share/icons/hicolor/256x256/apps/meetings.png"
command -v update-desktop-database >/dev/null 2>&1 && update-desktop-database "$PREFIX/share/applications" 2>/dev/null || true
echo "Meetings removed."
echo "Your data is still in ${XDG_DATA_HOME:-$HOME/.local/share}/meetings (delete it yourself if you want it gone)."
