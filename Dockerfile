# Usa Node 20 Alpine para ser leve e rápido
FROM node:20-alpine

# Diretório de trabalho dentro do container
WORKDIR /app

# Copia os arquivos de dependências e instala
COPY package*.json ./
RUN npm install

# Copia todo o código-fonte
COPY . .

# Expondo a porta padrão do ng serve
EXPOSE 4200

# Variável para corrigir problema de watch em volumes montados (Linux/Windows)
ENV CHOKIDAR_USEPOLLING=true

# Comando para rodar o Angular com live reload
CMD ["npm", "run", "start"]
