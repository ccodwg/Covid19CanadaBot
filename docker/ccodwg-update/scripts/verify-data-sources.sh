#!/bin/bash

# clone scripts from Covid19Canada
git clone \
  --depth 1  \
  --filter=blob:none  \
  --sparse \
  https://github.com/ccodwg/Covid19Canada
cd Covid19Canada
git sparse-checkout set scripts

# run verify_data_sources.R
Rscript "scripts/verify_data_sources.R"
