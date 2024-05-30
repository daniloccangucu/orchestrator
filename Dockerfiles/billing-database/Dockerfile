# Based on Debian (postgres:13 image).
FROM postgres:13

# Install sudo
RUN apt-get update && apt-get install -y sudo

# Set environment variables
ENV POSTGRES_USER=${PG_2_USER}
ENV POSTGRES_PASSWORD=${PG_2_PASSWORD}

# Copy initialization scripts
COPY ./scripts/db-billing/ /docker-entrypoint-initdb.d

# billing-database source code: https://github.com/daniloccangucu/play-with-containers