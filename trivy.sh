wget https://github.com/aquasecurity/trivy/releases/download/v0.73.0/trivy_0.73.0_Linux-32bit.tar.gz
tar -zxvf trivy_0.73.0_Linux-32bit.tar.gz
mv trivy /usr/local/bin/
vim .bashrc
export PATH=$PATH:/usr/local/bin/
source .bashrc





