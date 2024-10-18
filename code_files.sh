#!/usr/bin/env bash


patterns_to_ignore=()
file_types=()

file_path=${@: -2}
path_to_save=${@: -1}

print_usage () { 
    echo "
    USAGE: 
    
    code_to_files [OPTIONS] [ARGUMENTS] 

    ARGUMENTS:
    
    path/to/start   the path to start scanning for files
    path/to/save    the path to save the code file 

    OPTIONS:

    -p  pattern to ignore
    -f  file extension to include
    "
}


recurse_directories () {
    local contents=""
    for path in $1/* 
    do 
        if [[ -d $path ]]; then
            contents="$contents$(recurse_directories $path)"

        # File handling          
        elif [[ -f $path ]]; then
            for ft in ${file_types[@]}
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

while getopts "f:" flag; do
    case "${flag}" in
        p)
            patterns_to_ignore+=(${OPTARG})
            ;;

        f)
            file_types+=(${OPTARG})
            ;;
        *)
            echo "Unknown option"
            print_usage
            exit 1
            ;;
    esac
done

if [[ -z $file_path ]]; then
    echo "Error: You need to include the path to start scanning for files"
    print_usage
    exit 1
fi

if [[ -z $path_to_save ]]; then
    echo "Error: You need to include the path to save your file to"
    print_usage
    exit 1
fi

if [[ -z $file_types ]]; then
    echo "Error: Include the file types you want to be captured with -f extension_one -f extension_two "
    print_usage
    exit 1
fi

result=$(recurse_directories $file_path $path_to_save)
echo "$result" > "$path_to_save"
echo "
   Parsing complete and written to: $path_to_save
"
