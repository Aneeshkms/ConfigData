#!/usr/bin/env bash

declare -a wall_files=(
[0]="green-1.jpg"
[1]="red-1.png"
[2]="pink-1.png"
[3]="olive-1.png"
[4]="green-2.jpg"
[5]="cyan-1.jpg"
[6]="yellow-1.jpg"
[7]="blue-1.jpg"
    )

declare -a wall_prefs=(
[0]="lightness"
[1]="value"
[2]="darkness"
[3]="lightness"
[4]="value"
[5]="darkness"
[6]="saturation"
[7]="lightness"
    )

matugen image ~/Pictures/wallpapers/${wall_files[$1]} --prefer ${wall_prefs[$1]} 2>&1 > /dev/null
awww img ~/Pictures/wallpapers/${wall_files[$1]} 2>&1 > /dev/null

