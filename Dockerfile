# setup a centos image with acmcore binary components
FROM centos:latest
MAINTAINER Harris Brakmic <brakmic@gmail.com>
RUN yum -y install git curl which xz tar findutils
RUN groupadd acmcore
RUN useradd acmcore -m -s /bin/bash -g acmcore
ENV HOME /home/acmcore
USER acmcore
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.29.0/install.sh | bash
RUN /bin/bash -l -c "nvm install v4 && nvm alias default v4"
RUN /bin/bash -l -c "npm install https://github.com/Actinium-project/acmcore.git -g"

