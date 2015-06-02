#! /bin/bash

# Grep and sort all the comments to review.txt
grep -R -o "C\[.*]" * | sort > review.txt

# Remove comments that are simply “Correct” or “Also correct.”
sed -i "s/^.*\[\(Correct\|Also correct\.\|It's a ko, but Black can do better\.\|Correct\. It's a ko\. \)\]$//" review.txt

# Remove empty lines
sed -i '/^$/d' review.txt

# Format to make more human readable
sed -i 's/\(^.*\:\)C\[\(.*\?\)\].*$/\n\1\n\2/' review.txt

echo "Review file completed, see review.txt"
