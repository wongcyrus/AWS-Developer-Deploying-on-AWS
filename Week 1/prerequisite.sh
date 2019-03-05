#!/bin/bash
aws s3api create-bucket --bucket $SourceBucket
sleep 5
