# chwp

A simple Fish shell script to change wallpapers using Hyprpaper.

## How It Works
- Changes your wallpaper by updating `~/.config/hypr/hyprpaper.conf`.
- Supports full image paths or filenames (assumes `~/Pictures/Wallpapers/` for filenames).
- Restarts Hyprpaper to apply the new wallpaper.

## Setup

Make it executable:

```chmod +x path/to/chwp.fish```

Add an alias to `~/.config/fish/config.fish`:

```alias chwp path/to/chwp.fish```

Reload your Fish config:

```source ~/.config/fish/config.fish```

## Usage
- With a filename (from ~/Pictures/Wallpapers/):
```chwp image.jpg```
- With a full path:
```chwp /path/to/image.jpg```

## Notes
- Make sure ~/Pictures/Wallpapers/ exists or edit the script to use your wallpaper folder.
- This applies the wallpaper to all monitors.
