
PYTHON ?= python3.12
VENV = venv
ACTIVATE = . $(VENV)/bin/activate
PIP = $(VENV)/bin/pip3
PY = $(VENV)/bin/python3


.DEFAULT_GOAL := help


help:
	@echo "Available commands:"
	@echo "  make setup     -> create venv + install deps"
	@echo "  make dev       -> run dev server (auto reload)"
	@echo "  make run       -> run normal server"
	@echo "  make reset     -> remove venv + reinstall"
	@echo "  make clean     -> remove venv + cache"


setup:
	@if [ ! -d "$(VENV)" ]; then \
		echo "Creating venv using $(PYTHON)..."; \
		$(PYTHON) -m venv $(VENV); \
	fi
	@echo "Installing dependencies..."
	@$(PIP) install --upgrade pip
	@if [ -f requirements.txt ]; then \
		$(PIP) install -r requirements.txt; \
	else \
		$(PIP) install flask feedparser; \
	fi


dev: setup
	@echo "Starting dev server..."
	@FLASK_ENV=development FLASK_DEBUG=1 $(PY) -m flask run --host=0.0.0.0 --port=5000


run: setup
	@echo "Starting server..."
	@$(PY) app.py


reset:
	@echo "Removing venv..."
	@rm -rf $(VENV)
	@make setup


clean:
	@echo "Cleaning..."
	@rm -rf $(VENV)
	@find . -name "__pycache__" -type d -exec rm -rf {} +
	@find . -name "*.pyc" -delete
