yes | cp -rf "../Exercise 3.1/edx-provision.yaml" "../../../Templates/edx-provision.yaml"
RANDOMCODE=$(date | md5sum)
sed -i "s/RANDOMCODE/$RANDOMCODE/g" "../../../Templates/edx-provision.yaml"
cd ~/environment
git add *
git commit -m "new owner tag with $RANDOMCODE"
git push origin dev