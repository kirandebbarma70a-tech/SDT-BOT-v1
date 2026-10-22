FROM python:3.10-slim

WORKDIR /app

# सिस्टम टूल्स और tmate इंस्टॉल करना ताकि वीपीएस और tmate कमांड सही से काम कर सकें
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      tmate \
      git \
      curl \
      procps \
      && rm -rf /var/lib/apt/lists/*

# पाइथन डिपेंडेंसी इंस्टॉल करना
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# बोट की बाकी सभी फाइलें कॉपी करना
COPY . .

# बोट को शुरू करने की कमांड
CMD ["python3", "bot.py"]
