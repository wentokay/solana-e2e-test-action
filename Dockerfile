FROM node:16.6.0-slim

RUN apt-get update -y

RUN apt-get install -y xvfb chromium --no-install-recommends

RUN sh -c "$(curl -sSfL https://release.solana.com/v1.10.26/install)"

ENV PATH="/root/.local/share/solana/install/active_release/bin:${PATH}"

ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD true

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["sh", "/entrypoint.sh"]
