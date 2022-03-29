#!/bin/bash
set -a; source archive.env; set +a
cd /Covid19CanadaArchive
/usr/local/bin/python -m archivist \
                                test \
                                --email \
                                --uuid-exclude \
                                  0635e027-1825-4441-aba7-6f4d1157d080 \
                                  8d0aa5a5-6397-4f4c-a9ca-26ba81f26bc7 \
                                  6edc20de-c174-4c75-9d6c-c463ef43512b \
                                  7ae6a613-aa31-4f63-aaeb-f8fdf3d68ee0 \
                                  45b626ef-d41d-48e9-b007-97edac5ac838 \
                                --debug print-md5
