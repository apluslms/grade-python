ARG FULL_TAG=latest
FROM apluslms/grade-python:math-$FULL_TAG

RUN pip_install \
    networkx==3.2.1 \
    pandas~=2.3.3 \
    scikit-learn \
 && :
