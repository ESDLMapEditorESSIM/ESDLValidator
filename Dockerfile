FROM python:3-alpine

RUN apk add --update --no-cache g++ gcc libxslt-dev

COPY requirements.txt /tmp/
RUN pip install --no-cache-dir -r /tmp/requirements.txt

RUN addgroup -g 1000 appgroup
RUN adduser -u 1000 -G appgroup -h /home/appuser -D appuser

WORKDIR /home/appuser
USER appuser

COPY . .

CMD ["waitress-serve", "--listen", "*:8080", "--call", "api.wsgi:create_app"]