#!/bin/bash
var=$(helm status monitor-stack 2>&1)
errorMsg="Error: release: not found"
installCmd="helm install monitor-stack ./kube-prometheus-stack \
            --set grafana.service.type=NodePort,grafana.service.nodePort=30020"
updateCmd="helm upgrade monitor-stack ./kube-prometheus-stack \
           --set grafana.service.type=NodePort,grafana.service.nodePort=30020"
if [ "$var" = "$errorMsg" ]
then
    eval $installCmd
else
    eval $updateCmd
fi