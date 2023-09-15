FROM python:latest

# install required packages
RUN apt-get -y update && apt-get install -y \
 git \
 unzip \
 xvfb libxi6 libgconf-2-4 jq libjq1 libonig5 libxkbcommon0 libxss1 libglib2.0-0 libnss3 \
  libfontconfig1 libatk-bridge2.0-0 libatspi2.0-0 libgtk-3-0 libpango-1.0-0 libgdk-pixbuf2.0-0 libxcomposite1 \
  libxcursor1 libxdamage1 libxtst6 libappindicator3-1 libasound2 libatk1.0-0 libc6 libcairo2 libcups2 libxfixes3 \
  libdbus-1-3 libexpat1 libgcc1 libnspr4 libgbm1 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxext6 \
  libxrandr2 libxrender1 gconf-service ca-certificates fonts-liberation libappindicator1 lsb-release xdg-utils

# download and install Google Chrome
RUN LATEST_CHROME_RELEASE=$(curl -s https://googlechromelabs.github.io/chrome-for-testing/last-known-good-versions-with-downloads.json | jq '.channels.Stable') && \
  LATEST_CHROME_URL=$(echo "$LATEST_CHROME_RELEASE" | jq -r '.downloads.chrome[] | select(.platform == "linux64") | .url') && \
  wget -N "$LATEST_CHROME_URL" -P ~/ && \
  unzip ~/chrome-linux64.zip -d ~/ && \
  mv ~/chrome-linux64 ~/chrome && \
  ln -s ~/chrome/chrome /usr/local/bin/chrome && \
  chmod +x ~/chrome && \
  rm ~/chrome-linux64.zip

# download and unzip Chromedriver
RUN LATEST_CHROME_RELEASE=$(curl -s https://googlechromelabs.github.io/chrome-for-testing/last-known-good-versions-with-downloads.json | jq '.channels.Stable') && \
  LATEST_CHROMEDRIVER_URL=$(echo "$LATEST_CHROME_RELEASE" | jq -r '.downloads.chromedriver[] | select(.platform == "linux64") | .url') && \
  wget -O ~/chromedriver.zip $LATEST_CHROMEDRIVER_URL && \
  unzip -j ~/chromedriver.zip chromedriver-linux64/chromedriver -d /usr/local/bin/ && \
  chmod +x /usr/local/bin/chromedriver && \
  rm ~/chromedriver.zip

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
