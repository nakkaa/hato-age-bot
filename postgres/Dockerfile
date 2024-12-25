FROM postgres:15.10-bullseye@sha256:64c75e82b01c09a8fce09cf03f52f2c7c20f7b7530ab1fa51c678fff826af6f0

RUN find / -type f -perm /u+s -ignore_readdir_race -exec chmod u-s {} \; && \
    find / -type f -perm /g+s -ignore_readdir_race -exec chmod g-s {} \;

USER postgres

HEALTHCHECK --interval=5s --retries=20 CMD ["pg_isready"]
