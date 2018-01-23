# installRHEL7.4OCP3.7


1. Register with the Subscription manager : # subscription-manager register --username=<user_name> --password=<password>

1. Pull the latest subscription data from RHSM:  # subscription-manager refresh
2. List the available subscriptions:  # subscription-manager list --available --matches '*OpenShift*'
3. In the output for the previous command, find the pool ID for an OpenShift Container Platform subscription and attach it:  # subscription-manager attach --pool=<pool_id>
4.     subscription-manager repos --disable="*"
   
    
5. Enable only the repositories required by OpenShift Container Platform 3.7:  # subscription-manager repos  --enable="rhel-7-server-rpms"    --enable="rhel-7-server-extras-rpms"     --enable="rhel-7-server-ose-3.7-rpms"  --enable="rhel-7-fast-datapath-rpms"
6. yum install atomic-openshift-utils
7. yum install wget git net-tools bind-utils iptables-services bridge-utils bash-completion kexec-tools sos psacct
8. Edit the inventory.ini file with your IP addresses and DOMAIN Name changes
9. edit /etc/hosts with the hostname (ie, master.172.16.15.210.nip.io), and set hostname <hostname> (ie, master.172.16.15.210.nip.io)
9. ansible-playbook -i installRHEL7.4OCP3.7/inventory.ini /usr/share/ansible/openshift-ansible/playbooks/byo/config.yml



