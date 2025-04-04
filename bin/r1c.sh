#!/bin/bash

# Check for prompt argument
if [ -z "$1" ]; then
    echo "Usage: r1 \"your prompt here\""
    exit 1
fi

# Check for API key
if [ -z "${GROQ_API_KEY}" ]; then
    echo "Error: GROQ_API_KEY environment variable not set."
    exit 1
fi

PROMPT="$1"
API_URL="https://api.groq.com/openai/v1/chat/completions"
MODEL="deepseek-r1-distill-llama-70b"

# Build JSON payload
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

# Stream the API response and process line by line
curl -s -f \
    -X POST \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer ${GROQ_API_KEY}" \
    -d "$PAYLOAD" \
    "$API_URL" | while IFS= read -r line; do
    # Skip empty lines
    if [[ -z "$line" ]]; then
        continue
    fi

    # Remove "data:" prefix if present
    if [[ "$line" == data:* ]]; then
        line="${line#data:}"
    fi

    # Exit loop on [DONE]
    if [[ "$line" == "[DONE]" ]]; then
        break
    fi

    # Extract raw content with jq -r
    CONTENT=$(jq -r '.choices[0].delta.content // empty' <<<"$line" 2>/dev/null)

    # Print non-empty content
    if [[ -n "$CONTENT" ]]; then
        printf "%s" "$CONTENT"
    fi
done

# Check curl exit status
if [ ${PIPESTATUS[0]} -ne 0 ]; then
    echo "Failed to make API request."
    exit 1
fi
