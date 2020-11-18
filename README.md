# ESDL-Tools
ToDo

# Setup dev environment

Install venv
```
apt-get install python3-venv
```

Create virtual environment
```
python3 -m venv env
```

Enable virtual environment
```
source env/bin/activate
```

Install project requirements
```
pip3 install -r requirements.txt
```

## Generate static ESDL metamodel code
```
pip3 install pyecoregen
pyecoregen -e esdl.ecore -o ./
```

## Run tests
```
python -m unittest discover ./
```