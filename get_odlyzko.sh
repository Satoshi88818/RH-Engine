#!/bin/bash
# Odlyzko's zero tables, from the GitHub mirror nightbay/odzeros (files sanitised for whitespace; numbers unchanged per its author; not compared byte-for-byte with the originals).
mkdir -p odlyzko && cd odlyzko
for f in zeros1 zeros3 zeros4 zeros5 zeros6; do
  curl -s -L -o $f https://raw.githubusercontent.com/nightbay/odzeros/master/odlyzko_data/$f
done
wc -l zeros1 zeros3 zeros4 zeros5 zeros6      # expect 100000, 10009, ~10000, ~10000, 2001052
