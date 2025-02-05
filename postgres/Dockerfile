FROM postgres:15.10-bullseye@sha256:a875f9795e193953526bfb309ddc1313bb84bd147bd901fa5016d97abd169121

RUN find / -type f -perm /u+s -ignore_readdir_race -exec chmod u-s {} \; && \
    find / -type f -perm /g+s -ignore_readdir_race -exec chmod g-s {} \;

USER postgres

HEALTHCHECK --interval=5s --retries=20 CMD ["pg_isready"]
