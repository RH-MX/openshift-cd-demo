REMOTE_REGISTRY="docker-registry-default.apps.example.com"


oc login
oc whoami -t
docker login -u user -p token registry.redhat.io
docker login -u user -p token ${REMOTE_REGISTRY}


#jenkins
docker pull registry.redhat.io/openshift3/jenkins-2-rhel7:latest
docker pull registry.redhat.io/openshift3/jenkins-1-rhel7:latest
docker tag registry.redhat.io/openshift3/jenkins-2-rhel7:latest ${REMOTE_REGISTRY}/openshift/jenkins:2
docker tag registry.redhat.io/openshift3/jenkins-1-rhel7:latest ${REMOTE_REGISTRY}/openshift/jenkins:1
docker tag registry.redhat.io/openshift3/jenkins-2-rhel7:latest ${REMOTE_REGISTRY}/openshift/jenkins:latest
docker push ${REMOTE_REGISTRY}/openshift/jenkins:2
docker push ${REMOTE_REGISTRY}/openshift/jenkins:latest
docker push ${REMOTE_REGISTRY}/openshift/jenkins:1


#nexus
oc delete is nexus3 -n openshift
docker pull sonatype/nexus3
docker tag sonatype/nexus3 ${REMOTE_REGISTRY}/sonatype/nexus3:latest
docker push ${REMOTE_REGISTRY}/sonatype/nexus3:latest
docker tag sonatype/nexus3 ${REMOTE_REGISTRY}/openshift/nexus3:latest
docker push ${REMOTE_REGISTRY}/openshift/nexus3:latest

#postgresql
oc delete is postgresql
docker pull registry.redhat.io/rhscl/postgresql-96-rhel7:latest
docker tag registry.redhat.io/rhscl/postgresql-96-rhel7:latest ${REMOTE_REGISTRY}/openshift/postgresql:9.6
docker push ${REMOTE_REGISTRY}/openshift/postgresql:9.6

docker pull registry.redhat.io/rhscl/postgresql-95-rhel7:latest
docker tag registry.redhat.io/rhscl/postgresql-95-rhel7:latest ${REMOTE_REGISTRY}/openshift/postgresql:9.5
docker push ${REMOTE_REGISTRY}/openshift/postgresql:9.5

docker pull registry.redhat.io/rhscl/postgresql-96-rhel7:latest
docker tag registry.redhat.io/rhscl/postgresql-96-rhel7:latest ${REMOTE_REGISTRY}/openshift/postgresql:latest
docker push ${REMOTE_REGISTRY}/openshift/postgresql:latest

#gogs
oc delete is gogs
docker pull wkulhanek/gogs:latest
docker tag wkulhanek/gogs:latest ${REMOTE_REGISTRY}/openshift/gogs:latest
docker push ${REMOTE_REGISTRY}/openshift/gogs:latest

