# proxy setting
cat >> /etc/profile << EOF
export HTTP_PROXY=http://proxy.rdh.ecl.ntt.co.jp:20066/
export HTTPS_PROXY=http://proxy.rdh.ecl.ntt.co.jp:20066/
export NO_PROXY=127.0.0.1,localhost,master,node1,node2,10.0.2.11,10.0.2.12,10.0.2.13,10.0.0.0/8
export http_proxy=http://proxy.rdh.ecl.ntt.co.jp:20066/
export https_proxy=http://proxy.rdh.ecl.ntt.co.jp:20066/
export no_proxy=127.0.0.1,localhost,master,node1,node2,10.0.2.11,10.0.2.12,10.0.2.13,10.0.0.0/8
EOF

source /etc/profile

# install ansible
yum install epel-release -y
yum update -y
yum install ansible -y

# clone ansible project
git clone https://github.com/cyron/cri-o-ansible
cd cri-o-ansible
git checkout fixes_k8s_1_16

# make ansible executable locally
echo localhost >> /etc/ansible/hosts
ansible-playbook cri-o.yml
