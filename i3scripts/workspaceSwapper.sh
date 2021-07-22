#!/bin/sh

WRK_STR=$(i3-msg -t get_workspaces)

TEST=$(sed "s/\"id\":/\n/g" <<< "$WRK_STR")

readarray -t y <<< "$TEST"

WORKSPACES=()
ACTIVE_WORKSPACE=""

I=0
for element in ${y[@]}
do
  if [ $I != 0 ]; then
    element=$(sed "s/.*num\"://g" <<< "$element")
    element=$(sed "s/,\"name\":/\n/g" <<< "$element")
    element=$(sed "s/.*visible\"://g" <<< "$element")
    element=$(sed "s/,\".*//g" <<< "$element")
    readarray -t z <<< "$element"
    WORKSPACES+=(${z[0]})
    if [ ${z[1]} == "true" ]; then
      ACTIVE_WORKSPACE=${z[0]}
    fi
  fi
  I=$((I+1))
done

ACTIVE_WINDOWS=$(xdotool search --all --onlyvisible --desktop $(xprop -notype -root _NET_CURRENT_DESKTOP | cut -c 24-) "" 2>/dev/null)
readarray -t ACTIVE_WINDOWS <<< "$ACTIVE_WINDOWS"
ACTIVE_WINDOWS=${#ACTIVE_WINDOWS[@]}
WORKSPACE_COUNT=${#WORKSPACES[@]}

if [ $WORKSPACE_COUNT == 1 ] && [ $ACTIVE_WINDOWS == 1 ]; then
  if [ $ACTIVE_WORKSPACE != 1 ]; then
    i3-msg "move container to workspace number 1" &> /dev/null
    i3-msg "workspace number 1" &> /dev/null
  fi
  exit
fi

MISSING_WORK=-1
LAST=0

BOOL_BEFORE=1
BOOL_AFTER=0

WID_BEFORE=()
WID_AFTER=()

for element in ${WORKSPACES[@]}
do
  if [ $MISSING_WORK == -1 ]; then
    if [ "$element" != "$((LAST+1))" ]; then
      MISSING_WORK=$((LAST+1))
      if [ $BOOL_BEFORE == 1 ]; then
        WID_BEFORE+=($MISSING_WORK)
      fi
      if [ $BOOL_AFTER == 1 ]; then
        WID_AFTER+=($MISSING_WORK)
      fi
    fi
    LAST=$element
  fi
  if [ $BOOL_AFTER == 1 ]; then
    if [ "$element" != "$ACTIVE_WORKSPACE" ]; then
      WID_AFTER+=($element)
    fi
  fi
  if [ $BOOL_BEFORE == 1 ]; then
    if [ "$element" == "$ACTIVE_WORKSPACE" ]; then
      BOOL_BEFORE=0
      BOOL_AFTER=1
    else
      WID_BEFORE+=($element)
    fi
  fi
done

if [ $MISSING_WORK == -1 ] && [ $ACTIVE_WINDOWS != 1 ]; then
  MISSING_WORK=$((LAST+1))
  WID_AFTER+=($MISSING_WORK)
fi

for element in ${WID_AFTER[@]}
do
  i3-msg "move container to workspace number $element" > /dev/null
  i3-msg "workspace number $element" > /dev/null
  exit
done
for element in ${WID_BEFORE[@]}
do
  i3-msg "move container to workspace number $element" > /dev/null
  i3-msg "workspace number $element" > /dev/null
  exit
done
