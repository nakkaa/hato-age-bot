#!/usr/bin/env bash

uv tool run autopep8 --exit-code --in-place --recursive .
uv tool run pyink --config .python-black .
uv tool run isort --sp .isort.cfg .
