# Use the official n8n image as base
FROM n8nio/n8n:latest

# Set environment variables for Render
ENV GENERIC_TIMEZONE="America/Sao_Paulo"
ENV N8N_HOST="0.0.0.0"
ENV N8N_PORT="5678"
ENV N8N_PROTOCOL="https"
ENV WEBHOOK_URL="https://container-n8n.onrender.com"

# Switch to root to install curl
USER root

# Install curl for health check
RUN apk add --no-cache curl

# Ensure the n8n directory exists and has correct permissions
RUN mkdir -p /home/node/.n8n && \
  chown -R node:node /home/node/.n8n

# Switch back to node user
USER node

# Set working directory
WORKDIR /home/node

# Expose port
EXPOSE 5678

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=60s --retries=3 \
  CMD curl -f http://localhost:5678/healthz || exit 1

# Start n8n
CMD ["n8n", "start"]
