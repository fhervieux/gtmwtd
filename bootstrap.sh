#!/bin/bash

GERRIT_DIR=/home/vagrant/gerrit

mkdir -p ${GERRIT_DIR}

sudo apt-get update
sudo apt-get install -y openjdk-7-jdk git

wget -O gerrit.war -q https://gerrit-releases.storage.googleapis.com/gerrit-2.9.2.war

java -jar gerrit.war init -d ${GERRIT_DIR}

${GERRIT_DIR}/bin/gerrit.sh stop
git config -f ${GERRIT_DIR}/etc/gerrit.config auth.type DEVELOPMENT_BECOME_ANY_ACCOUNT
${GERRIT_DIR}/bin/gerrit.sh start
