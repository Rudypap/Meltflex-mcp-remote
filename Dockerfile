FROM node:20-alpine
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
# Exposer le port dynamique fourni par Railway
EXPOSE ${PORT}

# Lancer supergateway en écoutant sur toutes les interfaces (0.0.0.0) et sur le port PORT
CMD ["sh", "-c", "npx -y supergateway --stdio \"npx -y meltflex-mcp\" --port ${PORT} --host 0.0.0.0"]
