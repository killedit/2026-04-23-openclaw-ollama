FROM node:24.15.0

RUN apt-get update && apt-get install -y \
    procps \
    git \
    nano \
    curl \
    && rm -rf /var/lib/apt/lists/*

RUN npm install -g openclaw@latest \
    @larksuiteoapi/node-sdk \
    @slack/web-api \
    @whiskeysockets/baileys \
    nostr-tools \
    openai \
    tslib \
    zod

RUN echo "alias ll='ls -l'" | tee -a /root/.bashrc

EXPOSE 18789

CMD ["openclaw", "gateway", "run", "--bind", "lan", "--allow-unconfigured", "--port", "18789"]