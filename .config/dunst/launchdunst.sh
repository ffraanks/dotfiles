
#!/bin/zsh

. $HOME/.cache/wal/colors.sh

pidof dunst && killall dunst

sleep 0.1

dunst                                                           \
    -geometry 300x5-10+40                                        \
    -format '<span foreground="'$color2'" weight="bold" stretch="ultra-condensed">%s</span>\n<span foreground="'$color3'" stretch="ultra-condensed">%b</span>'\
    -indicate_hidden true                                        \
    -font "Iosevka Medium 9"                                     \
    -follow mouse                                                \
    -shrink yes                                                  \
    -padding 8                                                   \
    -transparency 0                                              \
    -notification_height 0                                       \
    -separator_height 0                                          \
    -padding 8                                                   \
    -horizontal_padding 8                                        \
    -frame_width 3                                               \
    -sort yes                                                    \
    -idle_threshold 0                                            \
    -line_height 0                                               \
    -markup full                                                 \
    -alignment center                                            \
    -vertical_alignment center                                   \
    -show_age_threshold 60                                       \
    -word_wrap yes                                               \
    -ellipsize middle                                            \
    -stack_duplicates true                                       \
    -hide_duplicate_count true                                   \
    -show_indicators=false                                       \
    -icon_position right                                         \
    -max_icon_size 100                                           \
    -sticky_history yes                                          \
    -history_length 20                                           \
    -always_run_script true                                      \
    -title = Dunst                                               \
    -class = Dunst                                               \
    -corner_radius 0                                             \
    -mouse_left_click do_action                                  \
    -mouse_middle_click close_current                            \
    -mouse_right_click close_all                                 \
    -per_monitor_dpi false                                       \
    -close ctrl+space                                            \
    -close_all ctrl+shift+space                                  \
    -all_key ctrl+space                                          \
    -lf  "$cursor"                                               \
    -lb  "$background"                                           \
    -lh  "$color4"                                               \
    -lfr "$color2"                                               \
    -nf  "$cursor"                                               \
    -nb  "$background"                                           \
    -nh  "$color4"                                               \
    -nfr "$color2"                                               \
    -cf  "$cursor"                                               \
    -cb  "$background"                                           \
    -cfr "$color1"                                               \
    -ch  "$color4"                                               \
    -icon_path "$HOME/.local/share/icons/Revenge/128x128/actions:$HOME/.local/share/icons/Revenge/128x128/devices:$HOME/.local/share/icons/Revenge/128x128/apps:$HOME/.local/share/icons/Revenge/128x128/status:$HOME/.local/share/icons/Revenge/128x128/filesystems:$HOME/.local/share/icons/Revenge/128x128/mimetypes:$HOME/.local/share/icons/Revenge/128x128/emblems:$HOME/.local/share/icons/Revenge/128x128/places:$HOME/.local/share/icons/Revenge/128x128/stock" >/dev/null 2>&1 &


