RED="\e[31m"
RESET="\e[00m"

echo
echo -e $RED"Install NFS Packages"$RESET
echo
 yum install -y nfs-utils libnfsidmap

echo
echo -e $RED"2) NFS Service start and firewall setup"$RESET
echo
 systemctl enable rpcbind
 systemctl enable nfs-server
 systemctl enable nfs-lock
 systemctl enable nfs-idmap
 systemctl start rpcbind
 systemctl start nfs-server
 systemctl start nfs-lock
 systemctl start nfs-idmap
 
 
 firewall-cmd --permanent --zone=public --add-service=nfs
 firewall-cmd --permanent --zone=public --add-service=mountd
 firewall-cmd --permanent --zone=public --add-service=rpc-bind
 firewall-cmd --reload
 
 # /etc/exports
 # /home/educafe/share	<client ip addr>(rw,sync,no_root_squash,no_all_squash)
 # exportfs -r


