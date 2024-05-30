# Based on Debian (postgres:13 image).
FROM postgres:13
ENV POSTGRES_USER=${PGUSER}
ENV POSTGRES_PASSWORD=${PGPASSWORD}
COPY ./scripts/db-inventory /docker-entrypoint-initdb.d

# inventory-database source code: https://github.com/daniloccangucu/play-with-containers