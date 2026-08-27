FROM python:3.10-slim

RUN apt-get update && apt-get install -y --no-install-recommends curl ca-certificates

# Steps to install uv (https://docs.astral.sh/uv/guides/integration/docker/#installing-uv)
ENV UV_VERSION=0.8.13
ADD https://astral.sh/uv/$UV_VERSION/install.sh /uv-installer.sh

# Run the installer then remove it
RUN sh /uv-installer.sh && rm /uv-installer.sh

# Ensure the installed binary is on the `PATH`
ENV PATH="/root/.local/bin/:$PATH"

WORKDIR /code

# Install dependencies
COPY ./pyproject.toml ./uv.lock ./
RUN uv sync

COPY . .

CMD ["uv", "run", "waitress-serve", "--listen", "*:5000", "--call", "esdlvalidator.api.manage:create_app"]