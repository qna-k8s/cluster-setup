#!/bin/bash
var=$(helm status cluster-setup 2>&1)
errorMsg="Error: release: not found"
installCmd="helm install cluster-setup ./metrics_server"
updateCmd="helm upgrade cluster-setup ./metrics_server"
if [ "$var" = "$errorMsg" ]
then
    eval $installCmd
else
    eval $updateCmd
fi