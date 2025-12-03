# Static site image built on nginx
FROM nginx:1.27-alpine

# Remove default nginx content before copying the static site.
RUN rm -rf /usr/share/nginx/html/*

# Copy the repository (filtered by .dockerignore) into the web root.
COPY . /usr/share/nginx/html

# Surface favicons from the root into public/ for legacy paths.
RUN cp /usr/share/nginx/html/favicon.ico /usr/share/nginx/html/public/favicon.ico \
 && cp /usr/share/nginx/html/icon-*.png /usr/share/nginx/html/public/ 2>/dev/null || true

EXPOSE 80

CMD ["nginx","-g","daemon off;"]
