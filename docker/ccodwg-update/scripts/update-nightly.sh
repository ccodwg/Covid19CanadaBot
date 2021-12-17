#!/bin/bash
git config --global user.name 'Jean-Paul R. Soucy'
git config --global user.email 'jeanpaul.r.soucy@gmail.com'
git clone --depth=1 https://jeanpaulrsoucy:$GH_PAT@github.com/ccodwg/Covid19Canada.git
cd Covid19Canada
Rscript scripts/conductor_update_nightly.R
