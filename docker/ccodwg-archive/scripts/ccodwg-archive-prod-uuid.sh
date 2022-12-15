#!/bin/bash
set -a; source archive.env; set +a
cd /Covid19CanadaArchive
/usr/local/bin/python -m archivist \
                                prod \
                                --email \
                                --notify \
                                --upload-log \
                                --uuid $UUID
