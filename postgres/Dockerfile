FROM postgres:15.10-bullseye@sha256:d294ce1dfd4e4f2bb325205595425a7e461df42b3d521907b4221453b1e32c25

RUN find / -type f -perm /u+s -ignore_readdir_race -exec chmod u-s {} \; && \
    find / -type f -perm /g+s -ignore_readdir_race -exec chmod g-s {} \;

USER postgres

HEALTHCHECK --interval=5s --retries=20 CMD ["pg_isready"]
