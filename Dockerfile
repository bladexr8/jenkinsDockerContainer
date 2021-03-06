FROM jenkins

MAINTAINER bladexr8@gmail.com
ENV REFRESHED_AT 2017-01-27

# Initial Setup - update package list and add Jenkins user to sudo
USER root
RUN apt-get -qqy update; apt-get install -qqy sudo
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers

# Install Docker (if required)
# RUN wget http://get.docker.com/builds/Linux/x86_64/docker-latest.tgz
# RUN tar -xvzf docker-latest.tgz
# RUN mv docker/* /usr/bin/
# RUN rm docker-latest.tgz

# install Ant
RUN apt-get install -qqy ant

# get Force.com Migration Tool
RUN wget https://gs0.salesforce.com/dwnld/SfdcAnt/salesforce_ant_39.0.zip
RUN mkdir /force_tool
RUN unzip salesforce_ant_39.0.zip -d /force_tool/
RUN rm salesforce_ant_39.0.zip

# copy ant-salesforce.jar to ant/lib
RUN cp /force_tool/ant-salesforce.jar /usr/share/ant/lib

# install jenkins plugins
USER jenkins
RUN /usr/local/bin/install-plugins.sh junit git git-client ssh-slaves greenballs chucknorris

# recommended to install pipeline plugin through GUI to ensure dependencies are
# installed correctly - https://stackoverflow.com/questions/34722609/error-when-installing-jenkins-workflow-plugin
