FROM postgres:15.8-bullseye@sha256:e17216b3d764631c957c30fec3c3eba90ca468481187d188c0417d46a42e2a7b

RUN find / -type f -perm /u+s -ignore_readdir_race -exec chmod u-s {} \; && \
    find / -type f -perm /g+s -ignore_readdir_race -exec chmod g-s {} \;

USER postgres

HEALTHCHECK --interval=5s --retries=20 CMD ["pg_isready"]
