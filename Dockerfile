# Use the official n8n image as base
FROM n8nio/n8n:latest

# Set environment variables for Render
ENV GENERIC_TIMEZONE="America/Sao_Paulo"
ENV N8N_HOST="0.0.0.0"
ENV N8N_PORT="5678"
ENV N8N_PROTOCOL="https"

# Create the n8n directory
USER root
RUN mkdir -p /home/node/.n8n
RUN chown -R node:node /home/node/.n8n

USER node

WORKDIR /home/node/.n8n

COPY --chown=node:node ./n8n/ /home/node/.n8n/

EXPOSE 5678

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD curl -f http://localhost:5678/healthz || exit 1

CMD ["n8n", "start"]
