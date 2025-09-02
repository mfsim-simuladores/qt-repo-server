# qt-repo-server/Dockerfile

# Use uma imagem leve do Nginx como base
FROM nginx:alpine

# Copia o arquivo de configuração do Nginx para a imagem
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copia todo o conteúdo da sua pasta "server" para a pasta do Nginx
COPY server/ /usr/share/nginx/html/

# Exponha a porta 8080, que é a que o Nginx está escutando
EXPOSE 8080