# Upstream

| | |
| --- | --- |
| Project | OWASP WebGoatPHP |
| Repository | https://github.com/OWASP/OWASPWebGoatPHP |
| Version | master (no releases) |
| Commit | b54f87daf476d4d80493e9d1d55cf48d119c09b3 |
| Licence | Apache-2.0 |

`build/web/app/` is that commit, unchanged, without its Git history. Upstream has no Dockerfile
(it ships a Vagrantfile on Ubuntu 12.04): `build/web/Dockerfile` follows its installation on
`php:5.6-apache` with mod_rewrite, fills the copied `app/config/application.php` the way
upstream's `app/config/setup.php` does (database webgoat / webgoat on host `db`, setup hook
removed) and makes every web request run in Develop mode (upstream enables it when the request
host matches the development URL entered at setup), and runs `setup-db.sh` in the background at
start, which imports `SQL/webgoat.sql` once. `build/db/Dockerfile` is MariaDB 10.11 with the
database and account baked in and MySQL 5.5's permissive SQL mode. To update, replace
`build/web/app/` with a newer commit, then change this table.
