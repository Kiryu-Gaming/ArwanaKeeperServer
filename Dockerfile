FROM nodered/node-red:latest

# Pindah ke direktori data Node-RED di dalam container
WORKDIR /data

# Menyalin package.json lokal agar Render menginstall semua node palette Anda secara otomatis
COPY package.json /data/package.json
RUN npm install --unsafe-perm --no-update-notifier --no-fund --only=production

# Menyalin file konfigurasi dan flows dari komputer Anda ke Render
COPY settings.js /data/settings.js
COPY flows.json /data/flows.json

ENV PORT=1880
EXPOSE 1880
