FROM agr_apollo_container

COPY client /apollo/client
COPY gradlew /apollo
COPY grails-app /apollo/grails-app
COPY gwt-sdk /apollo/gwt-sdk
COPY lib /apollo/lib
COPY src /apollo/src
COPY web-app /apollo/web-app
COPY wrapper /apollo/wrapper
COPY test /apollo/test
COPY scripts /apollo/scripts
ADD gra* /apollo/
COPY apollo /apollo/apollo
ADD build* /apollo/
ADD settings.gradle /apollo
ADD application.properties /apollo

COPY docker-files/build.sh /bin/build.sh
ADD docker-files/docker-apollo-config.groovy /apollo/apollo-config.groovy
ADD docker-files/agr-apollo-load.sql /agr-apollo-load.sql
RUN chown -R apollo:apollo /apollo
RUN ls -la /apollo

# install grails and python libraries
USER apollo

RUN pip3 install setuptools
RUN pip3 install nose "apollo==4.2"

RUN curl -s get.sdkman.io | bash && \
     /bin/bash -c "source $HOME/.sdkman/bin/sdkman-init.sh && yes | sdk install grails 2.5.5" && \
     /bin/bash -c "source $HOME/.sdkman/bin/sdkman-init.sh && yes | sdk install gradle 3.2.1"

RUN /bin/bash -c "source $HOME/.sdkman/bin/sdkman-init.sh && /bin/bash /bin/build.sh"

USER root
# remove from webapps and copy it into a staging directory
RUN rm -rf ${CATALINA_BASE}/webapps/* && \
	cp /apollo/apollo*.war ${CATALINA_BASE}/apollo.war

ADD docker-files/createenv.sh /createenv.sh
ADD docker-files/launch.sh /launch.sh

RUN pwd
WORKDIR /
RUN pwd
RUN ls

RUN git clone --single-branch --branch release-3.0.1 https://github.com/alliance-genome/agr_jbrowse_config.git jbrowse
RUN chown -R apollo:apollo /jbrowse
WORKDIR /jbrowse/scripts
RUN pwd
RUN ./fetch_vcf.sh apollo


CMD "/launch.sh"

# wait and add organisms after launch if not already there, or do it in the launch script


