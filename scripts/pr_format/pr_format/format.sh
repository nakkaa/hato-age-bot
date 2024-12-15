#!/usr/bin/env bash

uv sync
uv tool autopep8 --exit-code --in-place --recursive .
uv tool pyink --config .python-black .
uv tool isort --sp .isort.cfg .
