function live
    if test (count $argv) -eq 0
        echo "Usage: live <path-to-media>"
        return 1
    end

    set media_path $argv[1]
    xwinwrap -ov -fs -- mpv -wid WID --loop --no-osd-bar --osc=no --panscan=1.0 $media_path >/dev/null 2>&1 &
end

