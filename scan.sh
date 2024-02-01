#!/bin/bash

echo $imageName

docker run --rm -v $WORKSPACE:/root/.cache/ aquasec/trivy:0.48.3 -q image --exit-code 0 --severity LOW,MEDIUM,HIGH --light $imageName
docker run --rm -v $WORKSPACE:/root/.cache/ aquasec/trivy:0.48.3 -q image --exit-code 1 --severity CRITICAL --light $imageName

exit_code=$?
echo "Exit Code : $exit_code"

if [[ "${exit_code}" == 1 ]]; then
    echo "Image scan failed - critical vulnerabilities found!"
    exit 1;
else
    echo "Image scan passed - no critical vulnerabilities found!"
fi;