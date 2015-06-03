#! /bin/bash

# Zip all the problems for easy download.

zip weekly-go-problems ./easy/*.sgf ./intermediate/*.sgf ./hard/*.sgf ./other/*.sgf

mkdir download
mv ./weekly-go-problems.zip ./download

echo
echo "The SGF files were saved to ./download/weekly-go-problems.zip"
