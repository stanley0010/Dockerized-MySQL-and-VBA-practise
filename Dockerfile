# syntax=docker/dockerfile:1
FROM mysql:latest
COPY ./init.sql /docker-entrypoint-initdb.d/init.sql
COPY ./sample_data.sql /docker-entrypoint-initdb.d/sample_data.sql