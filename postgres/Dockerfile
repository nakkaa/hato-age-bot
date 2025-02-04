FROM postgres:15.10-bullseye@sha256:aa7d20018040035634fa3a17cfdf49d3bbce09f58c62d8a36b7ecb9f7dddb280

RUN find / -type f -perm /u+s -ignore_readdir_race -exec chmod u-s {} \; && \
    find / -type f -perm /g+s -ignore_readdir_race -exec chmod g-s {} \;

USER postgres

HEALTHCHECK --interval=5s --retries=20 CMD ["pg_isready"]
