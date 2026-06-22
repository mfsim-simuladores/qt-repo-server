FROM nginx:alpine

# 1. Copia a configuração do Nginx para o local padrão
COPY nginx.conf /etc/nginx/conf.d/default.conf

# 2. Limpa qualquer lixo padrão da imagem do Nginx
RUN rm -rf /usr/share/nginx/html/*

# 3. CORRIGIDO: Copia o Updates.xml de dentro da pasta 'server/' para a raiz do servidor web
COPY server/Updates.xml /usr/share/nginx/html/

# 4. Copia o restante da pasta 'server/' (metadados leves, subpastas) para dentro do container
COPY server/ /usr/share/nginx/html/server/

# 5. Informa ao Railway para escutar na porta 8080
EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]