# Build stage
FROM golang:1.18-alpine AS build
WORKDIR /home/user
COPY . .
RUN go mod download
RUN go build -o /main

# Final stage
FROM alpine:latest
WORKDIR /home/user

# Kopieren der ausführbaren Datei aus dem Build
COPY --from=build /main .

# Verzeichnis für tmp Dateien und Rechte angepasst für user
RUN mkdir /home/user/tmp && \
    adduser -D user && \
    chown -R user:user /home/user

# Umgebungsvariable für temporäre Dateien festlegen
ENV TMPDIR=/home/user/tmp

# Nutze einen Nicht-Root-Benutzer
USER user

ENTRYPOINT ["/home/user/main"]
EXPOSE 8080
CMD ["serve"]
