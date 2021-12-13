# get latest R image from Rocker
FROM rocker/tidyverse:latest

# install Docker and other dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
 docker.io \
 libmagick++-dev

# install CCODWG ETL packages and other R packages
ARG GH_PAT
RUN Rscript -e "install.packages(c('compareDF', 'crayon')); devtools::install_github('ccodwg/Covid19CanadaETL', upgrade = 'never', auth_token = '$GH_PAT')"

# create .Rprofile
RUN printf "library(magrittr) \noptions(docker_host = 'unix:///var/run/docker.sock', docker_remoteServerAddr = 'host-gateway') \n" >> ~/.Rprofile

# copy scripts
COPY scripts /scripts

# open shell
CMD /bin/bash
