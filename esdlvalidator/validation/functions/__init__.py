from pathlib import Path
from autodiscover import AutoDiscover

path = Path('./esdlvalidator/validation/functions')
autodiscover = AutoDiscover(path)
autodiscover()
