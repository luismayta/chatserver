FROM labpositiva/latex:3.6.1
MAINTAINER Luis Mayta <@slovacus>

ARG env
ARG version

LABEL NAME chatserver-docs-$env
LABEL VERSION $version

COPY ./requirements/ /usr/src/requirements/
COPY ./requirements.txt /usr/src/requirements.txt

# set working directory to /usr/src
WORKDIR /usr/src

# Install sphinx dependences
RUN pip install --force-reinstall -r /usr/src/requirements/docs.txt
