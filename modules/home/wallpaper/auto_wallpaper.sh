# Set the path to the wallpapers directory
wallpapersDir="$HOME/Pictures/wallpapers"
darkDir="$wallpapersDir/dark"
lightDir="$wallpapersDir/light"
lockscreenDir="$HOME/Pictures/lockscreen"

# Get a list of all image files in the wallpapers directory
darkWallpapers=("$darkDir"/*)
lightWallpapers=("$lightDir"/*)

# Start an infinite loop
while true; do
   currenttime=$(date +%H:%M)
    # check day time here
   if [[ "$currenttime" > "18:00" ]] || [[ "$currenttime" < "06:30" ]]; then
     wallpapers=("${darkWallpapers[@]}")
   else
     wallpapers=("${lightWallpapers[@]}")
   fi

    # Select a random wallpaper from the array
    wallpaperIndex=$(( RANDOM % ${#wallpapers[@]} ))
    selectedWallpaper="${wallpapers[$wallpaperIndex]}"

    wallpaperName=$(basename "$selectedWallpaper")
    wallpaperType=$(echo "$wallpaperName" | awk -F '.' '{printf $2}')

    # Update the wallpaper using the swww img command
     swww img "$selectedWallpaper" \
            --transition-fps 60 \
            --transition-duration 2 \
            --transition-type random \
            --transition-pos top-right \
            --transition-bezier .3,0,0,.99 \
            --transition-angle 135

     cp "$selectedWallpaper" "$lockscreenDir"
     lockscreen="${lockscreenDir}/${wallpaperName}"
     echo "$wallpaperName" "lockscreen.${wallpaperType}" "$lockscreen"
     rename "$wallpaperName" "lockscreen.${wallpaperType}" "$lockscreen"

    # Delay for 2 hours before selecting the next wallpaper
    sleep 2h
done
