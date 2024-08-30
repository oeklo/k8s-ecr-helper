FROM amazon/aws-cli:2.17.41

COPY ./kubernetes.repo /etc/yum.repos.d/
RUN yum install -y kubectl jq &&\
    yum clean all
