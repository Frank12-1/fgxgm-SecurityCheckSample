FROM node:18.20.7

FROM node:18.20.7

# 1. Update the package list
# 2. Upgrade the specific packages flagged by Snyk
# 3. Clean up to keep the image size small
RUN apt-get update && apt-get install -y --no-install-recommends \
    imagemagick \
    libmagickwand-dev \
    libxml2 \
    libxml2-dev \
    libsqlite3-0 \
    libsqlite3-dev \
    libssl-dev \
    openssl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN npm install -g npm@9.1.3

ADD package.json .
ADD index.js .
ADD build .
COPY . .
RUN npm install

EXPOSE 8080

CMD [ "node", "index.js" ]
