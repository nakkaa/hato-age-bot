#!/usr/bin/env bash

sudden_death_url="$(yq .tool.uv.sources.sudden-death.git pyproject.toml)"
sudden_death_branch="$(yq .tool.uv.sources.sudden-death.branch pyproject.toml)"
uv add "git+$sudden_death_url" --branch "$sudden_death_branch"
