# get latest R image from Rocker
FROM rocker/tidyverse:latest

# add PPA to install latest version of git
RUN apt-get update && apt-get install -y software-properties-common && apt-add-repository ppa:git-core/ppa

# install Docker and other dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
 docker.io \
 libmagick++-dev \
 git

# install CCODWG ETL packages and other R packages
RUN --mount=type=secret,id=github_token \
  Rscript -e "devtools::install_github('ccodwg/Covid19CanadaData', upgrade = 'never', auth_token = '$(cat /run/secrets/github_token)'); devtools::install_github('ccodwg/Covid19CanadaDataProcess', upgrade = 'never', auth_token = '$(cat /run/secrets/github_token)'); devtools::install_github('ccodwg/Covid19CanadaETL', upgrade = 'never', auth_token = '$(cat /run/secrets/github_token)')"

# create .Rprofile
RUN printf "library(magrittr) \noptions(docker_host = 'unix:///var/run/docker.sock', docker_remoteServerAddr = 'host-gateway') \n" >> ~/.Rprofile

# copy scripts
COPY scripts /scripts

# open shell
CMD /bin/bash
