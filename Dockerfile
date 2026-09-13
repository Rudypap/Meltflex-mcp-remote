FROM node:20-alpine
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE ${PORT}
CMD ["sh", "-c", "npx -y supergateway --stdio \"npx -y meltflex-mcp\" --port ${PORT} --host 0.0.0.0"]
