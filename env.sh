# ssh
ssh-keygen
ssh-copy-id 10.0.2.11

# Git proxy setting
git config --global http.proxy http://proxy.rdh.ecl.ntt.co.jp:20066
git config --global https.proxy http://proxy.rdh.ecl.ntt.co.jp:20066

yum install epel-release -y
yum update -y
yum install ansible -y

git clone https://github.com/cyron/cri-o-ansible
cd cri-o-ansible
git checkout fixes_k8s_1_16
ansible-playbook cri-o.yml -i 10.0.2.11,
