#! /bin/bash

# Quick and dirty script to create diagrams in png and pdf format.
# This script requires ImageMagick, sgf2dg and optipng to be installed.
#
# TODO(dormerod) allow arguments to specify a subset of problems (to save time)

read -t5 -n1 -r -p 'Creating diagrams is slow, press any key in the next 5 seconds to cancel...' key

if [ "$?" -eq "0" ]; then
  echo "" # formatting only
  echo "You pressed a key to cancel. No diagrams were created."

else
  echo "" # formatting only

  echo "Starting to create diagrams, please wait..."
  echo "Generating png diagrams from eps files..."
  find -name '*.eps' -type f -exec mogrify -flatten -format png '{}' \;

  echo "Creating thumbnails for hard problems..."
  find -name 'go-problems-*.png' -type f -exec bash -c 'name="{}"; cp "$name" "${name%.png}-t.png"' \;

  echo "Squaring thumbnails..."
  find -name '*-t.png' -type f -exec mogrify -flatten -thumbnail '400x400>' -background white -gravity center -extent 400x400 '{}' \;

  echo "Compressing images..."
  find -name '*.png' -type f -exec optipng -o7 '{}' \;

  echo "Generating solution pdfs..."
  find -name '*.sgf' -type f -exec sgf2dg -convert PDF -coords -top 10 -break 0 '{}' \;
  mkdir solutions
  mv *.pdf ./solutions

fi

