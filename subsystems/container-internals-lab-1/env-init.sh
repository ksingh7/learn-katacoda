# General Preparation
ssh root@host01 'git clone --depth 1 https://github.com/fatherlinux/container-internals-lab.git ~/labs'

# Lab 1
ssh root@host01 'cp ~/labs/lab1-step3/mega-proc.sh /usr/bin/mega-proc.sh'

# Lab 2
ssh root@host01 'git clone --depth 1 --single-branch --branch centos7 https://github.com/fatherlinux/container-supply-chain.git ~/labs/lab2-step4/'

# Lab 3
ssh root@host01 'ln -s ~/intro-katacoda/subsystems/container-internals-lab-3/assets ~/assets'
ssh root@host01 'cp ~/labs/lab3-step1/atomic-openshift-master.service /etc/systemd/system/atomic-openshift-master.service'
ssh root@host01 'cp ~/labs/lab3-step1/atomic-openshift-node.service /etc/systemd/system/atomic-openshift-node.service'
ssh root@host01 'systemctl disable --now origin.service'
ssh root@host01 'systemctl enable --now atomic-openshift-master.service; systemctl enable --now atomic-openshift-node.service'
ssh root@host01 'yum install -y strace'

# Lab 4
ssh root@host01 'ln -s ~/intro-katacoda/subsystems/container-internals-lab-4/assets ~/assets'
ssh root@host01 'git clone --depth 1 --single-branch --branch lab04-exercise01 https://github.com/fatherlinux/wordpress-demo.git ~/labs/lab4-step1b'
ssh root@host01 '~/labs/lab4-step1b/create-pv.sh'
ssh root@host01 'sed -i s/wpfrontend-wordpress.apps.example.com/`hostname`/ ~/labs/lab4-step1b/wordpress-objects.yaml'
ssh root@host01 'yum install -y links httpd-tools'

# Final Preparation
ssh root@host01 'docker pull rhel7'
ssh root@host01 'docker pull rhel7-atomic'
ssh root@host01 'docker pull nate/dockviz'
ssh root@host01 'docker pull nate/centos'
ssh root@host01 '/var/lib/openshift/openshift admin policy add-cluster-role-to-user cluster-admin admin'
