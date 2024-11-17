FROM postgres:15.9-bullseye@sha256:eded0954fe8b303889e166cfc3642e9dcc55ae3e2b11f6c050bc273f52fe8f43

RUN find / -type f -perm /u+s -ignore_readdir_race -exec chmod u-s {} \; && \
    find / -type f -perm /g+s -ignore_readdir_race -exec chmod g-s {} \;

USER postgres

HEALTHCHECK --interval=5s --retries=20 CMD ["pg_isready"]
