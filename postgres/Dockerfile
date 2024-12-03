FROM postgres:15.10-bullseye@sha256:2a02f5ec0473281908c96f9f3687e6c077b97fdf282e6d45ce07795bbe41f00f

RUN find / -type f -perm /u+s -ignore_readdir_race -exec chmod u-s {} \; && \
    find / -type f -perm /g+s -ignore_readdir_race -exec chmod g-s {} \;

USER postgres

HEALTHCHECK --interval=5s --retries=20 CMD ["pg_isready"]
