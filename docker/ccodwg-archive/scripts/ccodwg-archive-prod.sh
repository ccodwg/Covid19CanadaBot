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
                                --uuid-exclude \
                                  0635e027-1825-4441-aba7-6f4d1157d080 \
                                  8d0aa5a5-6397-4f4c-a9ca-26ba81f26bc7 \
                                  6edc20de-c174-4c75-9d6c-c463ef43512b \
                                  7ae6a613-aa31-4f63-aaeb-f8fdf3d68ee0 \
                                  45b626ef-d41d-48e9-b007-97edac5ac838 \
                                  3ed8e857-f5d5-4315-b083-b316e3bb18fd \
                                  80c53b1a-1e74-4871-9d9c-920f40e663e9 \
                                  2>&3
# read stderr and run rerun code, if necessary
RERUN="$(head -n 1 <&4)"
if [ -z "$RERUN" ]
then
	echo "Script completed without issue."
else
  	echo "Script for failed datasets will run after 10 minutes..."
	# wait 10 minutes
	sleep 10m
	# run script
  	echo "Rerunning script for failed datasets..."
	eval $RERUN
	echo "Script completed."
fi
# close file descriptor
exec 3>&-
