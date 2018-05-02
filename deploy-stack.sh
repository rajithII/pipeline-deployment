#!/bin/bash
sed -i -e 's/LambdaName/'"$LambdaName"'/g' CodePipelineTemplate.yaml
aws s3 cp CodePipelineTemplate.yaml s3://aadhri-test-buck/
aws cloudformation create-stack --stack-name $LambdaName-Stack --template-url https://s3.us-east-2.amazonaws.com/aadhri-test-buck/CodePipelineTemplate.yaml --capabilities CAPABILITY_IAM 

