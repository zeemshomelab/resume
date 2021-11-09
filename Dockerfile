FROM python:3.10 as build

ARG BUILD_DEPS="build-essential libxml2-dev libxslt1-dev libffi-dev libz-dev libcairo2 libglib2.0-0 libpango-1.0-0 libpangocairo-1.0-0"
ARG RESUME

RUN apt-get update && \
    apt-get install -y $BUILD_DEPS

COPY . /app
WORKDIR /app
RUN pip3 install --no-cache-dir -r requirements.txt && \
    make

# Output
FROM nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html
EXPOSE 80
