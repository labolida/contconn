#!/bin/bash


echo "reporting services">report.txt
kubectl describe service/contconn-service-01 -n=contconn-namespace-01 >>report.txt
echo "-----------------------" >>report.txt
kubectl describe service/contconn-service-02 -n=contconn-namespace-01 >>report.txt
echo "-----------------------" >>report.txt
kubectl describe service/contconn-service-03 -n=contconn-namespace-02 >>report.txt
echo "-----------------------" >>report.txt
kubectl describe service/contconn-service-04 -n=contconn-namespace-02 >>report.txt
echo "-----------------------" >>report.txt
kubectl describe service/contconn-service-05 -n=contconn-namespace-01 >>report.txt
echo "-----------------------" >>report.txt
kubectl describe service/contconn-service-06 -n=contconn-namespace-01 >>report.txt
echo "-----------------------" >>report.txt
kubectl describe service/contconn-service-07 -n=contconn-namespace-02 >>report.txt
echo "-----------------------" >>report.txt
kubectl describe service/contconn-service-08 -n=contconn-namespace-02 >>report.txt

echo "-----------------------" >>report.txt
echo "-----------------------" >>report.txt

minikube service contconn-service-01 --namespace=contconn-namespace-01 --url  >>report.txt
minikube service contconn-service-02 --namespace=contconn-namespace-01 --url  >>report.txt
minikube service contconn-service-03 --namespace=contconn-namespace-02 --url  >>report.txt
minikube service contconn-service-04 --namespace=contconn-namespace-02 --url  >>report.txt
minikube service contconn-service-05 --namespace=contconn-namespace-01 --url  >>report.txt
minikube service contconn-service-06 --namespace=contconn-namespace-01 --url  >>report.txt
minikube service contconn-service-07 --namespace=contconn-namespace-02 --url  >>report.txt
minikube service contconn-service-08 --namespace=contconn-namespace-02 --url  >>report.txt



cat report.txt


grep -i ip report.txt


# contconn-namespace-01   service/contconn-service-01         NodePort    10.109.246.245   <none>        8321:31801/TCP           9m34s
# contconn-namespace-01   service/contconn-service-02         NodePort    10.107.94.96     <none>        8321:30836/TCP           4m2s
# contconn-namespace-01   service/contconn-service-05         ClusterIP   10.107.222.64    <none>        8321/TCP                 4m2s
# contconn-namespace-01   service/contconn-service-06         ClusterIP   10.104.14.28     <none>        8321/TCP                 4m1s
##
# contconn-namespace-02   service/contconn-service-03         NodePort    10.97.182.195    <none>        8321:30155/TCP           4m2s
# contconn-namespace-02   service/contconn-service-04         NodePort    10.105.134.201   <none>        8321:30958/TCP           4m2s
# contconn-namespace-02   service/contconn-service-07         ClusterIP   10.101.150.81    <none>        8321/TCP                 4m1s
# contconn-namespace-02   service/contconn-service-08         ClusterIP   10.105.106.5     <none>        8321/TCP                 4m1s
