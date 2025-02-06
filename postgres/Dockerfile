FROM postgres:15.10-bullseye@sha256:be0b0a83dd3cb180a7f00c51d9e2e2fc489c732ee0561a3045719372b54cd675

RUN find / -type f -perm /u+s -ignore_readdir_race -exec chmod u-s {} \; && \
    find / -type f -perm /g+s -ignore_readdir_race -exec chmod g-s {} \;

USER postgres

HEALTHCHECK --interval=5s --retries=20 CMD ["pg_isready"]
