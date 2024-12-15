#!/usr/bin/env bash

cp .env.example .env
uv run python -m unittest
