FROM nginx:alpine

# Supprimer la configuration par défaut
RUN rm /etc/nginx/conf.d/default.conf
RUN rm /etc/nginx/nginx.conf

# Copier la nouvelle configuration
COPY nginx.conf /etc/nginx/nginx.conf

# Créer les répertoires nécessaires
RUN mkdir -p /usr/share/nginx/html

# Copier les fichiers du site
COPY src/ /usr/share/nginx/html/

# Vérifier les permissions
RUN chown -R nginx:nginx /usr/share/nginx/html

# Vérifier la configuration de nginx
RUN nginx -t

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]