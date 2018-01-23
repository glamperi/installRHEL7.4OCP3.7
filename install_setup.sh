#!/bin/bash
export USERNAME=developer
export PASSWORD=developer
export VERSION=v3.7
export IP="$(ip route get 8.8.8.8 | awk '{print $NF; exit}')"
export DOMAIN=${IP}.nip.io

echo "******"
echo "* Your domain is $DOMAIN "
echo "* Your username is $USERNAME "
echo "* Your password is $PASSWORD "
echo "* OpenShift version: $VERSION "
echo "******"

#systemctl restart docker
#systemctl enable docker

export memory=$(cat /proc/meminfo | grep MemTotal | sed "s/MemTotal:[ ]*\([0-9]*\) kB/\1/")



export METRICS="false"
export LOGGING="false"

echo "***********"
echo "* Your memory is $memory "
echo " Start running ANSIBLE playbook..."
echo "***********"



ansible-playbook -i inventory.ini ../openshift-ansible/playbooks/byo/config.yml -e "IP=172.16.15.213"




htpasswd -b /etc/origin/master/htpasswd ${USERNAME} ${PASSWORD}
oc adm policy add-cluster-role-to-user cluster-admin ${USERNAME}

systemctl restart origin-master-api

echo "******"
echo "* Your console is https://master.$DOMAIN:8443"
echo "* Your username is $USERNAME "
echo "* Your password is $PASSWORD "
echo "******"


#oc login -u ${USERNAME} -p ${PASSWORD} https://master.$DOMAIN:8443/
