FROM python:3.10-slim

RUN apt-get update && apt-get install -y --no-install-recommends curl ca-certificates

# The base image ships an old pip with a vendored certifi bundle that still trusts the
# eMudhra/emSign root CAs affected by the October 2026 key-compromise incident
# (https://discuss.python.org/t/109576). Upgrade it using a checksum-pinned install so
# it succeeds safely even if TLS trust were still compromised.
RUN python3 -m pip install --no-cache-dir --upgrade \
    "pip @ https://files.pythonhosted.org/packages/3f/06/3e4420302363fbb71be3c7f35ce042f54bfca330e3e66b3a2e3c4cca579f/pip-26.2.2-py3-none-any.whl#sha256=fd7f4dfa8190e014013b9f08f3e973f4e4c26ffd179a204895533a7254813a70"

# Steps to install uv (https://docs.astral.sh/uv/guides/integration/docker/#installing-uv)
ENV UV_VERSION=0.13.5
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