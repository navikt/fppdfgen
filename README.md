# FpPdfGen
Repository for team foreldrepenger pdfgen templates, based on [pdfgen](https://github.com/navikt/pdfgen) and [syfopdfgen](https://github.com/navikt/syfopdfgen).

## Technologies & Tools

* [pdfgen](https://github.com/navikt/pdfgen)

## Getting started
### Run in development mode
To run the application with templates, data and fonts locally mounted you can use
```bash
docker run \
        -v /full/path/to/templates:/app/templates \
        -v /full/path/to/fonts:/app/fonts \
        -v /full/path/to/data:/app/data \
        -v /full/path/to/resources:/app/resources \
        -p 8180:8080 \
        -e DISABLE_PDF_GET=false \
        -it \
        --rm \
        navikt/pdfgen
```

Or you can use the convenience script `./run_development.sh`

When running the application you can use the env var `DISABLE_PDF_GET` to enable GET requests at
`/api/v1/genpdf/<application>/<template>` which looks for test data at `data/<application>/<template>.json` and outputs
a PDF to your browser. Additionally, the template folder will be fetched on every request, and reflect any changes made
since the last GET, making this ideal for developing new templates for your application.

The template and data directory structure both follow the `<application>/<template>` structure.
Example url: `http://0.0.0.0:8180/api/v1/genpdf/tilbakebetaling/tilbakebetaling`

### Notes on developing templates on Windows
It is a known issue that pdfgen's output documents look different depending on whether the template
has `\r\n` or `\n` as line endings. Therefore, it is strongly recommended to configure Git to not convert newlines, as well as ensure that your editor ends its lines with LF (`\n`) and not CRLF (`\r\n`), as the former will accurately show what your
templates will look like in production.

## Contact us
### Code/project related questions can be sent to
* nav.team.foreldrepenger@nav.no

### For NAV employees
We are also available on the slack channel #teamforeldrepenger for internal communication.
