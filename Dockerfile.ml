ARG FULL_TAG=latest
FROM apluslms/grade-python:math-$FULL_TAG

RUN pip_install \
    networkx~=2.8.8 \
    pandas~=1.5.3 \
    scikit-learn \
 && :
