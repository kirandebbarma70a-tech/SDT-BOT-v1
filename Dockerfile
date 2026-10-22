FROM node:20-slim

WORKDIR /app

# tmate और जरूरी सिस्टम टूल्स इंस्टॉल करना ताकि VPS/tmate कमांड चल सकें
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      tmate \
      curl \
      git \
      procps \
      && rm -rf /var/lib/apt/lists/*

# डिपेंडेंसी इंस्टॉल करना
COPY package*.json ./
RUN npm install

# बाकी बोट की फाइलें कॉपी करना
COPY . .

EXPOSE 10000

# बोट को स्टार्ट करना
CMD ["npm", "start"]
