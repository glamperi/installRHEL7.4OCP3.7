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
10.  ssh-keygen -t rsa and then copy the key using 'ssh-copy-id root@master.YOURIPADDR.xip.io' and then test it out - ssh root@master.YOURIPADDR.xip.io
11. ansible-playbook -i installRHEL7.4OCP3.7/inventory.ini /usr/share/ansible/openshift-ansible/playbooks/byo/config.yml
12. to Uninstall, run - ansible-playbook -i installrhel7.3/inventory.ini /usr/share/ansible/openshift-ansible/playbooks/adhoc/uninstall.yml, if changing the hostname, it is best to uninstall before, or else the ansible script will not be able to ssh in. You might have to do systemctl stop atomic-openshift-master or systemctl stop atomic-openshift-node.
Post Install step, you will need a user to login as to the terminal or web console: cd /etc/origin/master and run 'htpasswd -b /etc/origin/master/htpasswd developer developer', this creates the same user as the 'oc cluster' uses by default in the setup.
For OADM commands use: oc login -u system:admin --config=/etc/origin/master/admin.kubeconfig



Note changes for OCP 3.11 - need to install skopeo and need RH Registry user/pass per https://access.redhat.com/solutions/3661111
