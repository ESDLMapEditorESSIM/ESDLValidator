import os

from esdlvalidator.api.manage import create_app

HOSTNAME = "HOSTNAME"
PORT = "PORT"

if __name__ == "__main__":
    """Run ESDL-Validator service in debug mode"""

    app = create_app()
    host_name = os.getenv(HOSTNAME, "localhost")
    port = os.getenv(PORT, "5000")
    app.run(debug=True, host=host_name, port=int(port))
