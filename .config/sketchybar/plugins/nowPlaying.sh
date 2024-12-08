#!/usr/bin/env sh

nowPlaying=$(nowplaying-cli get title artist | gpaste -sd '-' | sed 's/-/ - /')
sketchybar --set "$NAME" icon=" " label="Now Playing: $nowPlaying"
