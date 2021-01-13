import environ


@environ.config()
class _appConfig:
    db_location = environ.var("schemas.db", name="DB_LOCATION")


AppConfig = _appConfig.from_environ()
