#!/bin/bash
# Directory containing the images
folder="/home/cxinu/pfp"

# Enable nullglob in case no .jpg files are found
shopt -s nullglob

# Process each .jpg file in the folder
for file in "$folder"/*.jpg; do
    # Define the new file name with .png extension
    base="${file%.jpg}"
    new_file="${base}.png"

    echo "Processing '$file' -> '$new_file'"

    # Step 1: Convert JPG to PNG and remove near-white background.
    # -fuzz 15% allows a tolerance for near-white pixels.
    # The -transparent white option converts these pixels to transparent.
    # Step 2: Restore some alpha details using a dilate/blur on the alpha channel.
    magick "$file" -fuzz 15% -transparent white \
      \( +clone -alpha extract -morphology Dilate Disk:1 -blur 0x1 -threshold 50% \) \
      -compose CopyOpacity -composite "$new_file"

    # Step 3: Check the image height; if greater than 640px, resize while preserving the aspect ratio.
    height=$(magick identify -format "%h" "$new_file")
    if [ "$height" -gt 500 ]; then
        echo "Resizing '$new_file' from height $height to 500px"
        magick "$new_file" -resize x500 "$new_file"
    fi

    # Step 4: Remove the original JPEG file.
    rm "$file"
done

echo "Conversion, background removal, edge refinement, and resizing complete."

