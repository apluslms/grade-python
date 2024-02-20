ARG FULL_TAG=latest
FROM --platform=$TARGETPLATFORM apluslms/grade-python:math-$FULL_TAG

RUN pip_install \
    networkx==3.2.1 \
    pandas~=1.5.3 \
    scikit-learn \
 && :
