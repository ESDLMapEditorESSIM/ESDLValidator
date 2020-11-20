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


https://docs.mapbox.com/mapbox-gl-js/style-spec/expressions/


Expressions in Mapbox GL JS
Mapbox GL JS expressions uses a Lisp-like syntax, using JSON arrays. Expressions in Mapbox GL JS follow this format:

[expression_name, argument_0, argument_1, ...]
The expression_name is the expression operator. For example, you would use * to multiply two arguments:

['*', ['pi'], ['^', 3, 2]]
The first argument is pi, which is an expression that returns the mathematical constant pi. The second argument is another expression in which ^ has two arguments of its own. It will return 32, and the result will be multiplied by pi.