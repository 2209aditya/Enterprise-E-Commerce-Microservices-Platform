#!/bin/bash
set -e
echo "Setting up AKS..."
az aks get-credentials --resource-group ecommerce-prod-rg --name ecommerce-aks
kubectl get nodes
echo "AKS setup complete!"
