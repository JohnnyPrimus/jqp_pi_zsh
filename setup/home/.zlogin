# ~/.zlogin: executed by zsh(1) when login shell starts.

# WSL ONLY - import display environment as a workaround for freedesktop.Notifications dbus issues
systemctl --user import-environment DISPLAY
