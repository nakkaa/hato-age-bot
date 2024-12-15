#!/usr/bin/env bash

cp .env.example .env
source .venv/bin/activate
uv run unittest
