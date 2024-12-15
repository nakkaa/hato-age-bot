#!/usr/bin/env bash

uv pip sync
uv autopep8 --exit-code --in-place --recursive .
uv pyink --config .python-black .
uv isort --sp .isort.cfg .
