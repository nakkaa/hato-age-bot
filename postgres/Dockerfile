FROM postgres:15.10-bullseye@sha256:dd405e3a3af63b755cbd65bbe54391c712f6c97d8ebe560c3f9303589a5e21ae

RUN find / -type f -perm /u+s -ignore_readdir_race -exec chmod u-s {} \; && \
    find / -type f -perm /g+s -ignore_readdir_race -exec chmod g-s {} \;

USER postgres

HEALTHCHECK --interval=5s --retries=20 CMD ["pg_isready"]
