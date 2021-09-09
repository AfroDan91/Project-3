#!/bin/bash
kubectl apply -f $WORKSPACE/backend/backend.yaml
kubectl apply -f $WORKSPACE/frontend/configmap.yaml
kubectl apply -f $WORKSPACE/frontend/loadbalancer.yaml
kubectl apply -f $WORKSPACE/frontend/frontend.yaml
kubectl get services