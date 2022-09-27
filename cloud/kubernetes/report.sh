#!/bin/bash


echo "reporting services">report.txt
kubectl describe service/contconn-service-01 -n=contconn-namespace-01 >>report.txt
echo "--------------------------------------------------------------" >>report.txt
kubectl describe service/contconn-service-02 -n=contconn-namespace-01 >>report.txt
echo "--------------------------------------------------------------" >>report.txt
kubectl describe service/contconn-service-03 -n=contconn-namespace-02 >>report.txt
echo "--------------------------------------------------------------" >>report.txt
kubectl describe service/contconn-service-04 -n=contconn-namespace-02 >>report.txt
echo "--------------------------------------------------------------" >>report.txt
kubectl describe service/contconn-service-05 -n=contconn-namespace-01 >>report.txt
echo "--------------------------------------------------------------" >>report.txt
kubectl describe service/contconn-service-06 -n=contconn-namespace-01 >>report.txt
echo "--------------------------------------------------------------" >>report.txt
kubectl describe service/contconn-service-07 -n=contconn-namespace-02 >>report.txt
echo "--------------------------------------------------------------" >>report.txt
kubectl describe service/contconn-service-08 -n=contconn-namespace-02 >>report.txt
echo "--------------------------------------------------------------" >>report.txt
kubectl describe service/contconn-service-09 -n=contconn-namespace-01 >>report.txt

echo "--------------------------------------------------------------------" >>report.txt
minikube service contconn-service-01 --namespace=contconn-namespace-01 --url  >>report.txt
minikube service contconn-service-02 --namespace=contconn-namespace-01 --url  >>report.txt
minikube service contconn-service-03 --namespace=contconn-namespace-02 --url  >>report.txt
minikube service contconn-service-04 --namespace=contconn-namespace-02 --url  >>report.txt
minikube service contconn-service-05 --namespace=contconn-namespace-01 --url  >>report.txt
minikube service contconn-service-06 --namespace=contconn-namespace-01 --url  >>report.txt
minikube service contconn-service-07 --namespace=contconn-namespace-02 --url  >>report.txt
minikube service contconn-service-08 --namespace=contconn-namespace-02 --url  >>report.txt

echo "--------------------------------------------------------------------" >>report.txt
kubectl describe Deployment contconn-deployment-01 -n=contconn-namespace-01 >>report.txt
echo "--------------------------------------------------------------------" >>report.txt
kubectl describe Deployment contconn-deployment-02 -n=contconn-namespace-01 >>report.txt
echo "--------------------------------------------------------------------" >>report.txt
kubectl describe Deployment contconn-deployment-03 -n=contconn-namespace-02 >>report.txt
echo "--------------------------------------------------------------------" >>report.txt
kubectl describe Deployment contconn-deployment-04 -n=contconn-namespace-02 >>report.txt
echo "--------------------------------------------------------------------" >>report.txt
kubectl describe Deployment contconn-deployment-05 -n=contconn-namespace-01 >>report.txt
echo "--------------------------------------------------------------------" >>report.txt
kubectl describe Deployment contconn-deployment-06 -n=contconn-namespace-01 >>report.txt
echo "--------------------------------------------------------------------" >>report.txt
kubectl describe Deployment contconn-deployment-07 -n=contconn-namespace-02 >>report.txt
echo "--------------------------------------------------------------------" >>report.txt
kubectl describe Deployment contconn-deployment-08 -n=contconn-namespace-02 >>report.txt
echo "--------------------------------------------------------------------" >>report.txt
kubectl describe Deployment contconn-deployment-09 -n=contconn-namespace-01 >>report.txt
echo "--------------------------------------------------------------------" >>report.txt




echo "--------------------------------------------------------------------" >>report.txt
kubectl describe Ingress contconn-ingress-01 -n=contconn-namespace-01 >>report.txt
echo "--------------------------------------------------------------------" >>report.txt
kubectl describe Ingress contconn-ingress-05 -n=contconn-namespace-01 >>report.txt


echo cat report.txt

grep -i ip report.txt
grep -i http report.txt

echo "--------------------------/etc/resolv.conf--------------------------" >>report.txt
cat /etc/resolv.conf                                                        >>report.txt
echo "--------------------------/etc/hosts--------------------------------" >>report.txt
cat /etc/hosts                                                              >>report.txt


echo "--------------------------------------------------------------------" >>report.txt
echo https://contconn.info/contconn1/setName?name=zzz01
echo "--------------------------------------------------------------------" >>report.txt

