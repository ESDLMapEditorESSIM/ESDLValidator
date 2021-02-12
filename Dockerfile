FROM python:3-alpine

ENV ESDLVALIDATOR_DB_LOCATION=/storage/schemas.db
RUN apk add --update --no-cache g++ gcc libxslt-dev
COPY requirements.txt /tmp/
RUN pip install --no-cache-dir -r /tmp/requirements.txt &&\
    addgroup -g 1000 esdlgroup &&\
    adduser -u 1000 -G esdlgroup -h /home/esdluser -D esdluser &&\
    mkdir /storage &&\
    chown esdluser: /storage
VOLUME /storage
WORKDIR /home/esdluser
USER esdluser
COPY . .
EXPOSE 3011
CMD ["waitress-serve", "--listen", "*:3011", "--call", "esdlvalidator.api.manage:create_app"]