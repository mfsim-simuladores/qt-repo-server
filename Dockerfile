FROM nginx:alpine

# 1. Copia a configuração corrigida para o local padrão do Nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf

# 2. Limpa qualquer lixo que venha por padrão na imagem do Nginx
RUN rm -rf /usr/share/nginx/html/*

# 3. Copia o seu Updates.xml para a raiz do servidor web
COPY Updates.xml /usr/share/nginx/html/

# 4. Copia a pasta 'server/' com os metadados leves (meta.7z, sha1) para dentro do container
# Se a pasta 'server' estiver na raiz do seu repositório do Git:
COPY server/ /usr/share/nginx/html/server/

# 5. Informa ao Railway para escutar na porta 8080
EXPOSE 8080

# Inicializa o Nginx em primeiro plano (padrão obrigatório para o Docker não morrer)
CMD ["nginx", "-g", "daemon off;"]