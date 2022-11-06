#!/bin/bash

echo '
 apiVersion: networking.k8s.io/v1
 kind: Ingress
 metadata:
   name: demo
   annotations:
     konghq.com/strip-path: "true"
 spec:
   ingressClassName: kong
   rules:
   - http:
       paths:
       - path: /foo
         pathType: ImplementationSpecific
         backend:
           service:
             name: httpbin
             port:
               number: 80
       - path: /bar
         pathType: ImplementationSpecific
         backend:
           service:
             name: echo
             port:
               number: 80
 ' | kubectl apply -f -

