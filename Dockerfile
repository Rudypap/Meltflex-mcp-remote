# Utilise une image Node.js légère et récente
FROM node:20-alpine

# Définit le répertoire de travail
WORKDIR /app

# Copie les fichiers de dépendances
COPY package*.json ./

# Installe les dépendances
RUN npm install

# Copie le reste du projet
COPY . .

# Expose le port dynamique fourni par Railway (documentation)
EXPOSE ${PORT}

# Lance Supergateway en écoutant sur toutes les interfaces et sur le port PORT
CMD ["sh", "-c", "npx -y supergateway --stdio \"npx -y meltflex-mcp\" --port ${PORT} --host 0.0.0.0"]
