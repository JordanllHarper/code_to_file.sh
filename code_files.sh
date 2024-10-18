#!/usr/bin/env bash


patterns_to_ignore=
file_types=

file_path=$1
path_to_save=$2

print_usage () { 
    echo "
    USAGE: 
    
    code_to_files [OPTIONS] [ARGUMENTS]

    ARGUMENTS:
    
    path/to/start   the path to start scanning for files
    path/to/save    the path to save the code file 

    OPTIONS:

    -p  patterns to ignore
    -f  file extensions to include
    "
}

while getopts 'pf' flag; do
    case "${flag}" in
        p)
            patterns_to_ignore="${OPTARG}"
            ;;

        f)
            file_types="${OPTARG}"
            ;;
        *)
            echo "Unknown option"
            print_usage
            exit 1
            ;;
    esac
done

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
echo "Parsing complete and written to: $path_to_save"
