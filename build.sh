#!/bin/bash
docker rmi ss:latest
docker build -t ss:latest .
