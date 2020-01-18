# Preconfigured defaults for node installation
# Note: the following are all the modifiable parameters for reference only (values are equal to hardcoded defaults)

nicmacfix="false"

orthodox_mode="false"
ovirt_nightly_mode="false"
use_vdo="false"

default_nodeosdisk="last-smallest"

default_node_count="3"

default_node_index="0"

node_name[0]="pinkiepie"
node_name[1]="applejack"
node_name[2]="rarity"
node_name[3]="fluttershy"

switch_name="scootaloo"

engine_name="celestia"

metrics_name="luna"

storage_name="discord"

gluster_vol_name['engine']="engine"
gluster_vol_name['vmstore']="vmstore"
gluster_vol_name['iso']="iso"
gluster_vol_name['ctdb']="ctdb"
gluster_vol_name['unixshare']="unixshare"
gluster_vol_name['winshare']="winshare"
gluster_vol_name['blockshare']="blockshare"
gluster_vol_name['backup']="backup"
gluster_vol_name['sharedstorage']="gluster_shared_storage"

# Note: for the following values, either the IPs or the offset is enough, but we will list here both as an example
test_ip_offset="1"
test_ip['mgmt']="172.20.10.1"
test_ip['gluster']="172.20.11.1"
test_ip['lan']="172.20.12.1"
test_ip['internal']="172.20.13.1"

# Note: for the following values, either the IP or the offset is enough, but we will list here both as an example
switch_ip_offset="200"
engine_ip_offset="5"
metrics_ip_offset="6"
switch_ip="172.20.10.200"
engine_ip="172.20.10.5"
metrics_ip="172.20.10.6"

bmc_ip_offset="100"

node_ip_offset="10"

storage_ip_offset="30"

master_index="0"

# Note: network_base values are derived automatically anyway
network['mgmt']="172.20.10.0"
netmask['mgmt']="255.255.255.0"
bondopts['mgmt']="mode=active-backup;miimon=100"
mtu['mgmt']="1500"
network['gluster']="172.20.11.0"
netmask['gluster']="255.255.255.0"
bondopts['gluster']="mode=active-backup;miimon=100"
mtu['gluster']="1500"
network['lan']="172.20.12.0"
netmask['lan']="255.255.255.0"
bondopts['lan']="mode=active-backup;miimon=100"
mtu['lan']="1500"
network['internal']="172.20.13.0"
netmask['internal']="255.255.255.0"
bondopts['internal']="mode=active-backup;miimon=100"
mtu['internal']="1500"

# Note: reverse_domain_name values are derived automatically anyway
domain_name['mgmt']="mgmt.private"
domain_name['gluster']="gluster.private"
domain_name['lan']="lan.private"
domain_name['internal']="internal.private"

bridge_name['mgmt']="ovirtmgmt"
bridge_name['lan']="lan"
bridge_name['internal']="internal"

ad_subdomain_prefix="ad"

ad_dc_ip_offset="220"

my_nameserver="8.8.8.8"

my_forwarders="8.8.8.8"

my_ntpservers="0.centos.pool.ntp.org,1.centos.pool.ntp.org,2.centos.pool.ntp.org,3.centos.pool.ntp.org"

my_smtpservers=""

use_smtps="false"

root_password="HVP_dem0"
admin_username="hvpadmin"
admin_password="hvpdemo"
keyboard_layout="us"
local_timezone="UTC"

notification_receiver="monitoring@localhost"

yum_sleep_time="10"
yum_retries="10"

# Note: default base and GPG-key values for repos are those inside .repo files - reported here as an example
#hvp_repo_baseurl['base']='http://centos.mirror.garr.it/centos/$releasever/os/$basearch/'
#hvp_repo_baseurl['updates']='http://centos.mirror.garr.it/centos/$releasever/updates/$basearch/'
#hvp_repo_baseurl['extras']='http://centos.mirror.garr.it/centos/$releasever/extras/$basearch/'
#hvp_repo_baseurl["ovirt-${ovirt_version}-epel"]='http://www.nic.funet.fi/pub/mirrors/fedora.redhat.com/pub/epel/$releasever/$basearch/'
#hvp_repo_gpgkey["ovirt-${ovirt_version}-epel"]='http://www.nic.funet.fi/pub/mirrors/fedora.redhat.com/pub/epel/RPM-GPG-KEY-EPEL-$releasever'
#hvp_repo_baseurl["ovirt-${ovirt_version}-centos-qemu-ev"]='http://centos.mirror.garr.it/centos/$releasever/virt/$basearch/kvm-common/'
#hvp_repo_baseurl["ovirt-${ovirt_version}-centos-opstools"]='http://centos.mirror.garr.it/centos/$releasever/opstools/$basearch/'
#hvp_repo_baseurl['centos-sclo-rh-release']='http://centos.mirror.garr.it/centos/$releasever/sclo/$basearch/rh/'
#hvp_repo_baseurl["ovirt-${ovirt_version}-centos-ovirt$(echo ${ovirt_version} | sed -e 's/[.]//g')"]="http://centos.mirror.garr.it/centos/\$releasever/virt/\$basearch/ovirt-${ovirt_version}/"
