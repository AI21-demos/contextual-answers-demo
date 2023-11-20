#!/bin/bash

# Define the GET and DELETE endpoints and headers
GET_ENDPOINT="https://api.ai21.com/studio/v1/library/files"
DELETE_ENDPOINT="https://api.ai21.com/studio/v1/library/files"
HEADERS=("Authorization: Bearer <API_TOKEN>")

# Retrieve all files using GET endpoint
echo "Retrieving all files..."
FILES=$(curl -s -X GET "$GET_ENDPOINT" -H "${HEADERS[@]}")

# Check if the GET request was successful
if [ $? -eq 0 ]; then
    # Extract fileIds from the response
    fileIds=($(echo "$FILES" | jq -r '.[].fileId'))

    # Loop through each fileId and delete it
    for fileId in "${fileIds[@]}"; do
        DELETE_URL="$DELETE_ENDPOINT/$fileId"
        echo "Deleting fileId: $fileId"
        curl -X DELETE "$DELETE_URL" -H "${HEADERS[@]}"
        echo "Deleted fileId: $fileId"
        echo
    done

    echo "All fileIds deleted successfully."
else
    echo "Failed to retrieve files. Check your authorization token and endpoint."
fi
