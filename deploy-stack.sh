#!/bin/bash    
#Title           :check-s3-object-version.sh
#Aauthor         :rajith.v@iinerds.com
#Date            :12-04-2018
#Version         :0.1    
#Usage           :Package and deploy the cloudformation template and the lambda function to s3 bucket
#====================================================================================================

#Replace the occurence of LambdaName in the CodePipelineTemplate.yaml to the value of $LambdaName
sed -i -e 's/LambdaName/'"$LambdaName"'/g' CodePipelineTemplate.yaml

#UpperCase to LowerCase conversion 
bucketname=$(echo "$LambdaName" | tr '[:upper:]' '[:lower:]')
echo "bucketname:$bucketname"

#Customize bucket name
sed -i -e 's/Bucketname/'"$bucketname"'/g' CodePipelineTemplate.yaml

#Upload CodePipelineTemplate.yaml to S3bucket
aws s3 cp CodePipelineTemplate.yaml s3://aadhri-test-buck/

#Create Stack
aws cloudformation create-stack --stack-name $LambdaName-Pipeline-Stack --template-url https://s3.us-east-2.amazonaws.com/aadhri-test-buck/CodePipelineTemplate.yaml --capabilities CAPABILITY_IAM 

