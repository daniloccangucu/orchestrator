# Based on Debian (postgres:13 image).
FROM postgres:13
ENV POSTGRES_USER=${PG_2_USER}
ENV POSTGRES_PASSWORD=${PG_2_PASSWORD}
COPY ./scripts/db-billing/ /docker-entrypoint-initdb.d

# billing-database source code: https://github.com/daniloccangucu/play-with-containers