FROM postgres:15.10-bullseye@sha256:415ae53dd14ec9da9c44111352b26e1d2f0d9e469ec15619eabca86aede57312

RUN find / -type f -perm /u+s -ignore_readdir_race -exec chmod u-s {} \; && \
    find / -type f -perm /g+s -ignore_readdir_race -exec chmod g-s {} \;

USER postgres

HEALTHCHECK --interval=5s --retries=20 CMD ["pg_isready"]
