FROM python:3-alpine

ENV ESDLVALIDATOR_HOSTNAME=localhost
ENV ESDLVALIDATOR_PORT=5000
ENV ESDLVALIDATOR_MONGODB_HOST=localhost
ENV ESDLVALIDATOR_MONGODB_PORT=27017
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
CMD ["sh", "-c", "waitress-serve --listen *:$ESDLVALIDATOR_PORT --call esdlvalidator.api.manage:create_app"]