ARG BASE_TAG=latest
FROM --platform=$TARGETPLATFORM apluslms/grading-base:$BASE_TAG

COPY rootfs /

ARG GRADER_UTILS_VER=4.10

RUN apt_install \
    python3 \
    python3-pip \
    python3-venv \
    python3-pytest \
    python3-setuptools \
 && ln -s /usr/bin/python3 /usr/local/bin/python \
 && ln -s /usr/bin/pip3 /usr/local/bin/pip \
\
 && python3 -m venv --system-site-packages /usr/local/venv_grader \
\
 && pip_install \
    rpyc==5.3.1 \
    https://github.com/apluslms/python-grader-utils/archive/v$GRADER_UTILS_VER.tar.gz \
    https://github.com/teemulehtinen/grader_qlc/archive/v1.0.5.tar.gz \
    qlcpy==1.0.18 \
 && find /usr/local/lib/python* -type d -regex '.*/locale/[a-z_A-Z]+' -not -regex '.*/\(en\|fi\|sv\)' -print0 | xargs -0 rm -rf \
 && find /usr/local/lib/python* -type d -name 'tests' -print0 | xargs -0 rm -rf

ENV PATH="/usr/local/venv_grader/bin:$PATH"

COPY bin /usr/local/bin
CMD ["run-all-unittests"]
