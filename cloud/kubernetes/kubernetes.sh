#!/bin/bash

# If you are using minikube, don't forget to 
# minikube start
#echo kubectl apply -f kube-deployment.yaml
#echo kubectl expose deploy contconn-deployment --type NodePort --port 8321
#echo minikube service reverse-proxy-spring-boot-deployment --url


echo    info\> contconn-01   namespace 1  NodePort     Replicas=2
echo    info\> contconn-02   namespace 1  NodePort     Replicas=2
echo    info\> contconn-03   namespace 2  NodePort     Replicas=2
echo    info\> contconn-04   namespace 2  NodePort     Replicas=2
echo    info\> contconn-05   namespace 1  Cluster      Replicas=2
echo    info\> contconn-06   namespace 1  Cluster      Replicas=2
echo    info\> contconn-07   namespace 2  Cluster      Replicas=2
echo    info\> contconn-08   namespace 2  Cluster      Replicas=2
echo    info\> contconn-09   namespace 1  LoadBalancer Replicas=2

kubectl apply -f contconn-namespace-01.yaml
kubectl apply -f contconn-namespace-02.yaml

kubectl apply -f contconn-01.yaml
kubectl apply -f contconn-02.yaml
kubectl apply -f contconn-03.yaml
kubectl apply -f contconn-04.yaml
kubectl apply -f contconn-05.yaml
kubectl apply -f contconn-06.yaml
kubectl apply -f contconn-07.yaml
kubectl apply -f contconn-08.yaml
kubectl apply -f contconn-09.yaml

#kubectl delete -f contconn-01.yaml
#kubectl delete -f contconn-02.yaml
#kubectl delete -f contconn-03.yaml
#kubectl delete -f contconn-04.yaml
#kubectl delete -f contconn-05.yaml
#kubectl delete -f contconn-06.yaml
#kubectl delete -f contconn-07.yaml
#kubectl delete -f contconn-08.yaml
#kubectl delete -f contconn-09.yaml

kubectl apply -f contconn-ingress-01.yaml
kubectl apply -f contconn-ingress-05.yaml

kubectl delete -f contconn-ingress-01.yaml
kubectl delete -f contconn-ingress-05.yaml


kubectl get namespace,nodes,deployments,svc,pods,replicationcontroller,PersistentVolumes --all-namespaces=true