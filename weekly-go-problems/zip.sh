#! /bin/bash

# Zip all the problems for easy download.

zip weekly-go-problems.zip ./easy/*.sgf ./intermediate/*.sgf ./hard/*.sgf ./other/*.sgf ./LICENSE

zip ./solutions/weekly-go-problems-pdf.zip ./solutions/*.pdf ./LICENSE

mkdir download
mv ./weekly-go-problems.zip ./download
mv ./solutions/weekly-go-problems-pdf.zip ./download

echo
echo "The archived files were saved in ./download/"
