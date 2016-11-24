#!/bin/sh
XEPHYR_BIN=/usr/bin/Xephyr
WINE_BIN=/usr/bin/wine
WINPROG_BIN=/home/mro95/.wine/drive_c/GOG\ Games/SimCity\ 3000\ Unlimited/Apps/SC3U.exe
X11VNC_BIN=/usr/bin/x11vnc
VNCVIEWER_BIN=/usr/bin/vncviewer
XDISPLAY=:5

# start Xephyr in background
# note: *with* GLX extension wine crashs sometimes
${XEPHYR_BIN} -once -screen 1280x1024 -extension GLX ${XDISPLAY} &
XEPHYR_PID=$!
sleep 2

# start wine
DISPLAY=${XDISPLAY} ${WINE_BIN} "${WINPROG_BIN}" &
WINE_PID=$!

# start VNC server
${X11VNC_BIN} -localhost -scale 2:nb -display :5 &
VNCSERVER_PID=$!
sleep 3

# RealVNC
${VNCVIEWER_BIN} -FullColor localhost &
# TightVNC
#${VNCVIEWER_BIN} localhost &
# keep for both RealVNC and TightVNC
VNCVIEWER_PID=$!

wait ${WINE_PID}
sleep 1
kill ${VNCVIEWER_PID}
sleep 1
kill ${VNCSERVER_PID}
sleep 1
kill ${XEPHYR_PID}
