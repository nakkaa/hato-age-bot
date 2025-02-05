#!/usr/bin/env bash

DOCKER_CMD="npm --version"
DEPENDABOT_NPM_VERSION="9.6.5"
cp .env.example .env
export TAG_NAME="${HEAD_REF//\//-}"
docker compose pull
HATO_BOT_NPM_VERSION="$(docker compose run hato-bot sh -c "${DOCKER_CMD}")"
echo "hato-bot npm version:" "${HATO_BOT_NPM_VERSION}"
NPM_PATTERN_PACKAGE="s/\"npm\": \".*\"/\"npm\": \"^${HATO_BOT_NPM_VERSION} || ^${DEPENDABOT_NPM_VERSION}\"/g"
sed -i -e "${NPM_PATTERN_PACKAGE}" package.json
bash "${GITHUB_WORKSPACE}/scripts/deploy_hato_bot/npm_install.sh"
