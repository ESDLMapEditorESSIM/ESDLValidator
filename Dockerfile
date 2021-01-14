FROM python:3-alpine

RUN apk add --update --no-cache g++ gcc libxslt-dev

COPY requirements.txt /tmp/
RUN pip install --no-cache-dir -r /tmp/requirements.txt

RUN addgroup -g 1000 esdlgroup
RUN adduser -u 1000 -G esdlgroup -h /home/esdluser -D esdluser

WORKDIR /home/esdluser
USER esdluser

COPY . .

CMD ["waitress-serve", "--listen", "*:8080", "--call", "esdltools.api.manage:create_app"]