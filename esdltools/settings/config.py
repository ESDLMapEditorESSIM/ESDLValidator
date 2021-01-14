import environ


@environ.config()
class _appConfig:
    app_version = "0.1"
    app_title = environ.var("ESDL-Tools", name="APP_TITLE")
    app_description = environ.var("ESDL statistics and validation API", name="APP_DESCRIPTION")

    db_location = environ.var("schemas.db", name="DB_LOCATION")


AppConfig = _appConfig.from_environ()
