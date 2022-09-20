#!/bin/bash

# If you are using minikube, don't forget to 
# minikube start

echo kubectl apply -f kube-deployment.yaml

echo kubectl expose deploy contconn-deployment --type NodePort --port 8321

echo kubectl get deployments,pods,svc

echo minikube service reverse-proxy-spring-boot-deployment --url
