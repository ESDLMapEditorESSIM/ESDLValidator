from esdltools.api.manage import create_app

if __name__ == '__main__':
    """Run ESDL API in debug mode"""

    app = create_app()
    app.run(debug=True)
