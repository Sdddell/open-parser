#!/bin/bash
source open_parser_base.sh

if [ "$#" -lt 3 ]; then
    echo "Error: Missing arguments
    Usage: $0 <api_key> <job type: extract | parse> <file path> <prompt for parse (optional, default="")> <parse mode (optional, default=basic): basic | advanced>"
    exit 1
fi

apiKey="$1"
func="$2"
file_path="$3"

upload
if [ "$func" == "extract" ]; then
    extract
elif [ "$func" == "parse" ]; then
    prompt="$4"
    mode="$5"
    if [ -z "$mode" ] || [ "$mode" == "" ] || [ "$mode" == "advanced" ]; then
        textract=true
    else
        textract=false
    fi
    upload
    parse
fi

echo "$result"