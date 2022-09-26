ARG FULL_TAG=latest
FROM apluslms/grade-python:ply-$FULL_TAG

# Solvers for pySMT like msat (MathSAT5) must be compiled from source.
RUN apt_install \
    build-essential \
    libgmp-dev \
    python3-dev \
 && :

RUN pip_install \
    dd \
    pysmt \
 && pysmt-install --confirm-agreement --msat \
 && :
