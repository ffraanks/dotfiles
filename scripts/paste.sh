#/usr/bin/env sh

IDfile=~/.pastersIDs

# verify if there is just one argument and if the file exists
if [ "$#" = 1 ];then
    file="$1"
    if [ "$1" = "--new" ]; then
        file=/tmp/pasters.temp
        vim $file
    elif [ "$1" = "--purge" ]; then
        printf "" > $IDfile
        exit
    elif [ "$1" = "--urls" ]; then
        cat $IDfile
        exit
    elif [ -e $file ];then
        filename=$(basename "$file")
        ext="${filename##*\.}"
        if [ $filename = $ext ]; then
            ext=""
        else
            ext=".${ext}"
        fi

        link_id="$(curl -s --data-binary @$file https://paste.rs)$ext"
        echo $link_id | tee -a $IDfile
        printf "" > /tmp/pasters.temp
        exit
    fi

# if there is a second argument with the string "--get" it will get the contents of url
elif [ "$2" = "--get" ];then
    curl -s https://paste.rs/${1}
    exit

# if there is a second argument with the string "--del" it will delete the contents of url
elif [ "$2" = "--del" ];then
    curl -X DELETE https://paste.rs/${1}
    sed -i "/$1/d" $IDfile # -i option is not posix
    exit
fi
# usage if there are errors or matched none of above
printf "usage:\n"
printf "\n"
printf "pasters --urls    show urls of the pasted files\n"
printf "pasters --purge   Delete all the urls saved\n"
printf "pasters <file>    upload file and get its link\n"
printf "pasters <id> <option>\n"
printf "\n"
printf "options available:\n"
printf " --get    get the contents of id\n"
printf " --del    delete content of id\n";
