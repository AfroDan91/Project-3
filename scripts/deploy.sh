#!/bin/bash
kubectl apply -f $WORKSPACE/backend/backend.yaml
kubectl apply -f $WORKSPACE/frontend/frontend.yaml
