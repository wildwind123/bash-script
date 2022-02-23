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
if test -f "$name.desktop"; then
    echo "file exist, on $(pwd)/"$name".desktop"
    echo "you should run script on different path, or delete this file, for generate new shortcut file."
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
cat > $name".desktop" <<EOF
[Desktop Entry]
Encoding=UTF-8
Type=Application
Terminal=false
Exec=$path %U
Name=$name
Icon=$icon
EOF

echo "shortcut created"
echo $(pwd)"/"name".desktop"
echo "you should make file executable"