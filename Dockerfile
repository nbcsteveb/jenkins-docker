FROM jenkins/jenkins:lts

USER root

VOLUME /var/run/docker.sock:/var/run/docker.sock

RUN apt-get update -y && \
    apt-get install -y \
        ca-certificates \
        apt-transport-https \
        docker \
        && \
    ## Add Yarn
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update -y && \
    apt-get install -y yarn && \
    ln -s /usr/bin/nodejs /usr/bin/node \
    ;

USER jenkins
