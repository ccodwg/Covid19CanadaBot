FROM python:latest

# add Google Chrome repository
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'

# install Google Chrome and other required packages
RUN apt-get -y update && apt-get install -y \
 google-chrome-stable \
 git \
 unzip

# download and unzip Chromedriver
RUN wget -O /tmp/chromedriver.zip http://chromedriver.storage.googleapis.com/`curl -sS chromedriver.storage.googleapis.com/LATEST_RELEASE`/chromedriver_linux64.zip
RUN unzip /tmp/chromedriver.zip chromedriver -d /usr/local/bin/

# set display port environmental variable
ENV DISPLAY=:99

# install archivist package
RUN pip3 install git+https://github.com/jeanpaulrsoucy/archivist.git#egg=archivist

# clone Covid19CanadaArchive repository
RUN git clone --depth=1 https://github.com/ccodwg/Covid19CanadaArchive.git

# install required Python packages
RUN pip3 install --no-cache-dir -r Covid19CanadaArchive/requirements.txt

# copy scripts
COPY scripts /scripts

# open shell
CMD /bin/bash
