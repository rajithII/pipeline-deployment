#!/bin/bash
sed -i -e 's/LambdaName/'"$LambdaName"'/g' CodePipelineTemplate.yaml
aws s3 cp $Template_Name s3://$S3_bucket/


