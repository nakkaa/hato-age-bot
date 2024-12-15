#!/usr/bin/env bash

cp .env.example .env
source .venv/bin/activate
uv python -m unittest
