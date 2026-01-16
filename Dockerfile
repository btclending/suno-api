# syntax=docker/dockerfile:1

FROM node:20-bookworm-slim AS builder
WORKDIR /src
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build

FROM node:20-bookworm-slim
WORKDIR /app

# Install Chromium dependencies + cleanup in single layer
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    libnss3 libdbus-1-3 libatk1.0-0 libatk-bridge2.0-0 libxcomposite1 \
    libxdamage1 libxfixes3 libxrandr2 libgbm1 libxkbcommon0 libasound2 libcups2 \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Copy package files and install production deps
COPY package*.json ./
RUN npm ci --only=production && npm cache clean --force

# Install Playwright Chromium
RUN npx playwright install chromium && rm -rf /root/.cache/ms-playwright/.links

# Copy built app from builder
COPY --from=builder /src/.next ./.next

ENV BROWSER_DISABLE_GPU=true

EXPOSE 5000
CMD ["npm", "run", "start"]
