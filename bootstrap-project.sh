#!/bin/bash

# Function to print error messages
function error {
    echo "Error: $1"
    exit 1
}

# Check if project name is provided
if [ -z "$1" ]; then
    error "No project name provided. Usage: bash bootstrap.sh <project_name>"
fi

# Define project name
PROJECT_NAME="$1"

# Create main project directory
mkdir -p $PROJECT_NAME || error "Failed to create project directory."

# Create main package directory and subpackage
mkdir -p $PROJECT_NAME/$PROJECT_NAME || error "Failed to create main package directory."
mkdir -p $PROJECT_NAME/$PROJECT_NAME/subpackage || error "Failed to create subpackage directory."

# Create tests directory
mkdir -p $PROJECT_NAME/tests || error "Failed to create tests directory."

# Create docs directory
mkdir -p $PROJECT_NAME/docs || error "Failed to create docs directory."

# Create scripts directory
mkdir -p $PROJECT_NAME/scripts || error "Failed to create scripts directory."

# Create __init__.py files
touch $PROJECT_NAME/$PROJECT_NAME/__init__.py || error "Failed to create __init__.py in main package directory."
touch $PROJECT_NAME/$PROJECT_NAME/subpackage/__init__.py || error "Failed to create __init__.py in subpackage directory."
touch $PROJECT_NAME/tests/__init__.py || error "Failed to create __init__.py in tests directory."

# Create module files
cat > $PROJECT_NAME/$PROJECT_NAME/module1.py << EOL
# $PROJECT_NAME/module1.py

def hello():
    return "Hello from module1"
EOL

touch $PROJECT_NAME/$PROJECT_NAME/module2.py || error "Failed to create module2.py."

cat > $PROJECT_NAME/$PROJECT_NAME/subpackage/submodule.py << EOL
# $PROJECT_NAME/subpackage/submodule.py

def sub_hello():
    return "Hello from submodule"
EOL

# Create test files
cat > $PROJECT_NAME/tests/test_module1.py << EOL
# $PROJECT_NAME/tests/test_module1.py

import unittest
from $PROJECT_NAME.module1 import hello

class TestModule1(unittest.TestCase):
    def test_hello(self):
        self.assertEqual(hello(), "Hello from module1")

if __name__ == "__main__":
    unittest.main()
EOL

touch $PROJECT_NAME/tests/test_module2.py || error "Failed to create test_module2.py."

# Create README.md
cat > $PROJECT_NAME/README.md << EOL
# My Project

A brief description of what my project does and how to set it up.

## Installation

\`\`\`bash
pip install -r requirements.txt
\`\`\`

## Usage

\`\`\`python
from $PROJECT_NAME import module1
print(module1.hello())
\`\`\`
EOL

# Create requirements.txt
touch $PROJECT_NAME/requirements.txt || error "Failed to create requirements.txt."

# Create setup.py
cat > $PROJECT_NAME/setup.py << EOL
# setup.py

from setuptools import setup, find_packages

setup(
    name="$PROJECT_NAME",
    version="0.1",
    packages=find_packages(),
    install_requires=[
        # Add your dependencies here
    ],
)
EOL

# Create setup.cfg
touch $PROJECT_NAME/setup.cfg || error "Failed to create setup.cfg."

# Create LICENSE file
touch $PROJECT_NAME/LICENSE || error "Failed to create LICENSE file."

# Create .gitignore
cat > $PROJECT_NAME/.gitignore << EOL
# Byte-compiled / optimized / DLL files
__pycache__/
*.py[cod]
*$py.class

# C extensions
*.so

# Distribution / packaging
.Python
build/
develop-eggs/
dist/
downloads/
eggs/
.eggs/
lib/
lib64/
parts/
sdist/
var/
wheels/
share/python-wheels/
*.egg-info/
.installed.cfg
*.egg

# PyInstaller
#  Usually these files are written by a python script from a template
#  before PyInstaller builds the exe, so as to inject date/other infos into it.
*.manifest
*.spec

# Installer logs
pip-log.txt
pip-delete-this-directory.txt

# Unit test / coverage reports
htmlcov/
.tox/
.nox/
.coverage
.coverage.*
.cache
nosetests.xml
coverage.xml
*.cover
.hypothesis/

# Translations
*.mo
*.pot

# Django stuff:
*.log
local_settings.py
db.sqlite3

# Flask stuff:
instance/
.webassets-cache

# Scrapy stuff:
.scrapy

# Sphinx documentation
docs/_build/

# PyBuilder
target/

# Jupyter Notebook
.ipynb_checkpoints

# IPython
profile_default/
ipython_config.py

# pyenv
.python-version

# celery beat schedule file
celerybeat-schedule.*

# dotenv
.env
.venv
env/
venv/
ENV/
env.bak/
venv.bak/

# Spyder project settings
.spyderproject
.spyderworkspace

# Rope project settings
.ropeproject

# mkdocs documentation
/site

# mypy
.mypy_cache/
.dmypy.json
dmypy.json

# Pyre type checker
.pyre/
EOL

echo "Project $PROJECT_NAME created successfully!"

