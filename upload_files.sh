#!/bin/bash

# Set your API key
API_KEY="your_api_key_here"

# Set the path to the directory containing files to upload
FILES_DIRECTORY="/path/to/your/files"

# Set the label you want to add to the documents
LABEL="XYZ"

# Set the API endpoint for uploading files
UPLOAD_ENDPOINT="https://api.ai21.com/studio/v1/library/files"

# Function to upload a file
upload_file() {
    local file_path="$1"
    echo "Uploading file: $file_path"
    
    # Extract file name
    file_name=$(basename "$file_path")

    # Make the API request
    response=$(curl -X POST -H "Authorization: Bearer $API_KEY" -F "file=@$file_path" -F "labels[]=$LABEL" "$UPLOAD_ENDPOINT")

    # Extract fileId from the response
    file_id=$(echo "$response" | jq -r '.fileId')

    echo "File uploaded successfully. FileId: $file_id"
}

# Loop through files in the directory and upload each one
for file in "$FILES_DIRECTORY"/*; do
    if [ -f "$file" ]; then
        upload_file "$file"
    fi
done
