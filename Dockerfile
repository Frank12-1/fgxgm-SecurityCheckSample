FROM node:25.3.0

RUN apt-get update && apt-get install -y --no-install-recommends \
    imagemagick \
    libmagickwand-dev \
    libxml2 \
    libxml2-dev \
    libsqlite3-0 \
    libsqlite3-dev \
    libssl-dev \
    openssl \
    zlib1g \
    zlib1g-dev \
    git \
    curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN npm install -g npm@latest

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

EXPOSE 8080

CMD [ "node", "index.js" ]
