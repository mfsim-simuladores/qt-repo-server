FROM nginx:alpine

# Copia a sua configuração customizada do Nginx para dentro do container
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copia os arquivos de versão (Updates.xml e a pasta server/) para a pasta do Nginx
COPY Updates.xml /usr/share/nginx/html/
COPY server/ /usr/share/nginx/html/server/

# Informa ao Railway a porta utilizada
EXPOSE 80