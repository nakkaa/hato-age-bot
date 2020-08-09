FROM python:3.8.2-alpine

ENV WORKON_HOME=/usr/src/venv

WORKDIR /usr/src/app
COPY . .

# 実行時に必要なパッケージ (グループ名: .used-packages)
# * bash: entrypoint.shを実行する際に使用
# * postgresql-libs: psycopg2を使用する際に必要
#
# Pythonライブラリのインストール時に必要なパッケージ (グループ名: .build-deps, Pythonライブラリインストール後にアンインストール)
# * jpeg-dev, zlib-dev: Pillowのインストールの際に必要
# * git: Pythonライブラリのインストールの際に必要
# * gcc, musl-dev, postgresql-dev: psycopg2のインストールの際に必要
RUN apk add --no-cache -t .used-packages bash=5.0.11-r1 postgresql-libs=12.2-r0 && \
    apk add --no-cache -t .build-deps jpeg-dev=8-r6 zlib-dev=1.2.11-r3 git=2.24.3-r0 gcc=9.2.0-r4 musl-dev=1.1.24-r2 postgresql-dev=12.2-r0 && \
    pip install pipenv==2020.6.2 --no-cache-dir && \
    pipenv install && \
    apk --purge del .build-deps

CMD ["bash", "./entrypoint.sh"]
