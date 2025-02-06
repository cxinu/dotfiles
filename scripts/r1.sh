#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: r1 \"your prompt here\""
    exit 1
fi

PROMPT="$1"
API_URL="https://api.groq.com/openai/v1/chat/completions"
MODEL="deepseek-r1-distill-llama-70b"

PAYLOAD='{
    "messages": [
        {
            "role": "user",
            "content": "'"$PROMPT"'"
        }
    ],
    "model": "'"$MODEL"'",
    "temperature": 0.6,
    "max_completion_tokens": 4096,
    "top_p": 0.95,
    "stream": true,
    "stop": null,
    "reasoning_format": "raw"
}'

curl -s \
    -X POST \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer $GROQ_API_KEY" \
    -d "$PAYLOAD" \
    "$API_URL" | {
        FULL_RESPONSE=""

        while IFS= read -r line; do
            if [[ -z "$line" ]]; then
                continue
            fi

            if [[ "$line" == data:* ]]; then
                line="${line#data:}"
            fi

            if [[ "$line" == "[DONE]" ]]; then
                break
            fi

            CONTENT=$(echo "$line" | jq '.choices[0].delta.content // empty' 2>/dev/null)

            if [[ "$CONTENT" == "\""* ]]; then
                CONTENT="${CONTENT%\"}"
                CONTENT="${CONTENT#\"}"
            fi

            if [[ -n "$CONTENT" ]]; then
                printf "%b" "$CONTENT"
            fi
        done
    }
