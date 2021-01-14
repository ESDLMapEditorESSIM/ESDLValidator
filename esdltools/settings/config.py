import environ


@environ.config()
class _appConfig:
    version = "0.1"
    title = environ.var("ESDL-Tools", name="ESDLTOOLS_TITLE")
    description = environ.var("ESDL statistics and validation API", name="ESDLTOOLS_DESCRIPTION")
    endpoint_prefix = environ.var("", name="ESDLTOOLS_ENDPOINT_PREFIX")
    use_default_cors = environ.var(False, converter=bool, name="ESDLTOOLS_DEFAULT_CORS")
    db_location = environ.var("schemas.db", name="ESDLTOOLS_DB_LOCATION")


AppConfig = _appConfig.from_environ()
