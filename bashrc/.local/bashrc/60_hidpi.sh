HOSTNAME=$HOSTNAME
if [[ "$HOSTNAME" == "archx1fu" ]]; then
  # GDK and QT HDPI settings
  export GDK_SCALE=2
  export GDK_DPI_SCALE=0.5
  export QT_AUTO_SCREEN_SET_FACTOR=0
  export QT_SCALE_FACTOR=2
  export QT_FONT_DPI=96
fi
