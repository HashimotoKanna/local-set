#!/bin/sh

main()
{
    SIZE_PREV=$(grep "size:" ~/.config/alacritty/alacritty.yml)
    SIZE=$1
    sed -i "/$SIZE_PREV/c\  size: $SIZE" ~/.config/alacritty/alacritty.yml
}

if [ -z $1 ]; then
    echo "what is terminal size?"
    exit 1
fi

main $1
