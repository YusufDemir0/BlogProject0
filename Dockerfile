# Base image olarak node kullan
FROM node:14-alpine

# Çalışma dizinini ayarla
WORKDIR /app

# package.json ve package-lock.json dosyalarını kopyala
COPY package*.json ./

# Bağımlılıkları yükle
RUN npm install

# Uygulama kodunu kopyala
COPY . .

# Uygulamayı derle
RUN npm run build

# Uygulamayı sun
RUN npm install -g serve
CMD ["serve", "-s", "build"]

# Uygulamanın çalışacağı port
EXPOSE 5000
