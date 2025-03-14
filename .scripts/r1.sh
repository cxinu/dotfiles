#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: r1 \"your prompt here\""
fi

if [ -z "${GROQ_API_KEY}" ]; then
    echo "Error: GROQ_API_KEY environment variable not set."
    exit 1
fi

PROMPT="$1"
API_URL="https://api.groq.com/openai/v1/chat/completions"
MODEL="deepseek-r1-distill-llama-70b"

PAYLOAD=$(jq -n \
    --arg model "$MODEL" \
    --arg prompt "$PROMPT" \
    --argjson temperature 0.6 \
    --argjson max_tokens 4096 \
    --argjson top_p 0.95 \
    '{
        messages: [
            {
                role: "user",
                content: $prompt
            }
        ],
        model: $model,
        temperature: $temperature,
        max_completion_tokens: $max_tokens,
        top_p: $top_p,
        stream: true,
        stop: null,
        reasoning_format: "raw"
    }')

# Use curl to send the request
RESPONSE=$(curl -s -f \
    -X POST \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer ${GROQ_API_KEY}" \
    -d "$PAYLOAD" \
    "$API_URL")

# Check if curl failed
if [ $? -ne 0 ]; then
    echo "Failed to make API request."
    exit 1
fi

echo "$RESPONSE" | while IFS= read -r line; do
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

