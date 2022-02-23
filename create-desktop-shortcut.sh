# !/bin/bash

read -p "absolute path, executable file: " path
# check executable path exist
if ! test -f "$path"; then
    echo "executable file  not exist "$path
    echo "script will stopped"
    exit 1
fi

# generate name, and check
name=$(basename $path)
shortcutPath=$HOME/Desktop/$name".desktop"
if test -f "$shortcutPath"; then
    echo "file exist, on $shortcutPath"
    echo "you should delete, if want to replace file"
    echo "script will stopped"
    exit 1
fi

read -p "absolute path, icon path: " icon
if [$icon = ""]; then
echo "icon is empty"
elif ! test -f $icon; then
echo "icon not exist " $icon
echo "script will stop"
exit 1
fi

# create $name.desktop shortcut
cat <<EOF > "$shortcutPath"
[Desktop Entry]
Encoding=UTF-8
Type=Application
Terminal=false
Exec=$path %U
Name=$name
Icon=$icon
EOF



echo "success, shortcut created."
echo $shortcutPath
echo "then, you should make file executable."