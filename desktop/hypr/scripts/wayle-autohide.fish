#!/usr/bin/env fish

set hidden false
set edge_distance 8
set reveal_distance 35
set check_interval 0.08

while true
    set cursor (hyprctl cursorpos -j 2>/dev/null)

    if test -z "$cursor"
        sleep $check_interval
        continue
    end

    set y (echo $cursor | jq -r '.y')

    if test "$hidden" = false
        if test "$y" -ge "$reveal_distance"
            wayle panel hide >/dev/null 2>&1
            set hidden true
        end
    else
        if test "$y" -le "$edge_distance"
            wayle panel show >/dev/null 2>&1
            set hidden false
        end
    end

    sleep $check_interval
end
