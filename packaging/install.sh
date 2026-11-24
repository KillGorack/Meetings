#!/bin/sh
# Per-user install: no admin, no sudo. Copies the app under ~/.local and adds a menu entry.
# Your data (records, pictures) lives elsewhere (~/.local/share/meetings) and is never touched.
set -e
HERE="$(cd "$(dirname "$0")" && pwd)"
PREFIX="${PREFIX:-$HOME/.local}"
APPDIR="$PREFIX/opt/meetings"
ICON="$PREFIX/share/icons/hicolor/256x256/apps/meetings.png"
DESKTOP="$PREFIX/share/applications/meetings.desktop"

if [ ! -x "$HERE/app/meetings" ]; then echo "Run this from the unpacked download folder." >&2; exit 1; fi

# replace any previous version (upgrade); the data folder is not inside APPDIR
rm -rf "$APPDIR"
mkdir -p "$APPDIR" "$PREFIX/bin" "$(dirname "$ICON")" "$(dirname "$DESKTOP")"
cp -R "$HERE/app/." "$APPDIR/"
cp "$HERE/icon.png" "$ICON"
ln -sf "$APPDIR/meetings" "$PREFIX/bin/meetings"
sed -e "s|@APPDIR@|$APPDIR|" -e "s|@ICON@|$ICON|" "$HERE/meetings.desktop.in" > "$DESKTOP"
chmod +x "$DESKTOP"
command -v update-desktop-database >/dev/null 2>&1 && update-desktop-database "$PREFIX/share/applications" 2>/dev/null || true

echo "Installed Meetings to $APPDIR"
echo "Open it from your applications menu, or run: meetings"
