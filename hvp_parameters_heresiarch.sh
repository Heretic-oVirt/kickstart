# Preconfigured defaults for deployment support server installation
# Note: the following are all the modifiable parameters for reference only (values are equal to hardcoded defaults)

nicmacfix="false"

nolocalvirt="false"

default_nodeosdisk="smallest"

default_node_count="3"

node_name[0]="pinkiepie"
node_name[1]="applejack"
node_name[2]="rarity"
node_name[3]="fluttershy"

switch_name="scootaloo"

engine_name="celestia"

storage_name="discord"

datacenter_name="HVPDataCenter"

cluster_name="HVPCluster"

my_ip_offset="1"

bmc_ip_offset="100"

# Note: uncomment the following to signify that you have reviewed and confirmed the BMC settings further below as valid
#bmc_confirmed="true"

bmc_type="ipmilan"
bmc_username="hvpbmcadmin"
bmc_password="HVP_dem0"

node_ip_offset="10"

# Note: for the following values, either the IP or the offset is enough, but we will list here both as an example
switch_ip_offset="200"
engine_ip_offset="5"
switch_ip="172.20.10.200"
engine_ip="172.20.10.5"

storage_ip_offset="30"

master_index="0"

dhcp_offset="50"
dhcp_count="20"

# Note: network_base values are derived automatically anyway
network['external']="dhcp"
netmask['external']="dhcp"
bondmode['external']="N/A"
mtu['external']="dhcp"
network['mgmt']="172.20.10.0"
netmask['mgmt']="255.255.255.0"
bondmode['mgmt']="activepassive"
mtu['mgmt']="1500"
network['gluster']="172.20.11.0"
netmask['gluster']="255.255.255.0"
bondmode['gluster']="activepassive"
mtu['gluster']="1500"
network['lan']="172.20.12.0"
netmask['lan']="255.255.255.0"
bondmode['lan']="activepassive"
mtu['lan']="1500"
network['internal']="172.20.13.0"
netmask['internal']="255.255.255.0"
bondmode['internal']="activepassive"
mtu['internal']="1500"

# Note: reverse_domain_name values are derived automatically anyway
domain_name['external']="external.private"
domain_name['mgmt']="mgmt.private"
domain_name['gluster']="gluster.private"
domain_name['lan']="lan.private"
domain_name['internal']="internal.private"

ad_subdomain_prefix="ad"

ad_dc_ip_offset="220"

ad_dc_name="spike"

db_ip_offset="230"

db_name="bigmcintosh"

dbtype="postgresql"

pr_ip_offset="250"

pr_name="rainbowdash"

vd_ip_offset="240"

vd_name="grannysmith"

detype="gnome"

my_nameserver="dhcp"

my_forwarders="8.8.8.8"

my_gateway="dhcp"

my_name="twilight"

root_password="hvpdemo"
admin_username="hvpadmin"
admin_password="hvpdemo"
keyboard_layout="us"
local_timezone="UTC"
