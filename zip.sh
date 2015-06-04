#! /bin/bash

# Zip all the problems for easy download.

zip weekly-go-problems.zip ./weekly-go-problems/easy/*.sgf ./weekly-go-problems/intermediate/*.sgf ./weekly-go-problems/hard/*.sgf ./weekly-go-problems/other/*.sgf ./LICENSE

zip ./weekly-go-problems/solutions/weekly-go-problems-pdf.zip ./weekly-go-problems/solutions/*.pdf ./LICENSE

mkdir download
mv ./weekly-go-problems.zip ./download
mv ./weekly-go-problems/solutions/weekly-go-problems-pdf.zip ./download

echo
echo "The archived files were saved in ./download/"
