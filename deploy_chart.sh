#!/bin/bash
var=$(helm status qna-csr 2>&1)
errorMsg="Error: release: not found"
installCmd="helm install qna-cluster-setup ./metrics_server"
updateCmd="helm upgrade qna-cluster-steup"
if [ "$var" = "$errorMsg" ]
then
    eval $installCmd
else
    eval $updateCmd
fi