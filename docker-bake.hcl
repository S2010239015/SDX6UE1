// Definiere einen Build-Block für die Anwendung
group "default" {
  targets = ["app"]
}

// Definiere das Ziel für die Anwendung
target "app" {
  // Der Dockerfile-Pfad
  dockerfile = "Dockerfile"
  // Kontextpfad für den Build (Verzeichnis des Dockerfiles)
  context = "."
  // Tags für das gebaute Image, setzen Sie hier Ihren gewünschten Tag
  tags = ["meine-app:v1.0.0"]
  // Plattformen, für die das Image gebaut werden soll
  platforms = ["linux/amd64", "linux/arm64"]
  // Weitere Build-Argumente können hier angegeben werden
}
