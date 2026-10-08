# OWASP WebGoatPHP

[WebGoatPHP](https://github.com/OWASP/OWASPWebGoatPHP) by Abbas Naderi, Johanna Curiel, Shivam
Dixit and the OWASP contributors: a port of OWASP WebGoat to PHP and MySQL, an interactive
teaching environment where each lesson is a vulnerability to exploit, with single-user, workshop,
contest and secure coding modes. This repository runs it with [Isoloom](https://www.isoloom.com):
[`isoloom.yml`](isoloom.yml) describes the machines, and the upstream source in
[`build/web/app/`](build/web/app) is served by a PHP 5.6 / Apache image written for it (upstream
ships a Vagrant box, no Dockerfile), with its database imported at first start.

| Machine | Service |
| --- | --- |
| web | WebGoatPHP (PHP 5.6, Apache) on port 80, published on 8031 |
| db | MariaDB 10.11 on port 3306 |

## Run it

```bash
isoloom generate
isoloom run docker
```

Then open http://localhost:8031/, log in as `guest` / `guest` and start single-user mode. The
same spec runs as Docker on a local VM (`docker-vm`), on a cloud VM (`cloud-docker`) or on
Kubernetes. Lab guide: the hints, plan and solution buttons of each lesson, and the
[WebGoatPHP README](https://github.com/OWASP/OWASPWebGoatPHP#readme).

Upstream version and commit: [UPSTREAM.md](UPSTREAM.md).

## Licence

Apache-2.0, as WebGoatPHP ([LICENSE](LICENSE)). This application is deliberately vulnerable: keep
it isolated.
