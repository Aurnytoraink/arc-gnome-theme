#!/usr/bin/env bash

VERSION=$(curl --silent "https://api.github.com/repos/Aurnytoraink/arc-gnome-theme/releases/latest" | grep tag_name | cut -d'"' -f4)
FILENAME=arc-gnome-theme-$VERSION.tar.gz

(

cd $(mktemp -d) || exit 1
mkdir arc-gnome-theme
cd arc-gnome-theme

curl -LJo $FILENAME https://github.com/Aurnytoraink/arc-gnome-theme/tarball/$VERSION

tar -xzf $FILENAME --strip-components=1

chmod +x scripts/auto-install.sh

./scripts/auto-install.sh

)
