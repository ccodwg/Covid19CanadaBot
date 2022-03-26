#!/bin/bash
set -a; source archive.env; set +a
/usr/local/bin/python -m archivist \
                                index \
                                /Covid19CanadaArchive/datasets.json
