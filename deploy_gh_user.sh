#!/bin/bash
status=$(helm status gh-actions-release 2>&1)
errorMsg="Error: release: not found"
installCmd="helm install gh-actions-release ./ghactions_role"
updateCmd="helm upgrade gh-actions-release"
if [ "$status" = "$errorMsg" ]
then
    eval $installCmd
else
    eval $updateCmd
fi