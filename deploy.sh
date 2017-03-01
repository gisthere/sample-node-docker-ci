#!/bin/bash
docker build -t gisthere/sample-node .
docker push gisthere/sample-node

ssh gisthere@104.199.32.244 << EOF
docker pull gisthere/sample-node:latest
docker stop web || true
docker rm web || true
docker rmi gisthere/sample-node:current || true
docker tag gisthere/sample-node:latest gisthere/sample-node:current
docker run -d --restart always --name web -p 80:80 gisthere/sample-node:current
EOF
