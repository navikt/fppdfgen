FROM navikt/pdfgen:6529933f8b60a8463b315c68865ad5772a40274d

COPY templates /app/templates
COPY fonts /app/fonts
COPY resources /app/resources
