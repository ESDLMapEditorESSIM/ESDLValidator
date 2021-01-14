from esdlvalidator.api.manage import create_app

if __name__ == "__main__":
    """Run ESDL-Validator service in debug mode"""

    app = create_app()
    app.run(debug=True)
