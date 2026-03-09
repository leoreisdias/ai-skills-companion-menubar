#!/bin/bash
set -euo pipefail

APP_NAME="AI Skills Companion.app"
DMG_NAME="AI Skills Companion.dmg"
DIST_DIR="dist"
DMG_CONTENTS_DIR="$DIST_DIR/dmg"

./build-app.sh

echo "🧹 Preparing DMG contents..."
rm -rf "$DMG_CONTENTS_DIR"
mkdir -p "$DMG_CONTENTS_DIR"

cp -R "$APP_NAME" "$DMG_CONTENTS_DIR/"
ln -s /Applications "$DMG_CONTENTS_DIR/Applications"

echo "📀 Creating DMG..."
rm -f "$DIST_DIR/$DMG_NAME"
hdiutil create \
  -volname "AI Skills Companion" \
  -srcfolder "$DMG_CONTENTS_DIR" \
  -ov \
  -format UDZO \
  "$DIST_DIR/$DMG_NAME"

echo "✅ Built: $DIST_DIR/$DMG_NAME"
