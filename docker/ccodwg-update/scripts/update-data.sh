#!/bin/bash
git config --global user.name 'Jean-Paul R. Soucy'
git config --global user.email 'jeanpaul.r.soucy@gmail.com'
git clone --depth=1 https://jeanpaulrsoucy:$GH_PAT@github.com/ccodwg/CovidTimelineCanada.git /CovidTimelineCanada
cd /CovidTimelineCanada
export GITHUB_PAT=$GH_PAT
Rscript "update_data.R"
