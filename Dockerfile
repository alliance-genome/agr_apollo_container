# Apollo2.X
ARG DOCKER_PULL_TAG=latest
ARG REG=agrdocker
FROM ${REG}/agr_apollo_env:${DOCKER_PULL_TAG}

# probably need something like this ^^^

#FROM gmod/agr-apollo-base:1.0
MAINTAINER Scott Cain <scott@scottcain.net>

RUN pwd
WORKDIR /
RUN pwd
RUN git clone --single-branch --branch add-frogs-apollo https://github.com/alliance-genome/agr_jbrowse_config.git jbrowse
RUN chown -R apollo:apollo /jbrowse
WORKDIR /jbrowse/scripts
RUN pwd
RUN ./fetch_vcf.sh apollo


CMD "/launch.sh"

# wait and add organisms after launch if not already there, or do it in the launch script


