#!/bin/sh

kubectl create secret docker-registry ${SECRET_NAME} \
--docker-server=${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com \
--docker-username=AWS \
--docker-password=$(aws ecr get-login-password) \
-oyaml --dry-run=client | kubectl apply -f -