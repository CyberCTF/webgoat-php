# The MySQL 5.5 database WebGoatPHP was written for, as MariaDB 10.11 with the values baked in:
# WebGoatPHP connects as webgoat / webgoat to the webgoat database (set in build/web/Dockerfile).
# The schema and data (upstream's SQL/webgoat.sql) are loaded by the web machine at first start.
FROM docker.io/library/mariadb:10.11
ENV MARIADB_ROOT_PASSWORD=webgoat-root \
    MARIADB_DATABASE=webgoat \
    MARIADB_USER=webgoat \
    MARIADB_PASSWORD=webgoat
CMD ["mariadbd", "--sql-mode=NO_ENGINE_SUBSTITUTION"]
