#! /bin/bash

# The point of this script is to generate a single file which contains the 
# important comments from all SGF files. This is intended to provide an 'easy' 
# way to review and improve the English used in the problem comments.

# Grep and sort all the comments to review.txt
grep -R -o "C\[.*\]" * | sort > review.txt

# Remove comments that are simply “Correct” or “Also correct.”
sed -i "s/^.*\[\(Correct\|Also correct\.\|It's a ko, but Black can do better\.\|Correct\. It's a ko\. \)\]$//" review.txt

# Remove empty lines
sed -i '/^$/d' review.txt

# Format to make more human readable
sed -i 's/\(^.*\:\)C\[\(.*\?\)\].*$/\1\n\2\n/' review.txt

echo "Review file completed, see review.txt"
