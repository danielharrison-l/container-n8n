2. **Criar Web Service no Render**
   - Acesse [Render Dashboard](https://dashboard.render.com/)
   - Clique em "New +" → "Web Service"
   - Conecte seu repositório
   - Configure:
     - **Name**: container-n8n (ou nome de sua escolha)
     - **Environment**: Docker
     - **Region**: Oregon (ou mais próxima)
     - **Branch**: main
     - **Docker Command**: `n8n start`
     - **Port**: 5678

3. **Configurar Variáveis de Ambiente**
   - Na seção "Environment Variables":
     - `GENERIC_TIMEZONE`: America/Sao_Paulo
     - `N8N_HOST`: 0.0.0.0
     - `N8N_PORT`: 5678
     - `N8N_PROTOCOL`: https
     - `WEBHOOK_URL`: https://container-n8n.onrender.com

