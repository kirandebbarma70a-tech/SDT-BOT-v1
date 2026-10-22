FROM debian:13

ENV DEBIAN_FRONTEND=noninteractive \
    PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PORT=10000

WORKDIR /app

# जरूरी सिस्टम पैकेजेस और tmate इनस्टॉल करना
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      python3 \
      python3-venv \
      python3-pip \
      bash \
      sudo \
      ca-certificates \
      curl \
      wget \
      git \
      openssh-client \
      tmate \
      procps \
      iproute2 \
      net-tools \
      && rm -rf /var/lib/apt/lists/*

COPY requirements.txt /app/requirements.txt
RUN python3 -m venv /opt/venv && \
    /opt/venv/bin/pip install --no-cache-dir -r /app/requirements.txt

COPY . /app

RUN chmod +x /app/start.sh

EXPOSE 10000

CMD ["/app/start.sh"]
