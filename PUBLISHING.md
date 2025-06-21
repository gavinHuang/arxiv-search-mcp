# Publishing to PyPI

This document provides instructions for publishing the arxiv-search-mcp-server package to PyPI.

## Prerequisites

1. Make sure you have the necessary tools installed:
```bash
pip install twine build wheel
```

2. Create accounts on PyPI and Test PyPI:
   - Test PyPI: https://test.pypi.org/account/register/
   - PyPI: https://pypi.org/account/register/

3. Configure your PyPI credentials (optional but recommended):
```bash
# Create/edit ~/.pypirc
[distutils]
index-servers =
    pypi
    testpypi

[pypi]
username = __token__
password = <your-pypi-token>

[testpypi]
repository = https://test.pypi.org/legacy/
username = __token__
password = <your-testpypi-token>
```

## Building the Package

1. Clean any previous builds:
```bash
make clean
# or manually:
rm -rf build/ dist/ *.egg-info/
```

2. Build the package:
```bash
python -m build
# or using make:
make build
```

This creates two files in the `dist/` directory:
- `arxiv_search_mcp-0.1.0-py3-none-any.whl` (wheel format)
- `arxiv_search_mcp-0.1.0.tar.gz` (source distribution)

## Testing the Upload (Recommended)

First, test your package on Test PyPI:

```bash
python -m twine upload --repository testpypi dist/*
# or using make:
make upload-test
```

Then test installation from Test PyPI:
```bash
pip install --index-url https://test.pypi.org/simple/ --extra-index-url https://pypi.org/simple/ arxiv-search-mcp-server
```

## Publishing to PyPI

Once you've tested on Test PyPI, upload to the main PyPI:

```bash
python -m twine upload dist/*
# or using make:
make upload
```

## Post-Publication

After publishing:

1. Test installation from PyPI:
```bash
pip install arxiv-search-mcp-server
```

2. Test the CLI command:
```bash
arxiv-search-mcp
```

3. Update the README badges if needed
4. Tag the release in git:
```bash
git tag v0.1.0
git push origin v0.1.0
```

## Version Management

To release a new version:

1. Update the version in `pyproject.toml`
2. Update `CHANGELOG.md`
3. Update `src/arxiv_search_mcp/__init__.py`
4. Build and publish as above
5. Create a git tag for the new version

## Notes

- Make sure to update your email address in `pyproject.toml` before publishing
- Consider setting up GitHub Actions for automated publishing
- Keep your PyPI tokens secure and never commit them to version control
