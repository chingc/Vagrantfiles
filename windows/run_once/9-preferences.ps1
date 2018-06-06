# explorer
$explorer = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
Set-ItemProperty $explorer Hidden 1
Set-ItemProperty $explorer HideFileExt 0
Set-ItemProperty $explorer ShowSuperHidden 1

# wallpaper
$desktop = "HKCU:\Control Panel\Desktop"
Set-ItemProperty $desktop "TileWallpaper" 0
Set-ItemProperty $desktop "WallpaperStyle" 0

# restart explorer
Stop-Process -processname explorer
