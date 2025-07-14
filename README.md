# n8n on Render

Este projeto roda o n8n (ferramenta de automação de workflow) no Render.

## Deploy no Render

### Pré-requisitos
- Conta no [Render](https://render.com/)
- Código no GitHub/GitLab

### Passos para Deploy

1. **Push do código para o repositório Git**
   ```bash
   git init
   git add .
   git commit -m "Initial commit"
   git branch -M main
   git remote add origin <seu-repositorio>
   git push -u origin main
   ```

2. **Criar Web Service no Render**
   - Acesse [Render Dashboard](https://dashboard.render.com/)
   - Clique em "New +" → "Web Service"
   - Conecte seu repositório
   - Configure:
     - **Name**: n8n-app (ou nome de sua escolha)
     - **Environment**: Docker
     - **Region**: Oregon (ou mais próxima)
     - **Branch**: main
     - **Dockerfile Path**: ./Dockerfile

3. **Configurar Variáveis de Ambiente**
   - Na seção "Environment Variables":
     - `GENERIC_TIMEZONE`: America/Sao_Paulo
     - `N8N_HOST`: 0.0.0.0
     - `N8N_PORT`: 5678
     - `N8N_PROTOCOL`: https
     - `WEBHOOK_URL`: https://seu-app.onrender.com/

4. **Configurar Health Check (Opcional)**
   - Health Check Path: `/healthz`

### Limitações no Plano Gratuito
- O serviço hiberna após 15 minutos de inatividade
- 750 horas/mês de tempo de execução
- Sem volumes persistentes (dados podem ser perdidos)

### Para Produção
- Considere usar Render Disk para persistência de dados
- Use plano pago para evitar hibernação
- Configure backup dos dados do n8n

### Acesso
Após o deploy, sua aplicação estará disponível em:
`https://seu-app-name.onrender.com`

### Troubleshooting
- Verifique os logs no Dashboard do Render
- Certifique-se de que a porta 5678 está sendo usada
- Confirme as variáveis de ambiente
