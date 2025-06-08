#!/bin/bash

BASE_URL="https://huggingface.co/deepseek-ai/DeepSeek-Coder-V2-Instruct/resolve/main/"

while true; do
    for i in $(seq -w 01 55); do
        FILENAME="model-000${i}-of-000055.safetensors"
        DOWNLOAD_URL="${BASE_URL}${FILENAME}"

        echo "Downloading ${FILENAME}..."
        if wget "${DOWNLOAD_URL}" -O "${FILENAME}"; then
            echo "Download of ${FILENAME} complete."
            echo "Deleting ${FILENAME}..."
            rm "${FILENAME}"
            echo "${FILENAME} deleted."
        else
            echo "Error downloading ${FILENAME}. Skipping deletion."
        fi
    done
    echo "Cycle complete. Starting next cycle..."
done