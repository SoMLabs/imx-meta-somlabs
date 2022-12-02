#!/bin/sh

WESON_INI_FILE="/etc/xdg/weston/weston.ini"

if [ -L "$WESON_INI_FILE" ]; then
  rm $WESON_INI_FILE
elif [ -f "$WESON_INI_FILE" ]; then
  exit 0
fi

CMDLINE="`cat /proc/device-tree/model`"

case "$CMDLINE" in
  *MIPI7-PH720128T003*)
    ln -s /etc/xdg/weston/weston_8m_rotated.ini $WESON_INI_FILE
    ;;
  *)
    ln -s /etc/xdg/weston/weston_8m.ini $WESON_INI_FILE
    ;;
esac

exit 0
