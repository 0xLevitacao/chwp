#!/usr/bin/fish

# Check if an argument is provided
if test (count $argv) -eq 0
    echo "Error: Please provide an image path or filename"
    exit 1
end

set image $argv[1]
set wallpaper_dir "$HOME/Pictures/Wallpapers"
set config_file "$HOME/.config/hypr/hyprpaper.conf"

# Ensure config directory exists
mkdir -p (dirname $config_file)

# Resolve image path
if string match -q "/*" $image
    # Full path provided
    if test -f $image
        set image_path $image
    else
        echo "Error: Image not found at $image"
        exit 1
    end
else
    # Filename provided, check in wallpaper directory
    set full_path "$wallpaper_dir/$image"
    if test -f $full_path
        set image_path $full_path
    else
        echo "Error: Image not found at $full_path"
        exit 1
    end
end

# Write to hyprpaper.conf
echo "" > $config_file
echo "preload = $image_path" >> $config_file
echo "wallpaper = ,$image_path" >> $config_file

# Restart hyprpaper to apply changes
pkill hyprpaper
hyprpaper &

echo "Wallpaper changed successfully"
