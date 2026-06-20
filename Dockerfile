# Statische Website (Taxi Bern 24/7) – ausgeliefert via nginx
FROM nginx:alpine

# Eigene nginx-Konfiguration (gzip, Caching, Port 80)
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Website-Dateien ins Web-Root kopieren
COPY index.html /usr/share/nginx/html/
COPY logo_taxibern.png /usr/share/nginx/html/
COPY Ibrahim.png /usr/share/nginx/html/
COPY car.jpeg /usr/share/nginx/html/

EXPOSE 80

# Healthcheck für Dokploy / Docker
HEALTHCHECK --interval=30s --timeout=5s --start-period=5s --retries=3 \
  CMD wget -qO- http://127.0.0.1/ >/dev/null 2>&1 || exit 1

CMD ["nginx", "-g", "daemon off;"]
