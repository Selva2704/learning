#!/bin/bash
docker tag project:v1 selvadev27/dev
docker tag nginx-demo:latest selvadev27/dev
docker push selvadev27/dev
docker tag nginx-demo:latest selvadev27/prod
docker push selvadev27/prod
