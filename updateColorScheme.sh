#!/usr/local/bin/bash

# Requires bash v4+
# Declare an associative array to store colorscheme and its source URL
declare -A colorscheme

# Use an associative array for our colorschemes (KEY = name of colorscheme and VALUE = source URL)
colorscheme["molokai"]="https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim"
colorscheme["inkpot"]="https://raw.githubusercontent.com/ciaranm/inkpot/master/colors/inkpot.vim"
colorscheme["tomorrow-night"]="https://raw.githubusercontent.com/chriskempson/tomorrow-theme/master/vim/colors/Tomorrow-Night.vim"
colorscheme["tomorrow-night-eighties"]="https://raw.githubusercontent.com/chriskempson/tomorrow-theme/master/vim/colors/Tomorrow-Night-Eighties.vim"
colorscheme["tomorrow-night-bright"]="https://raw.githubusercontent.com/chriskempson/tomorrow-theme/master/vim/colors/Tomorrow-Night-Bright.vim" 

# All files will be downloaded and suffixed with .new then compared with the current file to verify that the file has changed before actually replacing it

for scheme in "${!colorscheme[@]}" ; do

    # Download the colorscheme from its source URL
    printf "Colorscheme: '${scheme}' downloading"
    curl -LSso ~/.vim/colors/${scheme}.new ${colorscheme[$scheme]}
    printf " ... completed!\n"

    # Check to see if file exists after we download it
    if [ -f ~/.vim/colors/${scheme}.new ] ; then
        # Diff the files to see if the colorscheme has actually changed, if so prompt to update
        if diff ~/.vim/colors/${scheme}.vim ~/.vim/colors/${scheme}.new &> /dev/null ; then
            echo "Colorscheme '${scheme}' has NOT changed"
            rm ~/.vim/colors/${scheme}.new
        else
            read -p "Colorscheme '${scheme}' has changed, update it (Yy/Nn)? " yn
            case yn in
                # Backup the original then replace it
                [Yy]* ) mv ~/.vim/colors/${scheme}.vim ~/.vim/colors/${scheme}.old; mv ~/.vim/colors/${scheme}.new ~/.vim/colors/${scheme}.vim;;
                # Otherwise, delete the file
                * ) rm ~/.vim/colors/${scheme}.new;;
            esac
        fi
    else
        echo "ERROR: Colorscheme '${scheme}' failed to download from ${colorscheme[$scheme]}"
    fi

    echo ""

done

# Simple Mode for downloading
#curl -LSso ~/.vim/colors/molokai.vim.new https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim
#curl -LSso ~/.vim/colors/inkpot.vim.new https://raw.githubusercontent.com/ciaranm/inkpot/master/colors/inkpot.vim
#curl -LSso ~/.vim/colors/tomorrow-night.vim.new https://raw.githubusercontent.com/chriskempson/tomorrow-theme/master/vim/colors/Tomorrow-Night.vim
#curl -LSso ~/.vim/colors/tomorrow-night-eighties.vim.new https://raw.githubusercontent.com/chriskempson/tomorrow-theme/master/vim/colors/Tomorrow-Night-Eighties.vim
#curl -LSso ~/.vim/colors/tomorrow-night-bright.vim.new https://raw.githubusercontent.com/chriskempson/tomorrow-theme/master/vim/colors/Tomorrow-Night-Bright.vim
