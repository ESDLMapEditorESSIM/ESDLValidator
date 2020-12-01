from pathlib import Path
from autodiscover import AutoDiscover

path = Path('./esdltools/validation/functions')
autodiscover = AutoDiscover(path)
autodiscover()
