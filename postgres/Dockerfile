FROM postgres:15.10-bullseye@sha256:860206224dcd5c3d7e56a5b619ba6176dc89700de9395c4ad4b5c2c8dd483fc4

RUN find / -type f -perm /u+s -ignore_readdir_race -exec chmod u-s {} \; && \
    find / -type f -perm /g+s -ignore_readdir_race -exec chmod g-s {} \;

USER postgres

HEALTHCHECK --interval=5s --retries=20 CMD ["pg_isready"]
