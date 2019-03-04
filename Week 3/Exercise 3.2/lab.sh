yes | cp -rf "../Exercise 3.1/edx-provision.yaml" "../../../Templates/edx-provision.yaml"
RANDOMCODE=$(date | md5sum)
sed -i "s/RANDOMCODE/$RANDOMCODE/g" "../../../Templates/edx-provision.yaml"
aws ssm put-parameter --name "TEST-DATABASE-MASTER-PASSWORD" --value 'Passw0rd' --type "SecureString"
cd ~/environment
git add *
git commit -m "new owner tag with $RANDOMCODE"
git push origin dev