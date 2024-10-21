#!/usr/bin/env bash

# Опции для выбора
options="Logout\nReboot\nShutdown\nSuspend\nLock"

# Показать меню и выбрать действие
selected=$(echo -e $options | wofi --dmenu --prompt "Select action:")

# Выполнение действий в зависимости от выбора
case $selected in
    "Logout")
        hyprctl dispatch exit
        ;;
    "Reboot")
        systemctl reboot
        ;;
    "Shutdown")
        systemctl poweroff
        ;;
    "Suspend")
        systemctl suspend
        ;;
    "Lock")
        ~/.config/hypr/scripts/lockscreen
        ;;
    *)
        # Если ничего не выбрано, просто выйти
        exit 1
        ;;
esac
