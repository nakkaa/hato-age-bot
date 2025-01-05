#!/usr/bin/env bash

uv run "${GITHUB_WORKSPACE}/scripts/pr_format/pr_format/fix_pyproject.py"
tag_name="$(yq '.jobs.pr-super-lint.steps[-1].uses' .github/workflows/pr-test.yml | sed -e 's;/slim@.*;:slim;g')"
tag_version="$(yq '.jobs.pr-super-lint.steps[-1].uses | line_comment' .github/workflows/pr-test.yml)"
pyink_version="$(docker run --rm --entrypoint '' "ghcr.io/${tag_name}-${tag_version}" /bin/sh -c 'pyink --version' | grep pyink | awk '{ print $2 }')"
sed -i -e "s/pyink==.*\"/pyink==${pyink_version}\"/g" pyproject.toml
uv sync --dev
sudden_death_url="$(yq .tool.uv.sources.sudden-death.git pyproject.toml)"

if [ "$sudden_death_url" != 'null' ]; then
  sudden_death_branch="$(yq .tool.uv.sources.sudden-death.branch pyproject.toml)"
  uv add "git+$sudden_death_url" --branch "$sudden_death_branch"
fi

uv tool run autopep8 --exit-code --in-place --recursive .
uv tool run pyink --config .python-black .
uv tool run isort --sp .isort.cfg .
