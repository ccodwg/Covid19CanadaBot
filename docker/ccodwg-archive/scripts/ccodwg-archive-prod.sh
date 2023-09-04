#!/bin/bash
# create temporary file
tmpfile=$(mktemp /tmp/archive-run.XXXXXX)
exec 3>"$tmpfile"
exec 4<"$tmpfile"
rm "$tmpfile"
# run script
set -a; source archive.env; set +a
cd /Covid19CanadaArchive
/usr/local/bin/python -m archivist \
                                prod \
                                --email \
                                --notify \
                                --upload-log \
                                  2>&3
# read stderr and run rerun code, if necessary
RERUN="$(tail -n 1 <&4)"
if [[ "$RERUN" =~ ^RERUN: ]]
then
  echo "Script for failed datasets will run after 10 minutes..."
  RERUN=$(echo "$RERUN" | sed -e 's/^RERUN://g')
  echo "$RERUN"
  # wait 10 minutes
  sleep 10m
  # run script
  echo "Rerunning script for failed datasets..."
  eval $RERUN
  echo "Script completed."
else
  echo "Script completed without issue."
fi
# close file descriptor
exec 3>&-
