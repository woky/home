(define b xbindkey)
(b '(mod4 o)                "fmlove love")
(b '(mod4 d)                "dmenu_run")
(b '(mod4 g)                "copyq toggle")
(b '(mod4 slash)            "clipscreen-open")
(b '(mod4 semicolon)        "clipscreen-save")
(b '(mod4 apostrophe)       "clipscreen-upload")
(b '(mod4 F8)               "sudo pm-suspend")
(b '(shift mod4 d)          "gnome-disks")
(b '(mod4 F10)              "qmmp -t")
(b '(mod4 F11)              "qmmp --previous")
(b '(mod4 F12)              "qmmp --next")
(b '(shift mod4 F11)        "qmmp --seek-bwd 30")
(b '(shift mod4 F12)        "qmmp --seek-fwd 30")
(b '(mod4 c)                "xclip -o|(echo -n '\"'; cat; echo -n '\"')|xclip")
(b '(XF86AudioMute)         "pactl set-sink-mute 2 toggle")
(b '(XF86AudioLowerVolume)  "pactl set-sink-volume 2 '-5%'")
(b '(XF86AudioRaiseVolume)  "pactl set-sink-volume 2 '+5%'")