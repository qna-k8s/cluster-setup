#!/bin/bash
var=$(helm status monitor-stack 2>&1)
errorMsg="Error: release: not found"
installCmd="helm install monitor-stack ./kube-prometheus-stack \
            -f metric_config.yaml"
updateCmd="helm upgrade monitor-stack ./kube-prometheus-stack \
           -f metric_config.yaml"
if [ "$var" = "$errorMsg" ]
then
    eval $installCmd
else
    eval $updateCmd
fi