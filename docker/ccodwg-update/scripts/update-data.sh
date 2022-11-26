#!/bin/bash
git config --global user.name 'github-actions[bot]'
git config --global user.email 'github-actions[bot]@users.noreply.github.com'
git clone --depth=1 https://jeanpaulrsoucy:$GH_PAT@github.com/ccodwg/CovidTimelineCanada.git /CovidTimelineCanada
cd /CovidTimelineCanada
export GITHUB_PAT=$GH_PAT
Rscript "update_data.R"
