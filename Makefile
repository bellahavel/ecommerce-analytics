.PHONY: setup notebooks

setup:
	pip install -r requirements.txt

notebooks:
	jupyter notebook
