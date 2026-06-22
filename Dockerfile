FROM nginx:alpine

# 1. Copia a configuração do Nginx atualizada
COPY nginx.conf /etc/nginx/conf.d/default.conf

# 2. Limpa o lixo padrão do Nginx
RUN rm -rf /usr/share/nginx/html/*

# 3. Copia a pasta server inteira com a estrutura idêntica do seu Git
COPY server/ /usr/share/nginx/html/server/

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]