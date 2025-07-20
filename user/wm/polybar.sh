#!/usr/bin/env sh

killall -q polybar
killall -q .polybar-wrapper

while pgrep polybar >/dev/null; do sleep 1; done

# polybar dummy &
polybar center &
polybar left &
polybar right &
