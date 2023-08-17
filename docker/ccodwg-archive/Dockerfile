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
RUN export URL=$(python -c "import urllib.request, json; response = urllib.request.urlopen('https://googlechromelabs.github.io/chrome-for-testing/last-known-good-versions-with-downloads.json'); data = json.loads(response.read()); print(data['channels']['Stable']['downloads']['chromedriver'][0]['url'])") && wget -O /tmp/chromedriver.zip $URL
RUN unzip -j /tmp/chromedriver.zip chromedriver-linux64/chromedriver -d /usr/local/bin/

# set display port environmental variable
ENV DISPLAY=:99

# install archivist package
RUN pip3 install git+https://github.com/jeanpaulrsoucy/archivist.git#egg=archivist

# clone Covid19CanadaArchive repository
RUN git clone --depth=1 https://github.com/ccodwg/Covid19CanadaArchive.git

# copy scripts
COPY scripts /scripts

# open shell
CMD /bin/bash
