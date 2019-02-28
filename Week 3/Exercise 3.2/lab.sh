yes | cp -rf "../Exercise 3.1/edx-provision.yaml" "../../../Templates/edx-provision.yaml"
cd ~/environment
git add *
git commit -m "new owner tag"
git push origin dev