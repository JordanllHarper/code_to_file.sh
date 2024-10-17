#!/usr/bin/env bash

file_path=$1
path_to_save=$2
file_types=${@:3}

recurse_directories () {
    local contents=""
    for path in $1/* 
    do 
        if [[ -d $path ]]; then
            contents="$contents$(recurse_directories $path)"

        # File handling          
        elif [[ -f $path ]]; then
            for ft in $file_types 
            do
                file_extension="${path##*.}"
                if [[ $file_extension == $ft ]]; then
                    contents="$(<$path)"$contents
                fi

            done
        else 
            exit 1
        fi 
    done
    echo "$contents"
}


result=$(recurse_directories $file_path)
echo "$result" > "$path_to_save"
