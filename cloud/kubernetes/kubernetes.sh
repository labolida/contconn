#!/bin/bash

# If you are using minikube, don't forget to 
# minikube start

kubectl get namespace,nodes,deployments,svc,pods,replicationcontroller,PersistentVolumes --all-namespaces=true

#echo kubectl apply -f kube-deployment.yaml

#echo kubectl expose deploy contconn-deployment --type NodePort --port 8321

#echo minikube service reverse-proxy-spring-boot-deployment --url


echo IIIIII contconn-01   01  namespace 1  NodePort
echo IIIIII contconn-02   02  namespace 1  NodePort
echo IIIIII contconn-03   03  namespace 2  NodePort
echo IIIIII contconn-04   04  namespace 2  NodePort
echo IIIIII contconn-05   05  namespace 1  Cluster
echo IIIIII contconn-06   06  namespace 1  Cluster
echo IIIIII contconn-07   07  namespace 2  Cluster
echo IIIIII contconn-08   08  namespace 2  Cluster


#kubectl apply -f contconn-01.yaml
kubectl apply -f contconn-02.yaml
kubectl apply -f contconn-03.yaml
kubectl apply -f contconn-04.yaml
kubectl apply -f contconn-05.yaml
kubectl apply -f contconn-06.yaml
kubectl apply -f contconn-07.yaml
kubectl apply -f contconn-08.yaml


kubectl get namespace,nodes,deployments,svc,pods,replicationcontroller,PersistentVolumes --all-namespaces=true