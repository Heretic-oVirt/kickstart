# Kickstart file for Heretic oVirt Project initial installation physical/virtual host
# Note: minimum amount of RAM successfully tested for installation: 2048 MiB from network - 1024 MiB from local media

# Install with commandline (see below for comments):
# TODO: check each and every custom "hvp_" parameter below for overlap with default dracut/anaconda parameters and convert to using those instead
# elevator=deadline inst.ks=https://dangerous.ovirt.life/hvp-repos/el7/ks/heresiarch.ks
# Note: DHCP is assumed to be available on one and only one network (the external one, which will be autodetected, albeit with a noticeable delay) otherwise the ip=nicname:dhcp option must be added, where nicname is the name of the network interface to be used for installation (eg: ens32)
# Note: to force custom/fixed nic names add ifname=netN:AA:BB:CC:DD:EE:FF where netN is the desired nic name and AA:BB:CC:DD:EE:FF is the MAC address of the corresponding network interface
# Note: alternatively, to force legacy nic names (ethN), add biosdevname=0 net.ifnames=0
# Note: alternatively burn this kickstart into your DVD image and append to default commandline:
# elevator=deadline inst.ks=cdrom:/dev/cdrom:/ks/ks.cfg
# Note: to access the running installation by SSH (beware of publishing the access informations specified with the sshpw directive below) add the option inst.sshd
# Note: to skip installing/configuring local virtualization support irrespective of hardware capabilities add hvp_novirt
# Note: to skip installing custom versions of Gluster-related/OVN packages add hvp_orthodox
# Note: to influence selection of the target disk for node OS installation add hvp_nodeosdisk=AAA where AAA is either the device name (sda, sdb ecc) or a qualifier like first, last, smallest, last-smallest
# Note: to force static nic name-to-MAC mapping add the option hvp_nicmacfix
# Note: to force custom host naming add hvp_myname=myhostname where myhostname is the unqualified (ie without domain name part) hostname
# Note: to force custom addressing add hvp_{external,mgmt,gluster,lan,internal}=x.x.x.x/yy where x.x.x.x may either be the machine IP or the network address on the given network and yy is the prefix on the given network
# Note: to force custom IPs add hvp_{external,mgmt,gluster,lan,internal}_my_ip=t.t.t.t where t.t.t.t is the chosen IP on the given network
# Note: to force custom node bonding mode add hvp_{mgmt,gluster,lan,internal}_bondmode=vvvv where vvvv is the bonding mode, either activepassive, roundrobin (only for gluster) or lacp
# Note: to force custom network MTU add hvp_{external,mgmt,gluster,lan,internal}_mtu=zzzz where zzzz is the MTU value
# Note: to force custom switch IP add hvp_switch=p.p.p.p where p.p.p.p is the switch IP
# Note: to force custom network domain naming add hvp_{external,mgmt,gluster,lan,internal}_domainname=mynet.name where mynet.name is the domain name
# Note: to force custom network bridge naming add hvp_{mgmt,gluster,lan,internal}_bridge=bridgename where bridgename is the bridge name
# Note: to force custom AD subdomain naming add hvp_ad_subdomainname=myprefix where myprefix is the subdomain name
# Note: to force custom NetBIOS domain naming add hvp_netbiosdomain=MYDOM where MYDOM is the NetBIOS domain name
# Note: to force custom sysvol replication password add hvp_sysvolpassword=mysysvolsecret where mysysvolsecret is the sysvol replication password
# Note: to force custom AD DC IP add hvp_ad_dc=u.u.u.u where u.u.u.u is the AD DC IP on the AD network
# Note: to force custom AD DC naming add hvp_dcname=mydcname where mydcname is the unqualified (ie without domain name part) hostname of the AD DC
# Note: to force custom database type add hvp_dbtype=dddd where dddd is the database type (either postgresql, mysql, firebird, mongodb or sqlserver)
# Note: to force custom database version add hvp_dbversion=a.b where a.b is the database version number
# Note: to force custom desktop type add hvp_detype=eeee where eeee is the desktop type (either gnome, kde, xfce or lxde)
# Note: to force custom DB server IP add hvp_db=u.u.u.u where u.u.u.u is the DB server IP on the AD network
# Note: to force custom DB server naming add hvp_dbname=mydbname where mydbname is the unqualified (ie without domain name part) hostname of the DB server
# Note: to force custom print server IP add hvp_pr=u.u.u.u where u.u.u.u is the print server IP on the AD network
# Note: to force custom print server naming add hvp_prname=myprname where myprname is the unqualified (ie without domain name part) hostname of the print server
# Note: to force custom virtual desktop IP add hvp_vd=e.e.e.e where e.e.e.e is the virtual desktop IP on the AD network
# Note: to force custom print server naming add hvp_vdname=myvdname where myvdname is the unqualified (ie without domain name part) hostname of the virtual desktop
# Note: to force custom nameserver IP add hvp_nameserver=w.w.w.w where w.w.w.w is the nameserver IP
# Note: to force custom forwarders IPs add hvp_forwarders=forw0,forw1,forw2 where forwN are the forwarders IPs
# Note: to force custom gateway IP add hvp_gateway=n.n.n.n where n.n.n.n is the gateway IP
# Note: to force custom offset for DHCP-offered IPs add hvp_dhcp_offset=m where m is the offset
# Note: to force custom range for DHCP-offered IPs add hvp_dhcp_range=p where p is the range
# Note: to force custom node count add hvp_nodecount=N where N is the number of nodes in the cluster
# Note: to force custom master node identity add hvp_masternodeid=Y where Y is the master node index
# Note: to force custom node naming add hvp_nodename=nodename0,nodename1,nodename2,nodename3 where nodenameN are the unqualified (ie without domain name part) hostnames
# Note: to force custom switch naming add hvp_switchname=myswitchname where myswitchname is the unqualified (ie without domain name part) hostname of the switch management interface
# Note: to force custom engine naming add hvp_enginename=myenginename where myenginename is the unqualified (ie without domain name part) hostname of the Engine
# Note: to force custom storage naming add hvp_storagename=mystoragename where mystoragename is the unqualified (ie without domain name part) hostname of the storage
# Note: to force custom datacenter naming add hvp_dcname=mydcname where mydcname is the name of the oVirt DataCenter
# Note: to force custom cluster naming add hvp_clname=myclname where myclname is the name of the oVirt Cluster
# Note: to force custom node BMC IP offsets add hvp_bmcs_offset=M where M is the offset
# Note: to force custom node BMC type add hvp_bmcs_type=bmctype where bmctype is the BMC type
# Note: to force custom node BMC username add hvp_bmcs_username=bmcadmin where bmcadmin is the BMC username
# Note: to force custom node BMC password add hvp_bmcs_password=bmcsecret where bmcsecret is the BMC username password
# Note: to force custom node IP offsets add hvp_nodes_offset=L where L is the offset
# Note: to force custom engine IP add hvp_engine=m.m.m.m where m.m.m.m is the engine IP on the mgmt network
# Note: to force custom storage IPs add hvp_storage_offset=o where o is the storage IPs base offset on mgmt/lan/internal networks
# Note: to force custom root password add hvp_rootpwd=mysecret where mysecret is the root user password
# Note: to force custom admin username add hvp_adminname=myadmin where myadmin is the admin username
# Note: to force custom admin password add hvp_adminpwd=myothersecret where myothersecret is the admin user password
# Note: to force custom AD further admin username add hvp_winadminname=mywinadmin where mywinadmin is the further AD admin username
# Note: to force custom AD further admin password add hvp_winadminpwd=mywinothersecret where mywinothersecret is the further AD admin user password
# Note: to force custom keyboard layout add hvp_kblayout=cc where cc is the country code
# Note: to force custom local timezone add hvp_timezone=VV where VV is the timezone specification
# Note: to force custom oVirt version add hvp_ovirt_version=OO where OO is the version (either 4.1, 4.2 or master)
# Note: the default behaviour involves installing/configuring local virtualization support when virtualization hardware capabilities are detected
# Note: the default behaviour involves installing custom versions of Gluster-related/OVN packages
# Note: the default node OS disk is the first of the smallests
# Note: the default behaviour does not register fixed nic name-to-MAC mapping
# Note: the default host naming uses the "My Little Pony" character name twilight
# Note: the default addressing on connected networks is assumed to be 172.20.{10,11,12,13}.1/24 on {mgmt,gluster,lan,internal} and DHCP-provided on external
# Note: the default node bonding mode is assumed to be activepassive on {mgmt,lan,gluster,internal}
# Note: the default MTU is assumed to be 1500 on {external,mgmt,lan,gluster,internal}
# Note: the default switch IP is assumed to be the 200th IP available (network address + 200) on the mgmt network
# Note: the default machine IPs are assumed to be the first IPs available (network address + 1) on each connected network
# Note: the default domain names are assumed to be {external,mgmt,gluster,lan,internal}.private
# Note: the default bridge names are assumed to be {ovirtmgmt,,lan,internal}
# Note: the default AD subdomain name is assumed to be ad
# Note: the default NetBIOS domain name is equal to the first part of the AD DNS subdomain name (on the lan network, or mgmt if there is only one network) in uppercase
# Note: the default sysvol replication password is HVP_dem0
# Note: the default AD DC IP on the AD network is assumed to be the AD network address plus 220
# Note: the default AD DC naming uses the "My Little Pony" character name spike for the AD DC
# Note: the default database type is postgresql
# Note: the default database version is 9.6 (postgresql), 5.7 (mysql), 2.5 (firebird), 3.6 (mongodb) and 2017.CU (sqlserver)
# Note: the default desktop type is gnome
# Note: the default DB server IP on the AD network is assumed to be the AD network address plus 230
# Note: the default DB server naming uses the "My Little Pony" character name bigmcintosh for the DB server
# Note: the default print server IP on the AD network is assumed to be the AD network address plus 250
# Note: the default print server naming uses the "My Little Pony" character name rainbowdash for the print server
# Note: the default virtual desktop IP on the AD network is assumed to be the AD network address plus 240
# Note: the default virtual desktop naming uses the "My Little Pony" character name grannysmith for the print server
# Note: the default nameserver is assumed to be the DHCP-provided nameserver IP address on the external network
# Note: the default forwarder IP is assumed to be 8.8.8.8
# Note: the default gateway is assumed to be the DHCP-provided router address on the external network
# Note: the default offset for DHCP-offered IPs is 50
# Note: the default range for DHCP-offered IPs is 20
# Note: the default node count is 3
# Note: the default master node id is assumed to be 0
# Note: the default node naming uses "My Little Pony" character names {pinkiepie,applejack,rarity,fluttershy} for node ids {0,1,2,3} and nodeN for further ones
# Note: the default switch naming uses the "My Little Pony" character name scootaloo for the switch
# Note: the default engine naming uses the "My Little Pony" character name celestia for the Engine
# Note: the default storage naming uses the "My Little Pony" character name discord for the storage service
# Note: the default datacenter naming uses the name HVPDataCenter for the oVirt DataCenter
# Note: the default cluster naming uses the name HVPCluster for the oVirt Cluster
# Note: the default nodes BMC IP offset is 100
# Note: the default nodes BMC type is ipmilan
# Note: the default nodes BMC username is hvpbmcadmin
# Note: the default nodes BMC password is HVP_dem0
# Note: the default nodes IP offset is 10
# Note: the default engine IP on the mgmt network is assumed to be the mgmt network address plus 5
# Note: the default storage IPs base offset on mgmt/lan/internal networks is assumed to be the network address plus 30
# Note: the default root user password is HVP_dem0
# Note: the default admin username is hvpadmin
# Note: the default admin user password is hvpdemo
# Note: the default AD further admin username is the same as the admin username with the string "ad" prefixed
# Note: the default AD further admin user password is HVP_dem0
# Note: the default keyboard layout is us
# Note: the default local timezone is UTC
# Note: the default oVirt version is 4.1
# Note: to work around a known kernel commandline length limitation, all hvp_* parameters above can be omitted and proper default values (overriding the hardcoded ones) can be placed in Bash-syntax variables-definition files placed alongside the kickstart file - the name of the files retrieved and sourced (in the exact order) is: hvp_parameters.sh hvp_parameters_heresiarch.sh hvp_parameters_hh:hh:hh:hh:hh:hh.sh (where hh:hh:hh:hh:hh:hh is the MAC address of the nic used to retrieve the kickstart file)

# Perform an installation (as opposed to an "upgrade")
install
# Avoid asking interactive confirmation for unsupported hardware
unsupported_hardware
# Uncomment the line below to receive debug messages on a syslog server
# logging --host=192.168.229.1 --level=info
# Use text mode (as opposed to "cmdline", "graphical" or "vnc")
text
# Uncomment the line below to automatically reboot at the end of installation
# (must be sure that system does not try to loop-install again and again)
# Note: this is needed for proper installation automation by means of virt-install
reboot

# Installation source configuration dynamically generated in pre section below
%include /tmp/full-installsource

# System localization configuration dynamically generated in pre section below
%include /tmp/full-localization

# Network interface configuration dynamically generated in pre section below
%include /tmp/full-network

# Control "First Boot" interactive tool execution
# TODO: the following seems to be started anyway even if disabled manually in post section below - see https://bugzilla.redhat.com/show_bug.cgi?id=1213114
firstboot --disable
# EULA is implicitly accepted
eula --agreed

# Do not configure X Windows (as opposed to an "xconfig" line)
#skipx
# Fail safe X Windows configuration
xconfig --defaultdesktop=GNOME --startxonboot
# Control automatically enabled/disabled services for OS-supplied packages
services --disabled="mdmonitor,multipathd,lm_sensors,iscsid,iscsiuio,fcoe,fcoe-target,lldpad,iptables,ip6tables,ksm,ksmtuned,tuned,libvirtd,libvirt-guests,qpidd,tog-pegasus,cups,portreserve,postfix,nfs,nfs-lock,rpcbind,rpc-idmapd,rpc-gssd,rpc-svcgssd,pcscd,avahi-daemon,network,bluetooth,gpm,vsftpd,vncserver,slapd,dnsmasq,ipmi,ipmievd,nscd,psacct,rdisc,rwhod,saslauthd,smb,nmb,snmptrapd,svnserve,winbind,oddjobd,autofs,wpa_supplicant,kdump,iprdump,iprinit,iprupdate,snmpd" --enabled="firewalld,NetworkManager,NetworkManager-wait-online,ntpdate,chronyd,named,dhcpd"

# Users configuration dynamically generated in pre section below
%include /tmp/full-users

# Firewall (firewalld) enabled
# Note: further configuration performed in post section below
firewall --enabled --ssh
# Configure authentication mode
authconfig --enableshadow --passalgo=sha512
# Leave SELinux on (default will be "targeted" mode)
selinux --enforcing
# Disable kdump
%addon com_redhat_kdump --disable
%end

# Disk configuration dynamically generated in pre section below
%include /tmp/full-disk

# Explicitly list provided repositories
# Note: no additional repos setup - further packages/updates installed manually in post section
#repo --name="CentOS"  --baseurl=cdrom:sr0 --cost=100
#repo --name="HVP-mirror" --baseurl=https://dangerous.ovirt.life/hvp-repos/el7/centos

# Packages list - package groups are preceded by an "@" sign - excluded packages by an "-" sign
# Note: some virtualization technologies (Parallels, VirtualBox) require gcc, kernel-devel and dkms (from external repo) packages
%packages
@system-admin-tools
@console-internet
@core
@base
@large-systems
@performance
@network-file-system-client
@gnome-desktop
@x11
@development
xorg-x11-server-Xorg
xorg-x11-drivers
-gnome-boxes
-perl-homedir
# Note: the following is needed since ifconfig/route is still required by some software
net-tools
policycoreutils-python
policycoreutils-newrole
mcstrans
stunnel
-xinetd
-ntp
# Note: the following seems to be missing by default and we explicitly include it to allow efficient updates
deltarpm
rdate
kernel-devel
rpmdevtools
rpmlint
nasm
symlinks
dos2unix
unix2dos
screen
minicom
telnet
tree
audit
iptraf
iptstate
device-mapper-multipath
lm_sensors
OpenIPMI
ipmitool
memtest86+
hdparm
sdparm
lsscsi
xfsprogs
xfsdump
firefox
nss-tools
patch
expect
ksh
ncompress
libnl
redhat-lsb
vim-X11
tigervnc
tigervnc-server
xterm
-zsh
-nmap
-xdelta
-bluez
-bluez-libs
-fetchmail
-mutt
-pam_pkcs11
-coolkey
-finger
-conman
%end

# Pre-installation script (run with bash from stage2.img immediately after parsing this kickstart file)
%pre
( # Run the entire pre section as a subshell for logging.

# Discover exact pre-stage environment
echo "PRE env" >> /tmp/pre.out
env >> /tmp/pre.out
echo "PRE devs" >> /tmp/pre.out
ls -l /dev/* >> /tmp/pre.out
echo "PRE block" >> /tmp/pre.out
ls -l /sys/block/* >> /tmp/pre.out
echo "PRE mounts" >> /tmp/pre.out
df -h >> /tmp/pre.out
echo "PRE progs" >> /tmp/pre.out
for pathdir in $(echo "${PATH}" | sed -e 's/:/ /'); do
	if [ -d "${pathdir}" ]; then
		ls "${pathdir}"/* >> /tmp/pre.out
	fi
done

# A simple regex matching IP addresses
IPregex='[0-9]*[.][0-9]*[.][0-9]*[.][0-9]*'

# A general IP add/subtract function to allow classless subnets +/- offsets
# Note: derived from https://stackoverflow.com/questions/33056385/increment-ip-address-in-a-shell-script
# TODO: add support for IPv6
ipmat() {
	local given_ip=$1
	local given_diff=$2
	local given_op=$3
	# TODO: perform better checking on parameters
	if [ -z "${given_ip}" -o -z "${given_diff}" -o -z "${given_op}" ]; then
		echo ""
		return 255
	fi
	local given_ip_hex=$(printf '%.2X%.2X%.2X%.2X' $(echo "${given_ip}" | sed -e 's/\./ /g'))
	local given_diff_hex=$(printf '%.8X' "${given_diff}")
	local result_ip_hex=$(printf '%.8X' $(echo $(( 0x${given_ip_hex} ${given_op} 0x${given_diff_hex} ))))
	local result_ip=$(printf '%d.%d.%d.%d' $(echo "${result_ip_hex}" | sed -r 's/(..)/0x\1 /g'))
	echo "${result_ip}"
	return 0
}

# A general IP distance function to derive offsets from classless IP addresses
# Note: derived from https://stackoverflow.com/questions/33056385/increment-ip-address-in-a-shell-script
# TODO: add support for IPv6
ipdiff() {
        local given_ip1=$1
        local given_ip2=$2
        # TODO: perform better checking on parameters
        if [ -z "${given_ip1}" -o -z "${given_ip2}" ]; then
                echo ""
                return 255
        fi
        local given_ip1_hex=$(printf '%.2X%.2X%.2X%.2X' $(echo "${given_ip1}" | sed -e 's/\./ /g'))
        local given_ip2_hex=$(printf '%.2X%.2X%.2X%.2X' $(echo "${given_ip2}" | sed -e 's/\./ /g'))
        local result=$(echo $(( 0x${given_ip1_hex} - 0x${given_ip2_hex} )) | sed -e 's/^-//')
        echo "${result}"
        return 0
}

# Define all cluster default network data
# Note: engine-related data will only be used for automatic DNS zones configuration
unset nicmacfix
unset nolocalvirt
unset orthodox_mode
unset network_priority
unset node_count
unset network
unset netmask
unset network_base
unset bondmode
unset bondopts
unset mtu
unset domain_name
unset ad_subdomain_prefix
unset netbios_domain_name
unset sysvolrepl_password
unset ad_dc_ip
unset ad_dc_ip_offset
unset ad_dc_name
unset db_ip
unset db_ip_offset
unset db_name
unset dbtype
unset dbversion
unset detype
unset pr_ip
unset pr_ip_offset
unset pr_name
unset vd_ip
unset vd_ip_offset
unset vd_name
unset reverse_domain_name
unset bridge_name
unset node_name
unset bmc_ip_offset
unset bmc_confirmed
unset bmc_type
unset bmc_username
unset bmc_password
unset node_ip_offset
unset switch_ip
unset switch_ip_offset
unset switch_name
unset engine_name
unset storage_name
unset datacenter_name
unset cluster_name
unset engine_ip
unset engine_ip_offset
unset storage_ip_offset
unset my_ip_offset
unset my_name
unset my_nameserver
unset my_forwarders
unset my_gateway
unset root_password
unset admin_username
unset admin_password
unset winadmin_username
unset winadmin_password
unset keyboard_layout
unset local_timezone
unset ovirt_version

# Hardcoded defaults

nicmacfix="false"

nolocalvirt="false"

orthodox_mode="false"

default_nodeosdisk="smallest"

default_node_count="3"

declare -A node_name
node_name[0]="pinkiepie"
node_name[1]="applejack"
node_name[2]="rarity"
node_name[3]="fluttershy"

switch_name="scootaloo"

engine_name="celestia"

storage_name="discord"

datacenter_name="HVPDataCenter"

cluster_name="HVPCluster"

# Note: IP offsets below get used to automatically derive IP addresses
# Note: no need to allow offset overriding from commandline if the IP address itself can be specified

my_ip_offset="1"

# Note: the following can be overridden from commandline
switch_ip_offset="200"

# TODO: verify whether the final addresses (network+offset+index) lie inside the network boundaries
# Note: the following can be overridden from commandline
bmc_ip_offset="100"

bmc_confirmed="false"
bmc_type="ipmilan"
bmc_username="hvpbmcadmin"
bmc_password="HVP_dem0"

# TODO: verify whether the final addresses (network+offset+index) lie inside the network boundaries
# Note: the following can be overridden from commandline
node_ip_offset="10"

# TODO: verify whether the address (network+offset) lies inside the network boundaries
engine_ip_offset="5"

# TODO: verify whether the final addresses (network+offset+index) lie inside the network boundaries
# TODO: verify whether the final addresses (network+offset+index) overlap with base node addresses
# Note: the following can be overridden from commandline
storage_ip_offset="30"

# Note: the following can be overridden from commandline
master_index="0"

dhcp_offset="50"
dhcp_count="20"

network_priority[0]="external"
network_priority[1]="mgmt"
network_priority[2]="gluster"
network_priority[3]="lan"
network_priority[4]="internal"

declare -A network netmask network_base bondmode bondopts mtu
network['external']="dhcp"
netmask['external']="dhcp"
network_base['external']="dhcp"
bondmode['external']="N/A"
mtu['external']="dhcp"
network['mgmt']="172.20.10.0"
netmask['mgmt']="255.255.255.0"
network_base['mgmt']="172.20.10"
bondmode['mgmt']="activepassive"
mtu['mgmt']="1500"
network['gluster']="172.20.11.0"
netmask['gluster']="255.255.255.0"
network_base['gluster']="172.20.11"
bondmode['gluster']="activepassive"
mtu['gluster']="1500"
network['lan']="172.20.12.0"
netmask['lan']="255.255.255.0"
network_base['lan']="172.20.12"
bondmode['lan']="activepassive"
mtu['lan']="1500"
network['internal']="172.20.13.0"
netmask['internal']="255.255.255.0"
network_base['internal']="172.20.13"
bondmode['internal']="activepassive"
mtu['internal']="1500"

declare -A domain_name
domain_name['external']="external.private"
domain_name['mgmt']="mgmt.private"
domain_name['gluster']="gluster.private"
domain_name['lan']="lan.private"
domain_name['internal']="internal.private"

declare -A reverse_domain_name
reverse_domain_name['external']="dhcp"
reverse_domain_name['mgmt']="10.20.172.in-addr.arpa"
reverse_domain_name['gluster']="11.20.172.in-addr.arpa"
reverse_domain_name['lan']="12.20.172.in-addr.arpa"
reverse_domain_name['internal']="13.20.172.in-addr.arpa"

declare -A bridge_name
bridge_name['mgmt']="ovirtmgmt"
bridge_name['gluster']=""
bridge_name['lan']="lan"
bridge_name['internal']="internal"

ad_subdomain_prefix="ad"

sysvolrepl_password="HVP_dem0"

ad_dc_ip_offset="220"

ad_dc_name="spike"

db_ip_offset="230"

db_name="bigmcintosh"

dbtype="postgresql"
dbversion="9.6"

detype="gnome"

pr_ip_offset="250"

pr_name="rainbowdash"

vd_ip_offset="240"

vd_name="grannysmith"

my_nameserver="dhcp"

my_forwarders="8.8.8.8"

my_gateway="dhcp"

my_name="twilight"

root_password="HVP_dem0"
admin_username="hvpadmin"
admin_password="hvpdemo"
winadmin_password="HVP_dem0"
keyboard_layout="us"
local_timezone="UTC"

ovirt_version="4.1"

# Detect any configuration fragments and load them into the pre environment
# Note: BIOS based devices, file and DHCP methods are unsupported
mkdir /tmp/kscfg-pre
mkdir /tmp/kscfg-pre/mnt
ks_source="$(cat /proc/cmdline | sed -e 's/^.*\s*inst\.ks=\(\S*\)\s*.*$/\1/')"
if [ -z "${ks_source}" ]; then
	echo "Unable to determine Kickstart source - skipping configuration fragments retrieval" 1>&2
else
	ks_dev=""
	if echo "${ks_source}" | grep -q '^floppy' ; then
		# Note: hardcoded device name for floppy disk
		# Note: hardcoded filesystem type on floppy disk - assuming VFAT
		ks_dev="/dev/fd0"
		ks_fstype="vfat"
		ks_fsopt="ro"
		ks_path="$(echo ${ks_source} | awk -F: '{print $2}')"
		if [ -z "${ks_path}" ]; then
			ks_path="/ks.cfg"
		fi
		ks_dir="$(echo ${ks_path} | sed 's%/[^/]*$%%')"
	elif echo "${ks_source}" | grep -q '^cdrom:' ; then
		# Note: cdrom gets accessed as real device name which must be detected - assuming it is the first removable device
		# Note: hardcoded possible device names for CD/DVD - should cover all reasonable cases
		# Note: on RHEL>=6 even IDE/ATAPI devices have SCSI device names
		for dev in /dev/sd[a-z] /dev/sr[0-9]; do
			ks_dev=""
			if [ -b "${dev}" ]; then
				is_removable="$(cat /sys/block/$(basename ${dev})/removable 2>/dev/null)"
				if [ "${is_removable}" = "1" ]; then
					ks_dev="${dev}"
					ks_fstype="iso9660"
					ks_fsopt="ro"
					ks_path="$(echo ${ks_source} | awk -F: '{print $2}')"
					if [ -z "${ks_path}" ]; then
						echo "Unable to determine Kickstart source path" 1>&2
						ks_dev=""
					else
						ks_dir="$(echo ${ks_path} | sed 's%/[^/]*$%%')"
					fi
					break
				fi
			fi
		done
	elif echo "${ks_source}" | grep -q '^hd:' ; then
		# Note: blindly extracting device name from Kickstart commandline
		ks_dev="/dev/$(echo ${ks_source} | awk -F: '{print $2}')"
		# TODO: Detect actual filesystem type on local drive - assuming VFAT
		ks_fstype="vfat"
		ks_fsopt="ro"
		ks_path="$(echo ${ks_source} | awk -F: '{print $3}')"
		if [ -z "${ks_path}" ]; then
			echo "Unable to determine Kickstart source path" 1>&2
			ks_dev=""
		else
			ks_dir="$(echo ${ks_path} | sed 's%/[^/]*$%%')"
		fi
	elif echo "${ks_source}" | grep -q '^nfs:' ; then
		# Note: blindly extracting NFS server from Kickstart commandline
		ks_host="$(echo ${ks_source} | awk -F: '{print $2}')"
		ks_fstype="nfs"
		ks_fsopt="ro,nolock"
		ks_path="$(echo ${ks_source} | awk -F: '{print $3}')"
		if [ -z "${ks_path}" ]; then
			echo "Unable to determine Kickstart source path" 1>&2
			ks_dev=""
		else
			ks_dev="${ks_host}:$(echo ${ks_path} | sed 's%/[^/]*$%%')}"
			ks_dir="/"
		fi
	elif echo "${ks_source}" | egrep -q '^(http|https|ftp):' ; then
		# Note: blindly extracting URL from Kickstart commandline
		ks_host="$(echo ${ks_source} | sed -e 's%^.*//%%' -e 's%/.*$%%')"
		ks_dev="$(echo ${ks_source} | sed 's%/[^/]*$%%')"
		ks_fstype="url"
	else
		echo "Unsupported Kickstart source detected" 1>&2
	fi
	if [ -z "${ks_dev}" ]; then
		echo "Unable to extract Kickstart source - skipping configuration fragments retrieval" 1>&2
	else
		ks_custom_frags="hvp_parameters.sh hvp_parameters_heresiarch.sh"
		# Note: for network-based kickstart retrieval methods we extract the relevant nic MAC address to get the machine-specific fragment
		if [ "${ks_fstype}" = "url" -o "${ks_fstype}" = "nfs" ]; then
			# Note: we detect the nic device name as the one detaining the route towards the host holding the kickstart script
			# Note: regarding the kickstart host: we assume that if it is not already been given as an IP address then it is a DNS fqdn
			if ! echo "${ks_host}" | grep -q "${IPregex}" ; then
				ks_host_ip=$(nslookup "${ks_host}" | tail -n +3 | awk '/^Address/ {print $2}' | head -1)
			else
				ks_host_ip="${ks_host}"
			fi
			ks_nic=$(ip route get "${ks_host_ip}" | sed -n -e 's/^.*\s\+dev\s\+\(\S\+\)\s\+.*$/\1/p')
			if [ -f "/sys/class/net/${ks_nic}/address" ]; then
				ks_custom_frags="${ks_custom_frags} hvp_parameters_$(cat /sys/class/net/${ks_nic}/address).sh"
			fi
		fi
		if [ "${ks_fstype}" = "url" ]; then
			for custom_frag in ${ks_custom_frags} ; do
				echo "Attempting network retrieval of ${ks_dev}/${custom_frag}" 1>&2
				wget -P /tmp/kscfg-pre "${ks_dev}/${custom_frag}" 
			done
		else
			mount -t ${ks_fstype} -o ${ks_fsopt} ${ks_dev} /tmp/kscfg-pre/mnt
			for custom_frag in ${ks_custom_frags} ; do
				echo "Attempting filesystem retrieval of ${custom_frag}" 1>&2
				if [ -f "/tmp/kscfg-pre/mnt${ks_dir}/${custom_frag}" ]; then
					cp "/tmp/kscfg-pre/mnt${ks_dir}/${custom_frag}" /tmp/kscfg-pre
				fi
			done
			umount /tmp/kscfg-pre/mnt
		fi
	fi
fi
# Load any configuration fragment found, in the proper order
# Note: configuration-fragment defaults will override hardcoded defaults
# Note: commandline parameters will override configuration-fragment and hardcoded defaults
# Note: configuration fragments get executed with full privileges and no further controls beside a bare syntax check: obvious security implications must be taken care of (use HTTPS for network-retrieved kickstart and fragments)
pushd /tmp/kscfg-pre
for custom_frag in ${ks_custom_frags} ; do
	if [ -f "${custom_frag}" ]; then
		# Perform a configuration fragment sanity check before loading
		bash -n "${custom_frag}" > /dev/null 2>&1
		res=$?
		if [ ${res} -ne 0 ]; then
			# Report invalid configuration fragment and skip it
			logger -s -p "local7.err" -t "kickstart-pre" "Skipping invalid remote configuration fragment ${custom_frag}"
			continue
		fi
		source "./${custom_frag}"
	fi
done
popd

# TODO: perform better consistency check on all commandline-given parameters

# Determine choice of nic MAC fixed assignment
if grep -w -q 'hvp_nicmacfix' /proc/cmdline ; then
	nicmacfix="true"
fi

# Determine choice of skipping custom packages intallation
if grep -w -q 'hvp_orthodox' /proc/cmdline ; then
	orthodox_mode="true"
fi

# Determine choice of skipping local virtualization support
if grep -w -q 'hvp_novirt' /proc/cmdline ; then
	nolocalvirt="true"
fi
if ! egrep -q '^flags.*(vmx|svm)' /proc/cpuinfo ; then
	nolocalvirt="true"
fi

# Determine node OS disk choice
given_nodeosdisk=$(sed -n -e 's/^.*hvp_nodeosdisk=\(\S*\).*$/\1/p' /proc/cmdline)
# No indication on node OS disk choice: use default choice
if [ -z "${given_nodeosdisk}" ]; then
	given_nodeosdisk="${default_nodeosdisk}"
fi

# Determine cluster members number
given_node_count=$(sed -n -e 's/^.*hvp_nodecount=\(\S*\).*$/\1/p' /proc/cmdline)
if ! echo "${given_node_count}" | grep -q '^[[:digit:]]\+$' ; then
	node_count="${default_node_count}"
else
	node_count="${given_node_count}"
fi
# Fill in missing node names
for ((i=0;i<${node_count};i=i+1)); do
	if [ -z "${node_name[${i}]}" ]; then
		node_name[${i}]="node${i}"
	fi
done

# Define number of active storage members
# Note: if we have three nodes only, then one (the last one) will be an all-arbiter no-I/O node
if [ "${node_count}" -eq 3 ]; then
	active_storage_node_count="2"
else
	active_storage_node_count="${node_count}"
fi

# Determine master node identity
given_master_index=$(sed -n -e 's/^.*hvp_masternodeid=\(\S*\).*$/\1/p' /proc/cmdline)
if echo "${given_master_index}" | grep -q '^[[:digit:]]\+$' ; then
	master_index="${given_master_index}"
fi

# Determine cluster member names
given_names=$(sed -n -e 's/^.*hvp_nodename=\(\S*\).*$/\1/p' /proc/cmdline)
node_index="0"
for name in $(echo "${given_names}" | sed -e 's/,/ /g'); do
	if echo "${name}" | grep -q '^[-[:alnum:]]\+$' ; then
		node_name[${node_index}]="${name}"
		node_index=$((node_index+1))
	fi
done
given_names=""
for (( i=0; i<${node_count}; i=i+1 )); do
	given_names="${given_names},${node_name[${i}]}"
done
given_names=$(echo "${given_names}" | sed -e 's/^,//')

# Determine switch name
given_switch_name=$(sed -n -e 's/^.*hvp_switchname=\(\S*\).*$/\1/p' /proc/cmdline)
if echo "${given_switch_name}" | grep -q '^[-[:alnum:]]\+$' ; then
	switch_name="${given_switch_name}"
fi

# Determine engine name
given_engine_name=$(sed -n -e 's/^.*hvp_enginename=\(\S*\).*$/\1/p' /proc/cmdline)
if echo "${given_engine_name}" | grep -q '^[-[:alnum:]]\+$' ; then
	engine_name="${given_engine_name}"
fi

# Determine storage name
given_storage_name=$(sed -n -e 's/^.*hvp_storagename=\(\S*\).*$/\1/p' /proc/cmdline)
if echo "${given_storage_name}" | grep -q '^[-[:alnum:]]\+$' ; then
	storage_name="${given_storage_name}"
fi

# Determine datacenter name
given_datacenter_name=$(sed -n -e 's/^.*hvp_dcname=\(\S*\).*$/\1/p' /proc/cmdline)
if [ -n "${given_datacenter_name}" ]; then
	datacenter_name="${given_datacenter_name}"
fi

# Determine cluster name
given_cluster_name=$(sed -n -e 's/^.*hvp_clname=\(\S*\).*$/\1/p' /proc/cmdline)
if [ -n "${given_cluster_name}" ]; then
	cluster_name="${given_cluster_name}"
fi

# Determine root password
given_root_password=$(sed -n -e "s/^.*hvp_rootpwd=\\(\\S*\\).*\$/\\1/p" /proc/cmdline)
if [ -n "${given_root_password}" ]; then
	root_password="${given_root_password}"
fi

# Determine admin username
given_admin_username=$(sed -n -e "s/^.*hvp_adminname=\\(\\S*\\).*\$/\\1/p" /proc/cmdline)
if [ -n "${given_admin_username}" ]; then
	admin_username="${given_admin_username}"
fi

# Determine admin password
given_admin_password=$(sed -n -e "s/^.*hvp_adminpwd=\\(\\S*\\).*\$/\\1/p" /proc/cmdline)
if [ -n "${given_admin_password}" ]; then
	admin_password="${given_admin_password}"
fi

# Determine AD further admin username
given_winadmin_username=$(sed -n -e "s/^.*hvp_winadminname=\\(\\S*\\).*\$/\\1/p" /proc/cmdline)
if [ -n "${given_winadmin_username}" ]; then
	winadmin_username="${given_winadmin_username}"
fi
if [ -z "${winadmin_username}" ]; then
	winadmin_username="ad${admin_username}"
fi

# Determine AD further admin password
given_winadmin_password=$(sed -n -e "s/^.*hvp_winadminpwd=\\(\\S*\\).*\$/\\1/p" /proc/cmdline)
if [ -n "${given_winadmin_password}" ]; then
	winadmin_password="${given_winadmin_password}"
fi

# Determine keyboard layout
given_keyboard_layout=$(sed -n -e "s/^.*hvp_kblayout=\\(\\S*\\).*\$/\\1/p" /proc/cmdline)
if [ -n "${given_keyboard_layout}" ]; then
	keyboard_layout="${given_keyboard_layout}"
fi

# Determine local timezone
given_local_timezone=$(sed -n -e "s/^.*hvp_timezone=\\(\\S*\\).*\$/\\1/p" /proc/cmdline)
if [ -n "${given_local_timezone}" ]; then
	local_timezone="${given_local_timezone}"
fi

# Determine oVirt version
given_ovirt_version=$(sed -n -e "s/^.*hvp_ovirt_version=\\(\\S*\\).*\$/\\1/p" /proc/cmdline)
if [ -n "${given_ovirt_version}" ]; then
	ovirt_version="${given_ovirt_version}"
fi

# Determine node BMC IPs offset base
given_bmcs_offset=$(sed -n -e 's/^.*hvp_bmcs_offset=\(\S*\).*$/\1/p' /proc/cmdline)
if echo "${given_bmcs_offset}" | grep -q '^[[:digit:]]\+$' ; then
	bmc_ip_offset="${given_bmcs_offset}"
fi

# Determine node BMC type
given_bmc_type=$(sed -n -e "s/^.*hvp_bmcs_type=\\(\\S*\\).*\$/\\1/p" /proc/cmdline)
if [ -n "${given_bmc_type}" ]; then
	bmc_type="${given_bmc_type}"
	# Correctly detect an empty (disabled) BMC type
	if [ "${bmc_type}" = '""' -o "${bmc_type}" = "''" ]; then
		bmc_type=""
	else
		bmc_confirmed="true"
	fi
fi

# Determine node BMC username
given_bmc_username=$(sed -n -e "s/^.*hvp_bmcs_username=\\(\\S*\\).*\$/\\1/p" /proc/cmdline)
if [ -n "${given_bmc_username}" ]; then
	bmc_username="${given_bmc_username}"
	bmc_confirmed="true"
	# Correctly detect an empty (disabled) BMC username
	if [ "${bmc_username}" = '""' -o "${bmc_username}" = "''" ]; then
		bmc_username=""
	fi
fi

# Determine node BMC password
given_bmc_password=$(sed -n -e "s/^.*hvp_bmcs_password=\\(\\S*\\).*\$/\\1/p" /proc/cmdline)
if [ -n "${given_bmc_password}" ]; then
	bmc_password="${given_bmc_password}"
	bmc_confirmed="true"
	# Correctly detect an empty (disabled) BMC password
	if [ "${bmc_password}" = '""' -o "${bmc_password}" = "''" ]; then
		bmc_password=""
	fi
fi

# Determine node IPs offset base
given_nodes_offset=$(sed -n -e 's/^.*hvp_nodes_offset=\(\S*\).*$/\1/p' /proc/cmdline)
if echo "${given_nodes_offset}" | grep -q '^[[:digit:]]\+$' ; then
	node_ip_offset="${given_nodes_offset}"
fi

# Determine storage IPs offset base
given_storage_offset=$(sed -n -e 's/^.*hvp_storage_offset=\(\S*\).*$/\1/p' /proc/cmdline)
if echo "${given_storage_offset}" | grep -q '^[[:digit:]]\+$' ; then
	storage_ip_offset="${given_storage_offset}"
fi

# Determine hostname
given_hostname=$(sed -n -e 's/^.*hvp_myname=\(\S*\).*$/\1/p' /proc/cmdline)
if echo "${given_hostname}" | grep -q '^[[:alnum:]]\+$' ; then
	my_name="${given_hostname}"
fi

# Determine AD subdomain name
given_ad_subdomainname=$(sed -n -e "s/^.*hvp_ad_subdomainname=\\(\\S*\\).*\$/\\1/p" /proc/cmdline)
if [ -n "${given_ad_subdomainname}" ]; then
	ad_subdomain_prefix="${given_ad_subdomainname}"
fi

# Determine NetBIOS domain name
given_netbiosdomain=$(sed -n -e 's/^.*hvp_netbiosdomain=\(\S*\).*$/\1/p' /proc/cmdline)
if echo "${given_netbiosdomain}" | grep -q '^[[:alnum:]]\+$' ; then
	netbios_domain_name=$(echo "${given_netbiosdomain}" | awk '{print toupper($0)}')
fi

# Determine AD DC name
given_dcname=$(sed -n -e 's/^.*hvp_dcname=\(\S*\).*$/\1/p' /proc/cmdline)
if echo "${given_dcname}" | grep -q '^[[:alnum:]]\+$' ; then
	ad_dc_name="${given_dcname}"
fi

# Determine DB server name
given_dbname=$(sed -n -e 's/^.*hvp_dbname=\(\S*\).*$/\1/p' /proc/cmdline)
if echo "${given_dbname}" | grep -q '^[[:alnum:]]\+$' ; then
	db_name="${given_dbname}"
fi

# Determine print server name
given_prname=$(sed -n -e 's/^.*hvp_prname=\(\S*\).*$/\1/p' /proc/cmdline)
if echo "${given_prname}" | grep -q '^[[:alnum:]]\+$' ; then
	pr_name="${given_prname}"
fi

# Determine virtual desktop name
given_vdname=$(sed -n -e 's/^.*hvp_vdname=\(\S*\).*$/\1/p' /proc/cmdline)
if echo "${given_vdname}" | grep -q '^[[:alnum:]]\+$' ; then
	vd_name="${given_vdname}"
fi

# Determine database type
given_dbtype=$(sed -n -e 's/^.*hvp_dbtype=\(\S*\).*$/\1/p' /proc/cmdline)
case "${given_dbtype}" in
	postgresql|mysql|firebird|mongodb|sqlserver)
		dbtype="${given_dbtype}"
		;;
esac

# Determine database version
given_dbversion=$(sed -n -e 's/^.*hvp_dbversion=\(\S*\).*$/\1/p' /proc/cmdline)
if [ -n "${given_dbversion}" ]; then
	dbversion="${given_dbversion}"
fi
if [ -z "${dbversion}" -o "${dbtype}" != "postgresql" -a "${dbversion}" = "9.6" ]; then
	case "${dbtype}" in
		postgresql)
			dbversion="9.6"
			;;
		mysql)
			dbversion="5.7"
			;;
		firebird)
			dbversion="2.5"
			;;
		mongodb)
			dbversion="3.6"
			;;
		sqlserver)
			dbversion="2017.CU"
			;;
	esac
fi

# Determine desktop type
given_detype=$(sed -n -e 's/^.*hvp_detype=\(\S*\).*$/\1/p' /proc/cmdline)
case "${given_detype}" in
	gnome|kde|xfce|lxde)
		detype="${given_detype}"
		;;
esac

# Determine nameserver address
given_nameserver=$(sed -n -e "s/^.*hvp_nameserver=\\(\\S*\\).*\$/\\1/p" /proc/cmdline)
if [ -n "${given_nameserver}" ]; then
	my_nameserver="${given_nameserver}"
fi

# Determine forwarders addresses
given_forwarders=$(sed -n -e "s/^.*hvp_forwarders=\\(\\S*\\).*\$/\\1/p" /proc/cmdline)
if [ -n "${given_forwarders}" ]; then
	my_forwarders="${given_forwarders}"
fi

# Determine gateway address
given_gateway=$(sed -n -e "s/^.*hvp_gateway=\\(\\S*\\).*\$/\\1/p" /proc/cmdline)
if [ -n "${given_gateway}" ]; then
	my_gateway="${given_gateway}"
fi

# Determine DHCP offset
given_dhcp_offset=$(sed -n -e "s/^.*hvp_dhcp_offset=\\(\\S*\\).*\$/\\1/p" /proc/cmdline)
if [ -n "${given_dhcp_offset}" ]; then
	dhcp_offset="${given_dhcp_offset}"
fi

# Determine DHCP range
given_dhcp_count=$(sed -n -e "s/^.*hvp_dhcp_count=\\(\\S*\\).*\$/\\1/p" /proc/cmdline)
if [ -n "${given_dhcp_count}" ]; then
	dhcp_count="${given_dhcp_count}"
fi

# Determine network segments parameters
unset my_ip
declare -A my_ip
for zone in "${!network[@]}" ; do
	given_network_domain_name=$(sed -n -e "s/^.*hvp_${zone}_domainname=\\(\\S*\\).*\$/\\1/p" /proc/cmdline)
	if [ -n "${given_network_domain_name}" ]; then
		domain_name["${zone}"]="${given_network_domain_name}"
	fi
	given_network_bridge_name=$(sed -n -e "s/^.*hvp_${zone}_bridge=\\(\\S*\\).*\$/\\1/p" /proc/cmdline)
	if [ -n "${given_network_bridge_name}" ]; then
		bridge_name["${zone}"]="${given_network_bridge_name}"
		# Correctly detect an empty (disabled) bridge name
		if [ "${bridge_name[${zone}]}" = '""' -o "${bridge_name[${zone}]}" = "''" ]; then
			bridge_name["${zone}"]=""
		fi
	fi
	given_network_mtu=$(sed -n -e "s/^.*hvp_${zone}_mtu=\\(\\S*\\).*\$/\\1/p" /proc/cmdline)
	if [ -n "${given_network_mtu}" ]; then
		mtu["${zone}"]="${given_network_mtu}"
	fi
	given_network_bondmode=$(sed -n -e "s/^.*hvp_${zone}_bondmode=\\(\\S*\\).*\$/\\1/p" /proc/cmdline)
	if [ -n "${given_network_bondmode}" ]; then
		case "${given_network_bondmode}" in
			lacp)
				bondopts["${zone}"]="mode=802.3ad;xmit_hash_policy=layer2+3;miimon=100"
				bondmode["${zone}"]="lacp"
				;;
			roundrobin)
				# Note: roundrobin is supported only on GLUSTER network, otherwise we force activepassive
				if [ "${zone}" = "gluster" ]; then
					bondopts["${zone}"]="mode=balance-rr;miimon=100"
					bondmode["${zone}"]="roundrobin"
				else
					echo "Unsupported bonding mode (${given_network_bondmode}) for zone ${zone} - forcing activepassive" 1>&2
					bondopts["${zone}"]="mode=active-backup;miimon=100"
					bondmode["${zone}"]="activepassive"
				fi
				;;
			activepassive)
				bondopts["${zone}"]="mode=active-backup;miimon=100"
				bondmode["${zone}"]="activepassive"
				;;
			*)
				# In case of unrecognized mode force activepassive
				echo "Unrecognized bonding mode (${given_network_bondmode}) for zone ${zone} - forcing activepassive" 1>&2
				bondopts["${zone}"]="mode=active-backup;miimon=100"
				bondmode["${zone}"]="activepassive"
				;;
		esac
	fi
	given_network=$(sed -n -e "s/^.*hvp_${zone}=\\(\\S*\\).*\$/\\1/p" /proc/cmdline)
	unset NETWORK NETMASK
	eval $(ipcalc -s -n "${given_network}")
	eval $(ipcalc -s -m "${given_network}")
	if [ -n "${NETWORK}" -a -n "${NETMASK}" ]; then
		network["${zone}"]="${NETWORK}"
		netmask["${zone}"]="${NETMASK}"
	fi
	NETWORK=${network["${zone}"]}
	NETMASK=${netmask["${zone}"]}
	if [ "${NETWORK}" = "dhcp" -o "${NETMASK}" = "dhcp" ]; then
		continue
	fi
	given_network_my_ip=$(sed -n -e "s/^.*hvp_${zone}_my_ip=\\(\\S*\\).*\$/\\1/p" /proc/cmdline)
	if [ -n "${given_network_my_ip}" ]; then
		my_ip["${zone}"]="${given_network_my_ip}"
	else
		unset IPADDR
		IPADDR=$(echo "${given_network}" | sed -n -e 's>^\([^/]*\)/.*$>\1>p')
		if [ -n "${IPADDR}" -a "${IPADDR}" != "${NETWORK}" ]; then
			my_ip["${zone}"]="${IPADDR}"
		else
			my_ip["${zone}"]=$(ipmat ${NETWORK} ${my_ip_offset} +)
		fi
	fi
	unset PREFIX
	eval $(ipcalc -s -p "${NETWORK}" "${NETMASK}")
	if [ "${PREFIX}" -ge 24 ]; then
		reverse_domain_name["${zone}"]=$(echo ${NETWORK} | awk -F. 'BEGIN {OFS="."}; {print $3,$2,$1}').in-addr.arpa
		network_base["${zone}"]=$(echo ${NETWORK} | awk -F. 'BEGIN {OFS="."}; {print $1,$2,$3}')
	elif [ "${PREFIX}" -ge 16 ]; then
		reverse_domain_name["${zone}"]=$(echo ${NETWORK} | awk -F. 'BEGIN {OFS="."}; {print $2,$1}').in-addr.arpa
		network_base["${zone}"]=$(echo ${NETWORK} | awk -F. 'BEGIN {OFS="."}; {print $1,$2}')
	elif [ "${PREFIX}" -ge 8 ]; then
		reverse_domain_name["${zone}"]=$(echo ${NETWORK} | awk -F. 'BEGIN {OFS="."}; {print $1}').in-addr.arpa
		network_base["${zone}"]=$(echo ${NETWORK} | awk -F. 'BEGIN {OFS="."}; {print $1}')
	fi
done

# Disable any interface configured by NetworkManager
# Note: NetworkManager may interfer with interface assignment autodetection logic below
# Note: interfaces will be explicitly activated again by our dynamically created network configuration fragment
for nic_name in $(ls /sys/class/net/ 2>/dev/null | egrep -v '^(bonding_masters|lo|sit[0-9])$' | sort); do
	if nmcli device show "${nic_name}" | grep -q '^GENERAL.STATE:.*(connected)' ; then
		nmcli device disconnect "${nic_name}"
		nmcli connection delete "${nic_name}"
		ip addr flush dev "${nic_name}"
		ip link set mtu 1500 dev "${nic_name}"
	fi
done

# Determine network interface assignment
# Note: unconnected nics will be disabled
# Note: network assignment to interfaces will be tried in order of network zone priority statically assigned above
unset nics
declare -A nics
for nic_name in $(ls /sys/class/net/ 2>/dev/null | egrep -v '^(bonding_masters|lo|sit[0-9])$' | sort); do
	# Note: the file below will contain 1 for link up, 0 for link down or will result inaccessible for interface disabled
	if [ "$(cat /sys/class/net/${nic_name}/carrier 2>/dev/null)" = "1" ]; then
		ip addr flush dev "${nic_name}"
		nic_assigned='false'
		for (( i=0; i<${#network_priority[*]}; i=i+1 )); do
			zone="${network_priority[${i}]}"
			# Note: only up to one nic per zone here (no bonding support)
			if [ -n "${nics[${zone}]}" ]; then
				continue
			fi
			if [ "${network[${zone}]}" = "dhcp" ]; then
				# Note: the following exits with code 2 in case of unsuccessful DHCP configuration, otherwise forks in backgroud
				dhclient -q -1 -timeout 30 "${nic_name}"
				res=$?
				if [ ${res} -eq 0 ] ; then
					dhclient -x
				fi
			else
				# Note: check whether the desired MTU setting can be obtained or not - skip if it fails
				ip link set mtu "${mtu[${zone}]}" dev "${nic_name}"
				res=$?
				effective_mtu=$(cat /sys/class/net/${nic_name}/mtu 2>/dev/null)
				if [ ${res} -ne 0 -o "${effective_mtu}" != "${mtu[${zone}]}" ] ; then
					ip addr flush dev "${nic_name}"
					ip link set mtu 1500 dev "${nic_name}"
					continue
				fi
				unset PREFIX
				eval $(ipcalc -s -p "${network[${zone}]}" "${netmask[${zone}]}")
				ip addr add "${my_ip[${zone}]}/${PREFIX}" dev "${nic_name}"
				res=$?
			fi
			# Note: no known IPs to ping on each network: we simply detect success or failure above
			if [ ${res} -eq 0 ] ; then
				nics["${zone}"]="${nic_name}"
				nic_assigned='true'
				ip addr flush dev "${nic_name}"
				ip link set mtu 1500 dev "${nic_name}"
				break
			fi
			ip addr flush dev "${nic_name}"
			ip link set mtu 1500 dev "${nic_name}"
		done
		if [ "${nic_assigned}" = "false" ]; then
			nics['unused']="${nics['unused']} ${nic_name}"
		fi
	else
		nics['unused']="${nics['unused']} ${nic_name}"
	fi
done

# TODO: Perform nic connections consistency check
# Note: with one network it must be external/mgmt (but without DHCP since we must provide it)
# Note: with two networks they must be external and mgmt
# Note: with three networks they must be external, mgmt and gluster
# Note: with four networks they must be external, mgmt, gluster and lan
# Note: with five networks they must be external, mgmt, gluster, lan and internal

# Remove my_ip, network/netmask/network_base/bondmode/mtu and domain_name/reverse_domain_name entries for non-existent networks
for zone in "${!network[@]}" ; do
	if [ -z "${nics[${zone}]}" ]; then
		unset my_ip[${zone}]
		unset network[${zone}]
		unset netmask[${zone}]
		unset network_base[${zone}]
		unset bondmode[${zone}]
		unset bondopts[${zone}]
		unset mtu[${zone}]
		unset domain_name[${zone}]
		unset reverse_domain_name[${zone}]
	fi
done

# TODO: Adapt bonding mode to network setup
# TODO: disabled for maximum compatibility (LACP needs switch support)
# Note: if not explicitly configured, mgmt network bonding mode is activepassive if there are separate gluster and lan networks, otherwise lacp
#if [ -z "${bondopts['mgmt']}" ]; then
#	if [ -n "${nics['gluster']}" -a -n "${nics['lan']}" ]; then
#		bondopts['mgmt']="mode=active-backup;miimon=100"
#		bondmode['mgmt']="activepassive"
#	else
#		bondopts['mgmt']="mode=802.3ad;xmit_hash_policy=layer2+3;miimon=100"
#		bondmode['mgmt']="lacp"
#	fi
#fi

# Derive missing bondopts from bonding mode indications
# Note: used only for node configuration parameters file generation below
for zone in "${!bondmode[@]}" ; do
	# Skip explicitly configured zones already set above
	if [ -n "${bondopts[${zone}]}" ]; then
		continue
	fi
	case "${bondmode[${zone}]}" in
		lacp)
			bondopts["${zone}"]="mode=802.3ad;xmit_hash_policy=layer2+3;miimon=100"
			;;
		roundrobin)
			bondopts["${zone}"]="mode=balance-rr;miimon=100"
			;;
		activepassive)
			bondopts["${zone}"]="mode=active-backup;miimon=100"
			;;
		*)
			# In case of unrecognized mode force activepassive
			echo "Unrecognized bonding mode (${bondmode[${zone}]}) for zone ${zone} - forcing activepassive" 1>&2
			bondopts["${zone}"]="mode=active-backup;miimon=100"
			;;
	esac
done

# Determine network segment identity and parameters
if [ -n "${nics['mgmt']}" ]; then
	dhcp_zone="mgmt"
	dhcp_gateway="${my_ip[${dhcp_zone}]}"
else
	dhcp_zone="external"
	dhcp_gateway="${my_gateway}"
fi
if [ -n "${nics['gluster']}" ]; then
	gluster_zone="gluster"
	gluster_network="true"
else
	gluster_zone="${dhcp_zone}"
	gluster_network="false"
fi
if [ -n "${nics['lan']}" ]; then
	lan_network="true"
else
	lan_network="false"
fi
if [ -n "${nics['internal']}" ]; then
	internal_network="true"
else
	internal_network="false"
fi

# Determine switch IP
given_switch=$(sed -n -e "s/^.*hvp_switch=\\(\\S*\\).*\$/\\1/p" /proc/cmdline)
if [ -n "${given_switch}" ]; then
	switch_ip="${given_switch}"
fi
if [ -z "${switch_ip}" ]; then
	switch_ip=$(ipmat $(ipmat ${my_ip[${dhcp_zone}]} ${my_ip_offset} -) ${switch_ip_offset} +)
fi

# Determine engine IP
given_engine=$(sed -n -e 's/^.*hvp_engine=\(\S*\).*$/\1/p' /proc/cmdline)
if [ -n "${given_engine}" ]; then
	engine_ip="${given_engine}"
fi
if [ -z "${engine_ip}" ]; then
	engine_ip=$(ipmat $(ipmat ${my_ip[${dhcp_zone}]} ${my_ip_offset} -) ${engine_ip_offset} +)
fi

# Determine AD DC IP
given_dc=$(sed -n -e 's/^.*hvp_ad_dc=\(\S*\).*$/\1/p' /proc/cmdline)
if [ -n "${given_dc}" ]; then
	ad_dc_ip="${given_dc}"
fi
if [ -n "${nics['lan']}" ]; then
	ad_zone="lan"
else
	ad_zone="${dhcp_zone}"
fi
if [ -z "${ad_dc_ip}" ]; then
	ad_dc_ip=$(ipmat $(ipmat ${my_ip[${ad_zone}]} ${my_ip_offset} -) ${ad_dc_ip_offset} +)
fi

# Determine DB server IP
given_db=$(sed -n -e 's/^.*hvp_db=\(\S*\).*$/\1/p' /proc/cmdline)
if [ -n "${given_db}" ]; then
	db_ip="${given_db}"
fi
if [ -z "${db_ip}" ]; then
	db_ip=$(ipmat $(ipmat ${my_ip[${ad_zone}]} ${my_ip_offset} -) ${db_ip_offset} +)
fi

# Determine print server IP
given_pr=$(sed -n -e 's/^.*hvp_pr=\(\S*\).*$/\1/p' /proc/cmdline)
if [ -n "${given_pr}" ]; then
	pr_ip="${given_pr}"
fi
if [ -z "${pr_ip}" ]; then
	pr_ip=$(ipmat $(ipmat ${my_ip[${ad_zone}]} ${my_ip_offset} -) ${pr_ip_offset} +)
fi

# Determine virtual desktop IP
given_vd=$(sed -n -e 's/^.*hvp_vd=\(\S*\).*$/\1/p' /proc/cmdline)
if [ -n "${given_vd}" ]; then
	vd_ip="${given_vd}"
fi
if [ -z "${vd_ip}" ]; then
	vd_ip=$(ipmat $(ipmat ${my_ip[${ad_zone}]} ${my_ip_offset} -) ${vd_ip_offset} +)
fi

# Define default NetBIOS domain name if not specified
if [ -z "${netbios_domain_name}" ]; then
	netbios_domain_name=$(echo ${ad_subdomain_prefix}.${domain_name[${ad_zone}]} | awk -F. '{print toupper($1)}')
fi

# Define AD Kerberos realm name
realm_name=$(echo ${ad_subdomain_prefix}.${domain_name[${ad_zone}]} | awk '{print toupper($0)}')

# Define NetBIOS machine name for storage services
netbios_storage_name=$(echo "${storage_name}" | awk '{print toupper($0)}')

# Create network setup fragment
# Note: dynamically created here to make use of full autodiscovery above
# Note: listing interfaces using network priority order
# TODO: Anaconda/NetworkManager do not add DEFROUTE="no" and MTU="xxx" parameters - adding workarounds here - remove when fixed upstream
mkdir -p /tmp/hvp-networkmanager-conf
pushd /tmp/hvp-networkmanager-conf
cat << EOF > /tmp/full-network
# Network device configuration - possibly mixed static / dynamic (DHCP) version (always verify that your nic is supported by install kernel/modules)
# Use a "void" configuration to make sure anaconda quickly steps over "onboot=no" devices
EOF
for (( i=0; i<${#network_priority[*]}; i=i+1 )); do
	zone="${network_priority[${i}]}"
	if [ -n "${nics[${zone}]}" ]; then
		nic_names=$(echo ${nics[${zone}]} | sed -e 's/^\s*//' -e 's/\s*$//')
		further_options=""
		# Add gateway and nameserver options only if the default gateway is on this network
		unset NETWORK
		if [ "${my_gateway}" = "dhcp" ]; then
			# Note: the following will never match an actual network address
			NETWORK="0.0.0.0"
		else
			eval $(ipcalc -s -n "${my_gateway}" "${netmask[${zone}]}")
		fi
		if [ "${my_nameserver}" = "dhcp" ]; then
			my_nameserver=$(awk '/^nameserver/ {print $2; quit}' /etc/resolv.conf)
		fi
		if [ "${NETWORK}" = "${network[${zone}]}" ]; then
			further_options="${further_options} --gateway=${my_gateway} --nameserver=${my_nameserver}"
			# TODO: workaround for Anaconda/NetworkManager bug - remove when fixed upstream
			echo 'DEFROUTE="yes"' >> ifcfg-${nic_names}
		elif [ "${zone}" != "external" ]; then
			# Note: the external zone must be exempt from the nodefroute option
			further_options="${further_options} --nodefroute"
			# TODO: workaround for Anaconda/NetworkManager bug - remove when fixed upstream
			echo 'DEFROUTE="no"' >> ifcfg-${nic_names}
		fi
		# Add hostname option on the DHCP-offering zone only
		if [ "${zone}" = "${dhcp_zone}" ]; then
			further_options="${further_options} --hostname=${my_name}.${domain_name[${zone}]}"
		fi
		if [ "${network[${zone}]}" = "dhcp" ]; then
			# DHCP configuration
			cat <<- EOF >> /tmp/full-network
			network --device=${nic_names} --activate --onboot=yes --bootproto=dhcp ${further_options}
			EOF
		else
			# Static configuration
			cat <<- EOF >> /tmp/full-network
			network --device=${nic_names} --activate --onboot=yes --bootproto=static --ip=${my_ip[${zone}]} --netmask=${netmask[${zone}]} --mtu=${mtu[${zone}]} ${further_options}
			EOF
			# TODO: workaround for Anaconda/NetworkManager bug - remove when fixed upstream
			echo "MTU=\"${mtu[${zone}]}\"" >> ifcfg-${nic_names}
		fi
	fi
done
for nic_name in ${nics['unused']} ; do
	# TODO: the following makes anaconda crash because of https://bugzilla.redhat.com/show_bug.cgi?id=1418289
	# TODO: restore when fixed upstream
	#network --device=${nic_name} --no-activate --nodefroute --onboot=no --noipv4 --noipv6
	cat <<- EOF >> /tmp/full-network
	network --device=${nic_name} --no-activate --nodefroute --onboot=no
	EOF
done
popd

# Create users setup fragment
cat << EOF > /tmp/full-users
# Use given username and password for SSH access to installation
# Note: you must add inst.sshd to installation commandline for the following to have any effect
sshpw --username=${admin_username} ${admin_password} --plaintext
# Define root password
rootpw ${root_password}
# Create an unprivileged user
# Note: demanded to post section to allow for preconfigured default settings
#user --name=${admin_username} --password=${admin_password} --plaintext --gecos=Admin
EOF
# Prepare users configuration script to be run at first boot
mkdir -p /tmp/hvp-users-conf
cat << EOF > /tmp/hvp-users-conf/rc.users-setup
#!/bin/bash
# Create local user for maintenance work
# Note: unprivileged user created here to account for default settings
useradd -c "Admin" ${admin_username}
echo '${admin_password}' | passwd --stdin ${admin_username}
# Add user to wheel group to allow liberal use of sudo
usermod -a -G wheel ${admin_username}
# Configure an rpmbuild user environment
su - ${admin_username} -c rpmdev-setuptree
su - ${admin_username} -c "mkdir /home/${admin_username}/rpmbuild/tmp"
echo "%_tmppath     %_topdir/tmp" >> /home/${admin_username}/.rpmmacros

# Configure email aliases (divert root email to administrative account)
sed -i -e "s/^#\\\\s*root.*\\\$/root:\\\\t\\\\t${admin_username}/" /etc/aliases
newaliases
EOF

# Create localization setup fragment
# TODO: allow changing system language too
if [ "${keyboard_layout}" != "us" ]; then
	# TODO: GNOME3 seems not to respect the keyboard layout preference order (US is always the default) - removing additional layout - restore when fixed upstream
	#xlayouts="'${keyboard_layout}','us'"
	xlayouts="'${keyboard_layout}'"
else
	xlayouts="'us'"
fi
cat << EOF > /tmp/full-localization
# Default system language, additional languages can be enabled installing the appropriate packages below
lang en_US.UTF-8
# Keyboard layout
keyboard --vckeymap=${keyboard_layout} --xlayouts=${xlayouts}
# Configure time zone (NTP details demanded to post section)
timezone ${local_timezone} --isUtc
EOF

# Create disk setup fragment
# TODO: find a better way to detect emulated/VirtIO devices
all_devices="$(list-harddrives | egrep -v '^(fd|sr)[[:digit:]]*[[:space:]]' | awk '{print $1}' | sort)"
if [ -b /dev/vda ]; then
	device_name="vda"
elif [ -b /dev/xvda ]; then
	device_name="xvda"
else
	device_name="sda"
fi
cat << EOF > /tmp/full-disk
# Simple disk configuration: single SCSI/SATA/VirtIO disk
# Initialize partition table (GPT) on selected disk
clearpart --drives=${device_name} --all --initlabel --disklabel=gpt
# Bootloader placed on MBR, with 3 seconds waiting and with password protection
bootloader --location=mbr --timeout=3 --password=${root_password} --boot-drive=${device_name} --driveorder=${device_name}
# Ignore further disk - maybe USB key!!!
ignoredisk --only-use=${device_name}
# Automatically create UEFI or BIOS boot partition depending on hardware capabilities
reqpart --add-boot
# Simple partitioning: single root and swap
part swap --fstype swap --hibernation --ondisk=${device_name} --asprimary
part / --fstype xfs --size=100 --grow --ondisk=${device_name} --asprimary
EOF
# Clean up disks from any previous LVM setup
# Note: it seems that simply zeroing out below is not enough
vgscan -v
for vg_name in $(vgs --noheadings -o vg_name); do
	vgremove -v -y "${vg_name}"
	udevadm settle --timeout=5
done
for pv_name in $(pvs --noheadings -o pv_name); do
	pvremove -v -ff -y "${pv_name}"
	udevadm settle --timeout=5
done
# Clean up disks from any previous software-RAID (Linux or BIOS based) setup
# TODO: this does not work on CentOS7 (it would need some sort of late disk-status refresh induced inside anaconda) - workaround by manually zeroing-out the first 10 MiBs from a rescue boot before starting the install process (or simply restarting when installation stops/hangs at storage setup)
# Note: skipping this on a virtual machine to avoid inflating a thin-provisioned virtual disk
# Note: dmidecode command may no longer be available in pre environment
if cat /sys/class/dmi/id/sys_vendor | egrep -q -v "(Microsoft|VMware|innotek|Parallels|Red.*Hat|oVirt|Xen)" ; then
	# Note: resetting all disk devices since leftover configurations may interfer with installation and/or setup later on
	for current_device in ${all_devices}; do
		dd if=/dev/zero of=/dev/${current_device} bs=1M count=10
		dd if=/dev/zero of=/dev/${current_device} bs=1M count=10 seek=$(($(blockdev --getsize64 /dev/${current_device}) / (1024 * 1024) - 10))
	done
	partprobe
	udevadm settle --timeout=5
fi

# Create install source selection fragment
# Note: we use a non-local (hd:) stage2 location as indicator of network boot
given_stage2=$(sed -n -e 's/^.*inst\.stage2=\(\S*\).*$/\1/p' /proc/cmdline)
if echo "${given_stage2}" | grep -q '^hd:' ; then
	# Detect use of NetInstall media
	if [ -d /run/install/repo/repodata ]; then
		# Note: we know that the local stage2 comes from a full DVD image (Packages repo included)
		cat <<- EOF > /tmp/full-installsource
		# Use the inserted optical media as in:
		cdrom
		# alternatively specify a NFS network share as in:
		# nfs --opts=nolock --server NfsFqdnServerName --dir /path/to/CentOS/base/dir/copied/from/DVD/media
		# or an HTTP/FTP area as in:
		#url --url https://dangerous.ovirt.life/hvp-repos/el7/os
		EOF
	else
		# Note: since we detected use of NetInstall media (no local repo) we use network install source from CentOS mirrors
		given_stage2="http://mirror.centos.org/centos/7/os/x86_64"
		cat <<- EOF > /tmp/full-installsource
		# Specify a NFS network share as in:
		# nfs --opts=nolock --server NfsFqdnServerName --dir /path/to/CentOS/base/dir/copied/from/DVD/media
		# or an HTTP/FTP area as in:
		url --url ${given_stage2}
		# alternatively use the inserted optical media as in:
		#cdrom
		EOF
	fi
else
	# Note: we assume that a remote stage2 has been copied together with the full media content preserving the default DVD structure
	# TODO: we assume a HTTP/FTP area - add support for NFS
	cat <<- EOF > /tmp/full-installsource
	# Specify a NFS network share as in:
	# nfs --opts=nolock --server NfsFqdnServerName --dir /path/to/CentOS/base/dir/copied/from/DVD/media
	# or an HTTP/FTP area as in:
	url --url ${given_stage2}
	# alternatively use the inserted optical media as in:
	#cdrom
	EOF
fi

# Determine configuration for DHCP and related services
# Note: enabling masquerading in firewalld if mgmt and external are separate networks
# Note: in.tftpd connections must be allowed with IPv4-in-IPv6 notation
allowed_addr="127.0.0.1"
allowed_4in6_addr="[::1] [::ffff:127.0.0.1/128]"
if [ -n "${nics['mgmt']}" ]; then
	mkdir -p /tmp/hvp-firewalld-conf
	cat <<- EOF > /tmp/hvp-firewalld-conf/rc.firewalld-setup
	#!/bin/bash
	EOF
	for zone in "${!network[@]}" ; do
		if [ "${zone}" != "external" ]; then
			cat <<- EOF >> /tmp/hvp-firewalld-conf/rc.firewalld-setup
			nmcli con mod ${nics[${zone}]} connection.zone internal
			# Note: we need to except local port 80 from transparent proxying
			firewall-cmd --permanent --direct --add-rule ipv4 nat PREROUTING 0 -p tcp -m tcp -d ${my_ip[${zone}]}/32 --dport 80 -j ACCEPT
			EOF
			allowed_addr="${allowed_addr} ${network[${zone}]}/${netmask[${zone}]}"
			unset PREFIX
			eval $(ipcalc -s -p "${network[${zone}]}" "${netmask[${zone}]}")
			allowed_4in6_addr="${allowed_4in6_addr} [::ffff:${network[${zone}]}/$((${PREFIX} + 96))]"
		fi
	done
	# TODO: it seems that masquerading is already enabled, maybe by having nics assigned to internal and external zones or because of libvirt virbr0 etc. - investigate
	# Note: if we are here we have a separate MGMT network and also an external one
	cat <<- EOF >> /tmp/hvp-firewalld-conf/rc.firewalld-setup
	firewall-cmd --zone=internal --permanent --add-forward-port=port=80:proto=tcp:toport=8080:toaddr=${my_ip['mgmt']}
	firewall-cmd --zone=internal --permanent --add-service=tproxy
	nmcli con mod ${nics['external']} connection.zone external
	firewall-cmd --zone=external --add-masquerade --permanent
	nmcli con reload
	firewall-cmd --reload
	EOF
else
	if [ "${network[${dhcp_zone}]}" != "dhcp" -a "${netmask[${dhcp_zone}]}" != "dhcp" ]; then
		allowed_addr="${allowed_addr} ${network[${dhcp_zone}]}/${netmask[${dhcp_zone}]}"
		unset PREFIX
		eval $(ipcalc -s -p "${network[${dhcp_zone}]}" "${netmask[${dhcp_zone}]}")
		allowed_4in6_addr="${allowed_4in6_addr} [::ffff:${network[${dhcp_zone}]}/$((${PREFIX} + 96))]"
	else
		echo "External DHCP not allowed for single network setup." 1>&2
	fi
fi
mkdir -p /tmp/hvp-tcp_wrappers-conf
cat << EOF > /tmp/hvp-tcp_wrappers-conf/hosts.allow
in.tftpd: ${allowed_4in6_addr}
ALL: ${allowed_addr}
sshd: ALL
EOF

# Define common network parameters to be added on PXE menu as kernel commandline parameters during installation
common_network_params=""
vm_network_params=""
essential_network_params=""
for zone in "${!network[@]}" ; do
	if [ "${zone}" != "external" ]; then
		unset PREFIX
		eval $(ipcalc -s -p "${network[${zone}]}" "${netmask[${zone}]}")
		# Correctly insert an empty bridge name
		if [ -z "${bridge_name[${zone}]}" ]; then
			zone_bridge_name="''"
		else
			zone_bridge_name="${bridge_name[${zone}]}"
		fi
		common_network_params="${common_network_params} hvp_${zone}=${network[${zone}]}/${PREFIX} hvp_${zone}_bondmode=${bondmode[${zone}]} hvp_${zone}_mtu=${mtu[${zone}]} hvp_${zone}_test_ip=${my_ip[${zone}]} hvp_${zone}_domainname=${domain_name[${zone}]} hvp_${zone}_bridge=${zone_bridge_name}"
		vm_network_params="${vm_network_params} hvp_${zone}=${network[${zone}]}/${PREFIX} hvp_${zone}_mtu=${mtu[${zone}]} hvp_${zone}_test_ip=${my_ip[${zone}]} hvp_${zone}_domainname=${domain_name[${zone}]}"
	fi
done

# Create simple standard menu
# Note: to force custom/fixed nic names add ifname=netN:AA:BB:CC:DD:EE:FF where netN is the desired nic name (ethN names are reserved and cannot be used) and AA:BB:CC:DD:EE:FF is the MAC address of the corresponding physical interface (beware: naming not honored for bond slaves)
# Note: to force legacy nic names (ethN) add biosdevname=0 net.ifnames=0
# Note: DHCP is assumed to be available on one and only one network (the mgmt one, which will be autodetected, albeit with a noticeable delay) otherwise the ip=nicname:dhcp option must be added, where nicname is the name of the network interface to be used for installation (eg: ens32)
# TODO: node PXE nic names can be manually gathered (eg: by booting with the rescue image)

mkdir -p /tmp/hvp-syslinux-conf
cat << EOF > /tmp/hvp-syslinux-conf/common.cfg
DEFAULT menu.c32
PROMPT 0
TIMEOUT 600
MENU TITLE --== Heretic oVirt Project PXE Menu ==--

# This allows you to exit the PXE stack and pass booting to the local system
LABEL bootlocal
	MENU DEFAULT
	MENU LABEL Local Boot
	localboot 0

# Load Memtest86+
LABEL memtest
	MENU LABEL RAM Test (Memtest86+)
	kernel memtest86+

# Load CentOS rescue image
LABEL rescue
        MENU LABEL CentOS rescue image
        kernel linux/centos/vmlinuz
        append initrd=linux/centos/initrd.img inst.stage2=http://${my_name}.${domain_name[${dhcp_zone}]}/hvp-repos/el7/centos ip=dhcp rescue

# Load guest virtual machines installation menu
LABEL vmmenu
	MENU LABEL Virtual Machines installation menu --->
	kernel menu.c32
	append vm.cfg

# Load HVP NGNs installation menu
LABEL ngnmenu
	MENU LABEL HVP NGNs installation menu --->
	kernel menu.c32
	append ngn.cfg

# Load HVP Hosts installation menu
LABEL hostmenu
	MENU LABEL HVP Hosts installation menu --->
	kernel menu.c32
	append host.cfg

EOF
# NGNs installation menu
cat << EOF > /tmp/hvp-syslinux-conf/ngn.cfg
MENU TITLE --== Heretic oVirt Project NGNs PXE Menu ==--

# Go back to the main menu
LABEL rootmenu
	MENU LABEL <---- Main menu
	kernel menu.c32
	append common.cfg

EOF
# Hosts installation menu
cat << EOF > /tmp/hvp-syslinux-conf/host.cfg
MENU TITLE --== Heretic oVirt Project Hosts PXE Menu ==--

# Go back to the main menu
LABEL rootmenu
	MENU LABEL <---- Main menu
	kernel menu.c32
	append common.cfg

EOF
# Note: we will automatically extend to further installations the parameters passed during our own installation
if [ "${orthodox_mode}" = "true" ] ; then
	common_network_params="${common_network_params} hvp_orthodox"
else
	cat <<- EOF >> /tmp/hvp-syslinux-conf/ngn.cfg
	# Note: to skip using custom Gluster-related/OVN packages add the option hvp_nicmacfix
	EOF
	cat <<- EOF >> /tmp/hvp-syslinux-conf/host.cfg
	# Note: to skip using custom Gluster-related/OVN packages add the option hvp_nicmacfix
	EOF
fi
if [ "${nicmacfix}" = "true" ] ; then
	common_network_params="${common_network_params} hvp_nicmacfix"
	# TODO: verify whether it actually makes sense to propagate nicmacfix to vms
	vm_network_params="${vm_network_params} hvp_nicmacfix"
else
	cat <<- EOF >> /tmp/hvp-syslinux-conf/ngn.cfg
	# Note: to force static nic name-to-MAC mapping add the option hvp_nicmacfix
	EOF
	cat <<- EOF >> /tmp/hvp-syslinux-conf/host.cfg
	# Note: to force static nic name-to-MAC mapping add the option hvp_nicmacfix
	EOF
fi
if grep 'biosdevname=0' /proc/cmdline | grep -q 'net.ifnames=0' ; then
	common_network_params="${common_network_params} biosdevname=0 net.ifnames=0"
	vm_network_params="${vm_network_params} biosdevname=0 net.ifnames=0"
	essential_network_params="${essential_network_params} biosdevname=0 net.ifnames=0"
else
	cat <<- EOF >> /tmp/hvp-syslinux-conf/ngn.cfg
	# Note: to force custom/fixed nic names add ifname=netN:AA:BB:CC:DD:EE:FF where netN is the desired nic name (legacy ethN names are reserved and cannot be used) and AA:BB:CC:DD:EE:FF is the MAC address of the corresponding physical interface (beware: naming not honored for bond slaves)
	# Note: alternatively, to force legacy nic names (ethN), add biosdevname=0 net.ifnames=0
	EOF
	cat <<- EOF >> /tmp/hvp-syslinux-conf/host.cfg
	# Note: to force custom/fixed nic names add ifname=netN:AA:BB:CC:DD:EE:FF where netN is the desired nic name (legacy ethN names are reserved and cannot be used) and AA:BB:CC:DD:EE:FF is the MAC address of the corresponding physical interface (beware: naming not honored for bond slaves)
	# Note: alternatively, to force legacy nic names (ethN), add biosdevname=0 net.ifnames=0
	EOF
fi
# Note: workaround for "too many boot env vars" kernel panic - minimizing the cmdline below removing all hvp_* parameters - creating common hvp_parameters.sh and specific hvp_parameters_*.sh with all other parameters (leaving a commented line as reference here)
# Note: the hvp_nodeid parameter could be removed too but then an hvp_parameters_hh:hh:hh:hh:hh:hh.sh file containing a different default should be created for each node
for (( i=0; i<${node_count}; i=i+1 )); do
	cat <<- EOF >> /tmp/hvp-syslinux-conf/ngn.cfg
	LABEL hvpngn${i}
	        MENU LABEL Install Heretic oVirt Project NGN ${i}
	        kernel linux/node/vmlinuz
	        # append initrd=linux/node/initrd.img inst.stage2=http://${my_name}.${domain_name[${dhcp_zone}]}/hvp-repos/el7/node quiet nomodeset elevator=deadline inst.ks=http://${my_name}.${domain_name[${dhcp_zone}]}/hvp-repos/el7/ks/heretic-ngn.ks hvp_rootpwd=${root_password} hvp_adminname=${admin_username} hvp_adminpwd=${admin_password} hvp_kblayout=${keyboard_layout} hvp_timezone=${local_timezone} hvp_nodeosdisk=${given_nodeosdisk} hvp_nodecount=${node_count} hvp_masternodeid=${master_index} hvp_nodeid=${i} hvp_nodename=${given_names} hvp_installername=${my_name} hvp_switchname=${switch_name} hvp_enginename=${engine_name} hvp_storagename=${storage_name} hvp_ad_subdomainname=${ad_subdomain_prefix} hvp_ad_dc=${ad_dc_ip} hvp_nameserver=${my_ip[${dhcp_zone}]} hvp_forwarders=${my_forwarders} hvp_gateway=${dhcp_gateway} hvp_switch=${switch_ip} hvp_engine=${engine_ip} hvp_bmcs_offset=${bmc_ip_offset} hvp_nodes_offset=${node_ip_offset} hvp_storage_offset=${storage_ip_offset} ${common_network_params}
	        append initrd=linux/node/initrd.img inst.stage2=http://${my_name}.${domain_name[${dhcp_zone}]}/hvp-repos/el7/node quiet nomodeset elevator=deadline inst.ks=http://${my_name}.${domain_name[${dhcp_zone}]}/hvp-repos/el7/ks/heretic-ngn.ks hvp_nodeid=${i} ${essential_network_params}
	
	EOF
	cat <<- EOF >> /tmp/hvp-syslinux-conf/host.cfg
	LABEL hvphost${i}
	        MENU LABEL Install Heretic oVirt Project Host ${i}
	        kernel linux/centos/vmlinuz
	        # append initrd=linux/centos/initrd.img inst.stage2=http://${my_name}.${domain_name[${dhcp_zone}]}/hvp-repos/el7/centos quiet nomodeset elevator=deadline inst.ks=http://${my_name}.${domain_name[${dhcp_zone}]}/hvp-repos/el7/ks/heretic-host.ks hvp_rootpwd=${root_password} hvp_adminname=${admin_username} hvp_adminpwd=${admin_password} hvp_kblayout=${keyboard_layout} hvp_timezone=${local_timezone} hvp_ovirt_version=${ovirt_version} hvp_nodeosdisk=${given_nodeosdisk} hvp_nodecount=${node_count} hvp_masternodeid=${master_index} hvp_nodeid=${i} hvp_nodename=${given_names} hvp_installername=${my_name} hvp_switchname=${switch_name} hvp_enginename=${engine_name} hvp_storagename=${storage_name} hvp_ad_subdomainname=${ad_subdomain_prefix} hvp_ad_dc=${ad_dc_ip} hvp_nameserver=${my_ip[${dhcp_zone}]} hvp_forwarders=${my_forwarders} hvp_gateway=${dhcp_gateway} hvp_switch=${switch_ip} hvp_engine=${engine_ip} hvp_bmcs_offset=${bmc_ip_offset} hvp_nodes_offset=${node_ip_offset} hvp_storage_offset=${storage_ip_offset} ${common_network_params}
	        append initrd=linux/centos/initrd.img inst.stage2=http://${my_name}.${domain_name[${dhcp_zone}]}/hvp-repos/el7/centos quiet nomodeset elevator=deadline inst.ks=http://${my_name}.${domain_name[${dhcp_zone}]}/hvp-repos/el7/ks/heretic-host.ks hvp_nodeid=${i} ${essential_network_params}
	
	EOF
done
# Guest virtual machines installation menu
cat << EOF > /tmp/hvp-syslinux-conf/vm.cfg
MENU TITLE --== Heretic oVirt Project Virtual Machines PXE Menu ==--

# Go back to the main menu
LABEL rootmenu
	MENU LABEL <---- Main menu
	kernel menu.c32
	append common.cfg


# Start kickstart-based HVP AD DC installation
LABEL installdc
        MENU LABEL Install Active Directory Domain Controller Server
        kernel linux/centos/vmlinuz
        # append initrd=linux/centos/initrd.img inst.stage2=http://${my_name}.${domain_name[${dhcp_zone}]}/hvp-repos/el7/centos quiet nomodeset elevator=deadline inst.ks=http://${my_name}.${domain_name[${dhcp_zone}]}/hvp-repos/el7/ks/hvp-dc-c7.ks hvp_rootpwd=${root_password} hvp_adminname=${admin_username} hvp_adminpwd=${admin_password} hvp_winadminname=${winadmin_username} hvp_winadminpwd=${winadmin_password} hvp_kblayout=${keyboard_layout} hvp_timezone=${local_timezone} hvp_ad_subdomainname=${ad_subdomain_prefix} hvp_netbiosdomain=${netbios_domain_name} hvp_sysvolpassword=${sysvolrepl_password} hvp_joindomain=false hvp_myname=${ad_dc_name} hvp_${ad_zone}_my_ip=${ad_dc_ip} hvp_nodecount=${node_count} hvp_storagename=${storage_name} hvp_nameserver=${my_ip[${dhcp_zone}]} hvp_forwarders=${my_forwarders} hvp_gateway=${dhcp_gateway} hvp_storage_offset=${storage_ip_offset} ${vm_network_params}
        append initrd=linux/centos/initrd.img inst.stage2=http://${my_name}.${domain_name[${dhcp_zone}]}/hvp-repos/el7/centos quiet nomodeset elevator=deadline inst.ks=http://${my_name}.${domain_name[${dhcp_zone}]}/hvp-repos/el7/ks/hvp-dc-c7.ks ${essential_network_params}

# Start kickstart-based HVP DB server installation
LABEL installdb
        MENU LABEL Install Database Server
        kernel linux/centos/vmlinuz
        # append initrd=linux/centos/initrd.img inst.stage2=http://${my_name}.${domain_name[${dhcp_zone}]}/hvp-repos/el7/centos quiet nomodeset elevator=deadline inst.ks=http://${my_name}.${domain_name[${dhcp_zone}]}/hvp-repos/el7/ks/hvp-db-c7.ks hvp_rootpwd=${root_password} hvp_adminname=${admin_username} hvp_adminpwd=${admin_password} hvp_winadminname=${winadmin_username} hvp_winadminpwd=${winadmin_password} hvp_kblayout=${keyboard_layout} hvp_timezone=${local_timezone} hvp_ad_subdomainname=${ad_subdomain_prefix} hvp_dbtype=${dbtype} hvp_dbversion=${dbversion} hvp_joindomain=true hvp_myname=${db_name} hvp_${ad_zone}_my_ip=${db_ip} hvp_nameserver=${ad_dc_ip} hvp_gateway=${dhcp_gateway} ${vm_network_params}
        append initrd=linux/centos/initrd.img inst.stage2=http://${my_name}.${domain_name[${dhcp_zone}]}/hvp-repos/el7/centos quiet nomodeset elevator=deadline inst.ks=http://${my_name}.${domain_name[${dhcp_zone}]}/hvp-repos/el7/ks/hvp-db-c7.ks ${essential_network_params}

# Start kickstart-based HVP Print server installation
LABEL installpr
        MENU LABEL Install Print Server
        kernel linux/centos/vmlinuz
        # append initrd=linux/centos/initrd.img inst.stage2=http://${my_name}.${domain_name[${dhcp_zone}]}/hvp-repos/el7/centos quiet nomodeset elevator=deadline inst.ks=http://${my_name}.${domain_name[${dhcp_zone}]}/hvp-repos/el7/ks/hvp-pr-c7.ks hvp_rootpwd=${root_password} hvp_adminname=${admin_username} hvp_adminpwd=${admin_password} hvp_winadminname=${winadmin_username} hvp_winadminpwd=${winadmin_password} hvp_kblayout=${keyboard_layout} hvp_timezone=${local_timezone} hvp_ad_subdomainname=${ad_subdomain_prefix} hvp_joindomain=true hvp_myname=${pr_name} hvp_${ad_zone}_my_ip=${pr_ip} hvp_nameserver=${ad_dc_ip} hvp_gateway=${dhcp_gateway} ${vm_network_params}
        append initrd=linux/centos/initrd.img inst.stage2=http://${my_name}.${domain_name[${dhcp_zone}]}/hvp-repos/el7/centos quiet nomodeset elevator=deadline inst.ks=http://${my_name}.${domain_name[${dhcp_zone}]}/hvp-repos/el7/ks/hvp-pr-c7.ks ${essential_network_params}

# Start kickstart-based HVP Remote Desktop server installation
LABEL installvd
        MENU LABEL Install Remote Desktop Server
        kernel linux/centos/vmlinuz
        # append initrd=linux/centos/initrd.img inst.stage2=http://${my_name}.${domain_name[${dhcp_zone}]}/hvp-repos/el7/centos quiet nomodeset elevator=deadline inst.ks=http://${my_name}.${domain_name[${dhcp_zone}]}/hvp-repos/el7/ks/hvp-vd-c7.ks hvp_rootpwd=${root_password} hvp_adminname=${admin_username} hvp_adminpwd=${admin_password} hvp_winadminname=${winadmin_username} hvp_winadminpwd=${winadmin_password} hvp_kblayout=${keyboard_layout} hvp_timezone=${local_timezone} hvp_ad_subdomainname=${ad_subdomain_prefix} hvp_detype=${detype} hvp_joindomain=true hvp_myname=${vd_name} hvp_${ad_zone}_my_ip=${vd_ip} hvp_nameserver=${ad_dc_ip} hvp_gateway=${dhcp_gateway} ${vm_network_params}
        append initrd=linux/centos/initrd.img inst.stage2=http://${my_name}.${domain_name[${dhcp_zone}]}/hvp-repos/el7/centos quiet nomodeset elevator=deadline inst.ks=http://${my_name}.${domain_name[${dhcp_zone}]}/hvp-repos/el7/ks/hvp-vd-c7.ks ${essential_network_params}

EOF
# Create common configuration parameters fragment
cat << EOF > /tmp/hvp-syslinux-conf/hvp_parameters.sh
# Custom defaults for all installations

nicmacfix="${nicmacfix}"

orthodox_mode="${orthodox_mode}"

default_node_count="${node_count}"

installer_name="${my_name}"

switch_name="${switch_name}"

engine_name="${engine_name}"

storage_name="${storage_name}"

storage_ip_offset="${storage_ip_offset}"

# Note: for the following values, either the IP or the offset is enough, but we will list here both as an example
switch_ip="${switch_ip}"
switch_ip_offset="$(ipdiff ${switch_ip} ${network[${dhcp_zone}]})"
engine_ip="${engine_ip}"
engine_ip_offset="$(ipdiff ${engine_ip} ${network[${dhcp_zone}]})"

test_ip_offset="$(ipdiff ${my_ip[${dhcp_zone}]} ${network[${dhcp_zone}]})"
EOF
for zone in "${!my_ip[@]}" ; do
	cat <<- EOF >> /tmp/hvp-syslinux-conf/hvp_parameters.sh
	test_ip['${zone}']="${my_ip[${zone}]}"
	EOF
done
cat << EOF >> /tmp/hvp-syslinux-conf/hvp_parameters.sh

# Note: network_base values are derived automatically anyway
EOF
for zone in "${!network[@]}" ; do
	if [ "${zone}" = "external" ]; then
		continue
	fi
	cat <<- EOF >> /tmp/hvp-syslinux-conf/hvp_parameters.sh
	network['${zone}']="${network[${zone}]}"
	netmask['${zone}']="${netmask[${zone}]}"
	mtu['${zone}']="${mtu[${zone}]}"
	EOF
done
cat << EOF >> /tmp/hvp-syslinux-conf/hvp_parameters.sh

# Note: reverse_domain_name values are derived automatically anyway
EOF
for zone in "${!network[@]}" ; do
	if [ "${zone}" = "external" ]; then
		continue
	fi
	cat <<- EOF >> /tmp/hvp-syslinux-conf/hvp_parameters.sh
	domain_name['${zone}']="${domain_name[${zone}]}"
	EOF
done
cat << EOF >> /tmp/hvp-syslinux-conf/hvp_parameters.sh

# TODO: verify bridge names for OVN networks
# TODO: verify bridge name different from "ovirtmgmt" for oVirt management
EOF
for zone in "${!network[@]}" ; do
	if [ "${zone}" = "external" ]; then
		continue
	fi
	cat <<- EOF >> /tmp/hvp-syslinux-conf/hvp_parameters.sh
	bridge_name['${zone}']="${bridge_name[${zone}]}"
	EOF
done
cat << EOF >> /tmp/hvp-syslinux-conf/hvp_parameters.sh

ad_subdomain_prefix="${ad_subdomain_prefix}"

my_nameserver="${my_ip[${dhcp_zone}]}"

my_forwarders="${my_forwarders}"

my_gateway="${dhcp_gateway}"

root_password='${root_password}'
admin_username="${admin_username}"
admin_password='${admin_password}'
keyboard_layout="${keyboard_layout}"
local_timezone="${local_timezone}"
EOF
# Create kickstart-specific configuration parameters fragments
cat << EOF > /tmp/hvp-syslinux-conf/hvp_parameters_heretic_ngn.sh
# Custom defaults for nodes installation

default_nodeosdisk="${given_nodeosdisk}"

master_index="${master_index}"

# Note: the following should be passed on kernel commandline or put only in a node-specific configuration parameters file (hvp_parameters_hh:hh:hh:hh:hh:hh.sh)
#default_node_index="0"

EOF
for ((i=0;i<${node_count};i=i+1)); do
	cat <<- EOF >> /tmp/hvp-syslinux-conf/hvp_parameters_heretic_ngn.sh
	node_name[${i}]="${node_name[${i}]}"
	EOF
done
cat << EOF >> /tmp/hvp-syslinux-conf/hvp_parameters_heretic_ngn.sh

EOF
for zone in "${!network[@]}" ; do
	if [ "${zone}" = "external" ]; then
		continue
	fi
	cat <<- EOF >> /tmp/hvp-syslinux-conf/hvp_parameters_heretic_ngn.sh
	bondopts['${zone}']="${bondopts[${zone}]}"
	EOF
done
cat << EOF >> /tmp/hvp-syslinux-conf/hvp_parameters_heretic_ngn.sh

bmc_ip_offset="${bmc_ip_offset}"
node_ip_offset="${node_ip_offset}"

ad_dc_ip="${ad_dc_ip}"
ad_dc_ip_offset="${ad_dc_ip_offset}"

ad_dc_name="${ad_dc_name}"

EOF

cat << EOF > /tmp/hvp-syslinux-conf/hvp_parameters_heretic_host.sh
# Custom defaults for hosts installation

ovirt_version="${ovirt_version}"

EOF

# TODO: add a custom logic to automatically check and shift offset and name for further DCs
cat << EOF > /tmp/hvp-syslinux-conf/hvp_parameters_dc.sh
# Custom defaults for AD DC installation

sysvolrepl_password="${sysvolrepl_password}"

my_ip_offset="${ad_dc_ip_offset}"

my_name="${ad_dc_name}"

my_forwarders="$(append="false"; for ((i=0;i<${node_count};i=i+1)); do if [ "${append}" = "true" ]; then echo -n ","; else append="true"; fi; echo -n "$(ipmat $(ipmat ${network[${dhcp_zone}]} ${node_ip_offset} +) ${i} +)"; done)"

# Note: when installing further AD DCs you must change the following option to true
domain_join="false"

if [ "\${domain_join}" = "true" ]; then
	my_nameserver="${ad_dc_ip}"
	my_ip_offset=$((${ad_dc_ip_offset} + 1))
	my_name="${ad_dc_name}bis"
fi

EOF

cat << EOF > /tmp/hvp-syslinux-conf/hvp_parameters_db.sh
# Custom defaults for DB server installation

my_ip_offset="${db_ip_offset}"

dbtype="${dbtype}"
dbversion="${dbversion}"

my_name="${db_name}"

domain_join="true"

if [ "\${domain_join}" = "true" ]; then
	my_nameserver="${ad_dc_ip}"
fi

EOF

cat << EOF > /tmp/hvp-syslinux-conf/hvp_parameters_pr.sh
# Custom defaults for print server installation

my_ip_offset="${pr_ip_offset}"

my_name="${pr_name}"

domain_join="true"

if [ "\${domain_join}" = "true" ]; then
	my_nameserver="${ad_dc_ip}"
fi

EOF

cat << EOF > /tmp/hvp-syslinux-conf/hvp_parameters_vd.sh
# Custom defaults for virtual desktop installation

my_ip_offset="${vd_ip_offset}"

detype="${detype}"

my_name="${vd_name}"

domain_join="true"

if [ "\${domain_join}" = "true" ]; then
	my_nameserver="${ad_dc_ip}"
fi

EOF

# Create bind configuration files (disable RFC1918 stub zones creation)
mkdir -p /tmp/hvp-bind-zones/dynamic
pushd /tmp/hvp-bind-zones/dynamic

zone="${dhcp_zone}"
cat << EOF > ${domain_name[${zone}]}.db
\$ORIGIN ${domain_name[${zone}]}.
\$TTL 15552000
@		IN	SOA	${my_name}.${domain_name[${zone}]}. root.${my_name}.${domain_name[${zone}]}. (
                         $(date '+%Y%m%d')01 ; serial
                         3600 ; refresh
                         900 ; retry
                         1209600 ; expire
                         43200 ; default_ttl
                         )
@			NS	${my_name}.${domain_name[${zone}]}.

; Names for static addresses assigned to our virtual/physical machines

${my_name}		A	${my_ip[${zone}]}
EOF
for ((i=0;i<${dhcp_count};i=i+1)); do
	cat <<- EOF >> ${domain_name[${zone}]}.db
	client${i}		A	$(ipmat $(ipmat ${network[${zone}]} ${dhcp_offset} +) ${i} +)
	EOF
done
# Add resolution for bmcs/nodes/engine/switch names
cat << EOF >> ${domain_name[${zone}]}.db
${switch_name}		A	${switch_ip}
${engine_name}		A	${engine_ip}

EOF
for ((i=0;i<${node_count};i=i+1)); do
	cat <<- EOF >> ${domain_name[${zone}]}.db
	${node_name[${i}]}bmc		A	$(ipmat $(ipmat ${network[${zone}]} ${bmc_ip_offset} +) ${i} +)
	EOF
done
for ((i=0;i<${node_count};i=i+1)); do
	cat <<- EOF >> ${domain_name[${zone}]}.db
	${node_name[${i}]}		A	$(ipmat $(ipmat ${network[${zone}]} ${node_ip_offset} +) ${i} +)
	EOF
done
cat << EOF > ${reverse_domain_name[${zone}]}.db
\$ORIGIN ${reverse_domain_name[${zone}]}.
\$TTL 15552000
@		IN	SOA	${my_name}.${domain_name[${zone}]}. root.${my_name}.${domain_name[${zone}]}. (
                         $(date '+%Y%m%d')01 ; serial
                         3600 ; refresh
                         900 ; retry
                         1209600 ; expire
                         43200 ; default_ttl
                         )
@		IN	NS	${my_name}.${domain_name[${zone}]}.

; Static addresses assigned to our virtual/physical machines

$(echo ${my_ip[${zone}]} | sed -e "s/^$(echo ${network_base[${zone}]} | sed -e 's/[.]/\\./g')[.]//")		IN	PTR	${my_name}.${domain_name[${zone}]}.

EOF
for ((i=0;i<${dhcp_count};i=i+1)); do
	cat <<- EOF >> ${reverse_domain_name[${zone}]}.db
	$(ipmat $(ipmat ${network[${zone}]} ${dhcp_offset} +) ${i} + | sed -e "s/^$(echo ${network_base[${zone}]} | sed -e 's/[.]/\\./g')[.]//")		IN	PTR	client${i}.${domain_name[${zone}]}.
	EOF
done
# Add reverse resolution for bmcs/nodes/engine/switch names
cat << EOF >> ${reverse_domain_name[${zone}]}.db

$(echo ${switch_ip} | sed -e "s/^$(echo ${network_base[${zone}]} | sed -e 's/[.]/\\./g')[.]//")		IN	PTR	${switch_name}.${domain_name[${zone}]}.
$(echo ${engine_ip} | sed -e "s/^$(echo ${network_base[${zone}]} | sed -e 's/[.]/\\./g')[.]//")		IN	PTR	${engine_name}.${domain_name[${zone}]}.

EOF
for ((i=0;i<${node_count};i=i+1)); do
	cat <<- EOF >> ${reverse_domain_name[${zone}]}.db
	$(ipmat $(ipmat ${network[${zone}]} ${bmc_ip_offset} +) ${i} + | sed -e "s/^$(echo ${network_base[${zone}]} | sed -e 's/[.]/\\./g')[.]//")		IN	PTR	${node_name[${i}]}bmc.${domain_name[${zone}]}.
	EOF
done
# Create the zone files for GLUSTER network if it is present
for ((i=0;i<${node_count};i=i+1)); do
	cat <<- EOF >> ${reverse_domain_name[${zone}]}.db
	$(ipmat $(ipmat ${network[${zone}]} ${node_ip_offset} +) ${i} + | sed -e "s/^$(echo ${network_base[${zone}]} | sed -e 's/[.]/\\./g')[.]//")		IN	PTR	${node_name[${i}]}.${domain_name[${zone}]}.
	EOF
done
# Create the zone files for GLUSTER network if it is present
# Note: GLUSTER network names resolution is needed for Ansible/gDeploy
if [ -n "${nics['gluster']}" ]; then
	cat <<- EOF > ${domain_name['gluster']}.db
	\$ORIGIN ${domain_name['gluster']}.
	\$TTL 15552000
	@		IN	SOA	${my_name}.${domain_name[${zone}]}. root.${my_name}.${domain_name[${zone}]}. (
	                         $(date '+%Y%m%d')01 ; serial
	                         3600 ; refresh
	                         900 ; retry
	                         1209600 ; expire
	                         43200 ; default_ttl
	                         )
	@			NS	${my_name}.${domain_name[${zone}]}.
	
	; Names for static addresses assigned to our virtual/physical machines
	
	${my_name}		A	${my_ip['gluster']}
	EOF
	for ((i=0;i<${node_count};i=i+1)); do
		cat <<- EOF >> ${domain_name['gluster']}.db
		${node_name[${i}]}		A	$(ipmat $(ipmat ${network['gluster']} ${node_ip_offset} +) ${i} +)
		EOF
	done
	cat <<- EOF > ${reverse_domain_name['gluster']}.db
	\$ORIGIN ${reverse_domain_name['gluster']}.
	\$TTL 15552000
	@		IN	SOA	${my_name}.${domain_name[${zone}]}. root.${my_name}.${domain_name[${zone}]}. (
	                         $(date '+%Y%m%d')01 ; serial
	                         3600 ; refresh
	                         900 ; retry
	                         1209600 ; expire
	                         43200 ; default_ttl
	                         )
	@		IN	NS	${my_name}.${domain_name[${zone}]}.
	
	; Static addresses assigned to our virtual/physical machines
	
	$(echo ${my_ip['gluster']} | sed -e "s/^$(echo ${network_base['gluster']} | sed -e 's/[.]/\\./g')[.]//")		IN	PTR	${my_name}.${domain_name['gluster']}.
	
	EOF
	for ((i=0;i<${node_count};i=i+1)); do
		cat <<- EOF >> ${reverse_domain_name['gluster']}.db
		$(ipmat $(ipmat ${network['gluster']} ${node_ip_offset} +) ${i} + | sed -e "s/^$(echo ${network_base['gluster']} | sed -e 's/[.]/\\./g')[.]//")		IN	PTR	${node_name[${i}]}.${domain_name['gluster']}.
		EOF
	done
fi

popd

# Use information gathered above to create bind configuration file
mkdir -p /tmp/hvp-bind-zones
pushd /tmp/hvp-bind-zones
my_role="master"
my_options="// allow-update { key ddns_key; };"
file_location="dynamic"
zone="${dhcp_zone}"
cat << EOF > named.conf
//
// Sample named.conf BIND DNS server 'named' configuration file
// for the Red Hat BIND distribution.
//
// See the BIND Administrator's Reference Manual (ARM) for details, in:
//   file:///usr/share/doc/bind-*/arm/Bv9ARM.html
//

options
{
        version none;
        /* make named use port 53 for the source of all queries, to allow
         * firewalls to block all ports except 53:
         */
        // query-source    port 53;
        // query-source-v6 port 53;

        // Put files that named is allowed to write in the data/ directory:
        directory		"/var/named"; // the default
        dump-file 		"data/cache_dump.db";
        statistics-file 	"data/named_stats.txt";
        memstatistics-file 	"data/named_mem_stats.txt";
        // querylog yes;

        notify no;
        forward first;
//      Our DNS servers
        forwarders {
EOF
for forwarder in $(echo "${my_forwarders}" | sed -e 's/,/ /g') ; do
	cat <<- EOF >> named.conf
	                ${forwarder};
	EOF
done
cat << EOF >> named.conf
        };
        interface-interval 0;
        auth-nxdomain no;
        listen-on port 53 {
                127.0.0.1;
EOF
for zone in "${!my_ip[@]}" ; do
	cat <<- EOF >> named.conf
	                ${my_ip[${zone}]};
	EOF
done
# TODO: disabling IPv6 DNS resolution - remove when smoothly working everywhere
cat << EOF >> named.conf
        };
        listen-on-v6 port 53 {
                none;
        };
        filter-aaaa-on-v4 yes;
};

controls {
        inet 127.0.0.1
                allow { localhost; } keys { "rndc_key"; };
};

logging 
{
/*      If you want to enable debugging, eg. using the 'rndc trace' command,
 *      named will try to write the 'named.run' file in the \$directory (/var/named).
 *      By default, SELinux policy does not allow named to modify the /var/named directory,
 *      so put the default debug log file in data/ :
 */
        channel default_debug {
                file "data/named.run";
                severity dynamic;
        };

/*
        channel querylog {
                file "data/querylog";
                severity debug 10;
                print-category yes;
                print-time yes;
                print-severity yes;
        };

        category queries { querylog; };
*/

};

// rndc key for control connections
include "/etc/rndc.key";

//
// All BIND 9 zones are in a "view", which allows different zones to be served
// to different types of client addresses, and for options to be set for groups
// of zones.
//
// By default, if named.conf contains no "view" clauses, all zones are in the 
// "default" view, which matches all clients.
// 
// If named.conf contains any "view" clause, then all zones MUST be in a view; 
// so it is recommended to start off using views to avoid having to restructure
// your configuration files in the future.
//

view "localhost_resolver"
{
/* This view sets up named to be a localhost resolver ( caching only nameserver ).
 * If all you want is a caching-only nameserver, then you need only define this view:
 */
        match-clients 		{ localhost; };
        match-destinations	{ localhost; };
        allow-query		{ localhost; };
        allow-recursion		{ localhost; };
        empty-zones-enable no;
        attach-cache global_cache;

        /* these are zones that contain definitions for all the localhost
         * names and addresses, as recommended in RFC1912 - these names should
         * ONLY be served to localhost clients:
         */
        include "/etc/named.rfc1912.zones";

        /*
        // DNSSEC root key
        include "/etc/named.root.key";
         */

        // All views must contain the root hints zone:
        zone "." IN {
                type hint;
                file "named.ca";
        };

        // These are your "authoritative" internal zones :

        zone "${domain_name[${zone}]}" { 
                type ${my_role};
                ${my_options}
                // put dynamically updateable zones in the dynamic/ directory so named can update them
                file "${file_location}/${domain_name[${zone}]}.db";
        };

        zone "${reverse_domain_name[${zone}]}" { 
                type ${my_role};
                ${my_options}
                // put dynamically updateable zones in the dynamic/ directory so named can update them
                file "${file_location}/${reverse_domain_name[${zone}]}.db";
        };

EOF
# Add the zone for GLUSTER network if it is present
# Note: GLUSTER network names resolution is needed for Ansible/gDeploy
if [ -n "${nics['gluster']}" ]; then
	cat <<- EOF >> named.conf
        zone "${domain_name['gluster']}" { 
                type ${my_role};
                ${my_options}
                // put dynamically updateable zones in the dynamic/ directory so named can update them
                file "${file_location}/${domain_name['gluster']}.db";
        };

        zone "${reverse_domain_name['gluster']}" { 
                type ${my_role};
                ${my_options}
                // put dynamically updateable zones in the dynamic/ directory so named can update them
                file "${file_location}/${reverse_domain_name['gluster']}.db";
        };

	EOF
fi
cat << EOF >> named.conf
};

view "internal"
{
/* This view will contain zones you want to serve only to "internal" clients
   that connect via your directly attached LAN interfaces - "localnets" .
 */
        match-clients		{ localnets; };
        match-destinations	{ localnets; };
        allow-query		{ localnets; };
        allow-recursion		{ localnets; };
        empty-zones-enable no;
        attach-cache global_cache;

        // include "named.rfc1912.zones";
        // you should not serve your rfc1912 names to non-localhost clients.

        // All views must contain the root hints zone:
        zone "." IN {
                type hint;
                file "named.ca";
        };

        // These are your "authoritative" internal zones, and would probably
        // also be included in the "localhost_resolver" view above :

        zone "${domain_name[${zone}]}" { 
                type ${my_role};
                ${my_options}
                // put dynamically updateable zones in the dynamic/ directory so named can update them
                file "${file_location}/${domain_name[${zone}]}.db";
        };

        zone "${reverse_domain_name[${zone}]}" { 
                type ${my_role};
                ${my_options}
                // put dynamically updateable zones in the dynamic/ directory so named can update them
                file "${file_location}/${reverse_domain_name[${zone}]}.db";
        };

EOF
# Add the zone for GLUSTER network if it is present
# Note: GLUSTER network names resolution is needed for Ansible/gDeploy
if [ -n "${nics['gluster']}" ]; then
	cat <<- EOF >> named.conf
        zone "${domain_name['gluster']}" { 
                type ${my_role};
                ${my_options}
                // put dynamically updateable zones in the dynamic/ directory so named can update them
                file "${file_location}/${domain_name['gluster']}.db";
        };

        zone "${reverse_domain_name['gluster']}" { 
                type ${my_role};
                ${my_options}
                // put dynamically updateable zones in the dynamic/ directory so named can update them
                file "${file_location}/${reverse_domain_name['gluster']}.db";
        };

	EOF
fi
cat << EOF >> named.conf
};

view "external"
{
/* This view will contain zones you want to serve only to "external" clients
 * that have addresses that are not on your directly attached LAN interface subnets:
 */
        match-clients		{ !localnets; !localhost; };
        match-destinations	{ !localnets; !localhost; };
        // you'd probably want to deny recursion to external clients, so you don't
        // end up providing free DNS service to all takers
        allow-query		{ !localnets; !localhost; };
        allow-recursion		{ none; };
        empty-zones-enable no;

        // All views must contain the root hints zone:
        zone "." IN {
                type hint;
                file "named.ca";
        };

        // These are your "authoritative" external zones, and would probably
        // contain entries for just your web and mail servers:
/*
        zone "my.external.zone" { 
                type master;
                file "my.external.zone.db";
        };
*/
};

EOF
popd

# Prepare hosts file to be copied later on below
mkdir -p /tmp/hvp-bind-zones
pushd /tmp/hvp-bind-zones
cat << EOF > hosts

# Static hostname
${my_ip[${dhcp_zone}]}		${my_name}.${domain_name[${dhcp_zone}]}
EOF
popd

# Prepare NetworkManager configuration fragment for external interface
# Note: the following basically helps identifying the external interface in post section below
mkdir -p /tmp/hvp-bind-zones
pushd /tmp/hvp-bind-zones
cat << EOF > "ifcfg-${nics['external']}"
PEERDNS="no"
DNS1="127.0.0.1"
EOF
popd

# Create DHCPd configuration
mkdir -p /tmp/hvp-dhcpd-conf
pushd /tmp/hvp-dhcpd-conf
cat << EOF > dhcpd.conf
ignore client-updates;
ddns-update-style none;
update-static-leases off;
ddns-updates off;
one-lease-per-client false;

# Directives to support PXE
allow booting;
allow bootp;

# Definition of PXE-specific options
# Note: defining/using any of the below options will make some firmwares explicitly ask for a PXE server on port 4011
# Note: avoiding here to use plain DHCP with PXELinux
# Code  1: Multicast IP address of bootfile
# Code  2: UDP port that client should monitor for MTFTP responses
# Code  3: UDP port that MTFTP servers are using to listen for MTFTP requests
# Code  4: Number of seconds a client must listen for activity before trying
#         to start a new MTFTP transfer
# Code  5: Number of seconds a client must listen before trying to restart
#         a MTFTP transfer
# Code  6: How to contact PXE servers: using unicast (7), multicast or broadcast
# Code  7: Multicast address to use when contacting PXE servers
# Code  8: List of PXE servers (when Code 6 is unicast), each identified by
#         identified by a number, a progressive index and its IP address
# Code  9: List of choices to prompt on the screen at boot time, each
#         identified by server type (Code 8 number), the length of the string
#         to display, and the string to display on screen
# Code 10: How long (in seconds) the boot menu should be displayed and the
#         text of a prompt that will be displayed during waiting time
#option space PXE;
#option PXE.mtftp-ip               code 1  = ip-address;
#option PXE.mtftp-cport            code 2  = unsigned integer 16;
#option PXE.mtftp-sport            code 3  = unsigned integer 16;
#option PXE.mtftp-tmout            code 4  = unsigned integer 8;
#option PXE.mtftp-delay            code 5  = unsigned integer 8;
#option PXE.discovery-control      code 6  = unsigned integer 8;
#option PXE.discovery-mcast-addr   code 7  = ip-address;
#option PXE.boot-server            code 8  = { unsigned integer 16,
#                                              unsigned integer 8,
#                                              ip-address };
#option PXE.boot-menu              code 9  = { unsigned integer 16,
#                                              unsigned integer 8,
#                                              text };
#option PXE.menu-prompt            code 10 = { unsigned integer 8,
#                                              text };

# Definition of PXELinux-specific options
option space pxelinux;
option pxelinux.magic      code 208 = string;
option pxelinux.configfile code 209 = text;
option pxelinux.pathprefix code 210 = text;
option pxelinux.reboottime code 211 = unsigned integer 32;

option arch code 93 = unsigned integer 16;

# Define a class to enable PXE
class "pxeclients" {
        match if substring (option vendor-class-identifier, 0, 9) = "PXEClient";

        # At least one of the vendor-specific options must be set in order
        # for the boot ROM on the client to recognize us as a PXE
        # compliant server. We set the MCAST IP address to 0.0.0.0 to tell
        # the boot ROM we can't provide multicast TFTP, so it will have to
        # use just plain ol' TFTP instead (address 0.0.0.0 is considered
        # as "no address").
#       vendor-option-space PXE;
#       option PXE.mtftp-ip 0.0.0.0;
#       option PXE.discovery-control 7;
#       option PXE.boot-server 15 1 ${node_lan_ip};
#       option PXE.boot-menu 15 14 "HVP";
#       option PXE.menu-prompt 0 "HVP";

# --- Options for dynamically appearing PXE nodes
        min-lease-time 300;
        default-lease-time 1800;
        max-lease-time 1800;
        next-server ${dhcp_gateway};
        # Note: option 60 switches PXE to use port 4011 - avoiding here
        option dhcp-parameter-request-list 66,43;
        option vendor-class-identifier "PXEClient";
        option tftp-server-name "${dhcp_gateway}";
        vendor-option-space pxelinux;
	if option arch = 00:00 {
		filename "pxelinux.0";
		option pxelinux.configfile "bios.cfg";
	} else if option arch = 00:06 {
		filename "bootia32.efi";
		option pxelinux.configfile "efi32.cfg";
	} else if option arch = 00:07 {
		filename "bootx64.efi";
		option pxelinux.configfile "efi64.cfg";
	} else if option arch = 00:09 {
		filename "bootx64.efi";
		option pxelinux.configfile "efi64.cfg";
	}
#
# --- Workarounds for broken PXE implementations using Etherboot ROMs
        include "/etc/dhcp/dhcpd-broken-pxe.conf";
}

# A subnet declaration for our LAN
subnet ${network[${dhcp_zone}]} netmask ${netmask[${dhcp_zone}]} {
        authoritative;
        interface ${nics[${dhcp_zone}]};
        allow unknown-clients;

# --- default gateway
        option routers			${dhcp_gateway};
        option subnet-mask		${netmask[${dhcp_zone}]};

        option domain-name		"${domain_name[${dhcp_zone}]}";
        option domain-name-servers	${my_ip[${dhcp_zone}]};
        option ntp-servers		${my_ip[${dhcp_zone}]};
        option time-offset		3600;	# Central European Time

        option ip-forwarding		off;

# --- Settings for our internal clients
        default-lease-time 50400;
        max-lease-time 50400;
#       use-host-decl-names on;
#       get-lease-hostnames true;

        pool {
                range dynamic-bootp $(ipmat ${network[${dhcp_zone}]} ${dhcp_offset} +) $(ipmat $(ipmat $(ipmat ${network[${dhcp_zone}]} ${dhcp_offset} +) ${dhcp_count} +) 1 -);
        }
}

#
# --- Reservations
include "/etc/dhcp/dhcpd-static-leases.conf";

EOF

# Prepare Apache VirtualHost configuration fragment
cat << EOF > httpd.conf

<VirtualHost *:80>
    DocumentRoot /var/www/html
    ServerName ${my_ip[${dhcp_zone}]}
    ServerAlias ${my_name}.${domain_name[${dhcp_zone}]}
</VirtualHost>

EOF

popd

# Prepare Ansible variable definition files to be copied later on below
# Note: the actual zone to access nodes/engine will be the one offering our DHCP
# Note: the host listed last in glusternodes group will become the arbiter one in 3 node setups
# Note: defining all host(s) combinations as groups here since only external variables are available in playbook headers
mkdir -p /tmp/hvp-ansible-files
pushd /tmp/hvp-ansible-files
cat << EOF > hosts
# This is the default ansible 'hosts' file.
#
# It should live in /etc/ansible/hosts
#
#   - Comments begin with the '#' character
#   - Blank lines are ignored
#   - Groups of hosts are delimited by [header] elements
#   - You can enter hostnames or ip addresses
#   - A hostname/ip can be a member of multiple groups

# Our oVirt Nodes
[ovirtnodes]
EOF
for ((i=0;i<${node_count};i=i+1)); do
	cat <<- EOF >> hosts
	${node_name[${i}]}.${domain_name[${dhcp_zone}]}
	EOF
done
cat << EOF >> hosts

# Our non-master oVirt Nodes
[ovirt_nonmaster_nodes]
EOF
for ((i=0;i<${node_count};i=i+1)); do
	if [ ${i} -eq ${master_index} ]; then
		continue
	fi
	cat <<- EOF >> hosts
	${node_name[${i}]}.${domain_name[${dhcp_zone}]}
	EOF
done
cat << EOF >> hosts

# Our oVirt cluster master
[ovirt_master]
${node_name[${master_index}]}.${domain_name[${dhcp_zone}]}

# Our oVirt Nodes BMCs
[ovirtbmcs]
EOF
for ((i=0;i<${node_count};i=i+1)); do
	cat <<- EOF >> hosts
	${node_name[${i}]}bmc.${domain_name[${dhcp_zone}]}
	EOF
done
cat << EOF >> hosts

# Our oVirt Engine
[ovirtengine]
${engine_name}.${domain_name[${dhcp_zone}]}

# Our GlusterFS Nodes
[glusternodes]
EOF
if [ -n "${nics['gluster']}" ]; then
	zone="gluster"
else
	zone="${dhcp_zone}"
fi
for ((i=0;i<${node_count};i=i+1)); do
	cat <<- EOF >> hosts
	${node_name[${i}]}.${domain_name[${zone}]}
	EOF
done
cat << EOF >> hosts

# Our non-master GlusterFS Nodes
[gluster_nonmaster_nodes]
EOF
for ((i=0;i<${node_count};i=i+1)); do
	if [ ${i} -eq ${master_index} ]; then
		continue
	fi
	cat <<- EOF >> hosts
	${node_name[${i}]}.${domain_name[${zone}]}
	EOF
done
cat << EOF >> hosts

# Our Gluster trusted pool master
[gluster_master]
${node_name[${master_index}]}.${domain_name[${zone}]}

EOF

# Prepare Ansible SSH access passwords
mkdir -p group_vars
for group in glusternodes ovirtnodes ovirtengine; do
	cat <<- EOF > group_vars/${group}
	ansible_ssh_pass: ${root_password}
	EOF
done

# Prepare oVirt defaults
# Note: Ansible oVirt variable definitions thanks to Simone Tiraboschi
unset PREFIX
eval $(ipcalc -s -p "${network[${dhcp_zone}]}" "${netmask[${dhcp_zone}]}")
if [ -n "${bmc_type}" -a "${bmc_confirmed}" = "true" ]; then
	bmc_vars_comment=''
else
	bmc_vars_comment='#'
fi
cat << EOF > hvp.yaml
# Global variables for HVP Ansible playbooks

# HVP local conventions
hvp_management_domainname: ${domain_name[${dhcp_zone}]}
hvp_gluster_domainname: ${domain_name[${gluster_zone}]}
hvp_storage_name: ${storage_name}
hvp_orthodox_mode:  $(echo "${orthodox_mode}" | sed -e 's/\b./\u\0/g')
hvp_master_node: "{{ groups['ovirt_master'][0] }}"
# TODO: dynamically determine proper values for Engine RAM/CPUs/imgsize
hvp_engine_ram: 4096
hvp_engine_cpus: 2
hvp_engine_imgsize: 80
hvp_engine_setup_timeout: 7200
hvp_engine_name: ${engine_name}
hvp_engine_domainname: "{{ hvp_management_domainname }}"
hvp_engine_ip: "{{ lookup('dig', hvp_engine_name + '.' + hvp_engine_domainname + '.') }}"
hvp_engine_netprefix: ${PREFIX}
# TODO: derive the following by means of Ansible DNS lookup on ovirtnodes names
hvp_engine_dnslist: $(append="false"; for ((i=0;i<${node_count};i=i+1)); do if [ "${append}" = "true" ]; then echo -n ","; else append="true"; fi; echo -n "$(ipmat $(ipmat ${network[${dhcp_zone}]} ${node_ip_offset} +) ${i} +)"; done)
# Note: generally, we try to use an independent pingable IP (central managed switch console interface) as "gateway" for oVirt setup
# Note: we do not expect a virtualized setup to have an independent pingable IP apart from the default gateway
hvp_switch_ip: "{% if hostvars[hvp_master_node]['ansible_virtualization_role'] == 'guest' %} ${dhcp_gateway} {% else %} ${switch_ip} {% endif %}"
# Note: generally, we keep a distinct proper gateway address on the management network only for network routing configuration
hvp_gateway_ip: ${dhcp_gateway}
hvp_timezone: ${local_timezone}
hvp_mgmt_bridge_name: ${bridge_name[${dhcp_zone}]}
hvp_firewall_manager: "firewalld"
hvp_spice_pki_subject: "C=EN, L=Test, O=Test, CN=Test"
hvp_pki_subject: "/C=EN/L=Test/O=Test/CN=Test"
hvp_ca_subject: "/C=EN/L=Test/O=Test/CN=TestCA"
hvp_admin_username: ${admin_username}

# HVP Gluster settings
# TODO: derive proper values for Gluster volume sizes from user settings and/or available space
# TODO: dynamically determine arbiter sizes for each Gluster volume
hvp_enginedomain_volume_name: enginedomain
hvp_enginedomain_size: "{{ (hvp_engine_imgsize * 1.2) | int | abs }}GB"
hvp_enginedomain_arbitersize: "1GB"
hvp_vmstoredomain_volume_name: vmstoredomain
hvp_vmstoredomain_size: "500GB"
hvp_vmstoredomain_arbitersize: "1GB"
hvp_isodomain_volume_name: isodomain
hvp_isodomain_size: "30GB"
hvp_isodomain_arbitersize: "1GB"
hvp_ctdb_volume_name: ctdb
hvp_ctdb_size: "1GB"
hvp_winshare_volume_name: winshare
hvp_winshare_size: "1024GB"
hvp_winshare_arbitersize: "10GB"
hvp_unixshare_volume_name: unixshare
hvp_unixshare_size: "1024GB"
hvp_unixshare_arbitersize: "10GB"
hvp_blockshare_volume_name: blockshare
hvp_blockshare_size: "1024GB"
hvp_blockshare_arbitersize: "10GB"
hvp_backup_volume_name: backup
hvp_backup_size: "1024GB"
hvp_backup_arbitersize: "10GB"
hvp_thinpool_chunksize: "1536k"

# HVP Gluster-block settings
# TODO: derive proper values for Gluster-block LUN sizes from user settings and/or available space
hvp_lun_sizes:
  - 200GiB
  - 300GiB
  - 450GiB

# Engine credentials:
url: "https://{{ hvp_engine_name }}.{{ hvp_engine_domainname }}/ovirt-engine/api"
username: admin@internal
password: ${root_password}
ca_file: /etc/pki/ovirt-engine/ca.pem

# Hosts credentials:
# TODO: add support for BMC options
host_password: ${root_password}
${bmc_vars_comment}host_bmc_type: ${bmc_type}
${bmc_vars_comment}#host_bmc_options: []
${bmc_vars_comment}host_bmc_user: ${bmc_username}
${bmc_vars_comment}host_bmc_password: ${bmc_password}

# Env:
## Datacenter:
# TODO: forcing default name since any personalization does not get into appliance cloudinit and causes mismatch - open Bugzilla ticket and revert
hvp_dc_name: ${datacenter_name}
dc_name: "Default"
# TODO: verify whether "master" is a valid compatibility_version - replace otherwise
compatibility_version: ${ovirt_version}

## Cluster:
# TODO: forcing default name since any personalization does not get into appliance cloudinit and causes mismatch - open Bugzilla ticket and revert
hvp_cluster_name: ${cluster_name}
cluster_name: "Default"

## Storage
# Note: ISO domain will be of type NFS while all others will be of type GlusterFS
# Note: Engine vm has no access to Gluster network, so for ISO domain we must resort to NFS on management network (Engine must access it for image upload)
glusterfs_addr: "{{ groups['gluster_master'] | first }}"
glusterfs_mountopts: "backup-volfile-servers={{ groups['gluster_nonmaster_nodes'] | join(':') }},fetch-attempts=2,log-level=WARNING"
iso_sd_type: nfs
iso_sd_addr: "{{ hvp_storage_name }}.{{ hvp_management_domainname }}"
iso_sd_name: iso_domain
iso_sd_path: "/{{ hvp_isodomain_volume_name }}"
iso_sd_mountopts: 
vmstore_sd_type: glusterfs
vmstore_sd_addr: "{{ glusterfs_addr }}"
vmstore_sd_name: vmstore_domain
vmstore_sd_path: "/{{ hvp_vmstoredomain_volume_name }}"
vmstore_sd_mountopts: "{{ glusterfs_mountopts }}"
engine_sd_type: glusterfs
engine_sd_addr: "{{ glusterfs_addr }}"
engine_sd_name: engine_domain
engine_sd_path: "/{{ hvp_enginedomain_volume_name }}"
engine_sd_mountopts: "{{ glusterfs_mountopts }}"

## Networking
got_gluster_network: $(echo "${gluster_network}" | sed -e 's/\b./\u\0/g')
$(if [ -n "${nics['gluster']}" ]; then unset PREFIX ; eval $(ipcalc -s -p "${network['gluster']}" "${netmask['gluster']}"); echo "gluster_network: ${network['gluster']}/${PREFIX}" , fi)

got_lan_network: $(echo "${lan_network}" | sed -e 's/\b./\u\0/g')
$(if [ -n "${nics['lan']}" ]; then unset PREFIX ; eval $(ipcalc -s -p "${network['lan']}" "${netmask['lan']}"); echo "lan_network: ${network['lan']}/${PREFIX}" , fi)

got_internal_network: $(echo "${internal_network}" | sed -e 's/\b./\u\0/g')
$(if [ -n "${nics['internal']}" ]; then unset PREFIX ; eval $(ipcalc -s -p "${network['internal']}" "${netmask['internal']}"); echo "internal_network: ${network['internal']}/${PREFIX}" , fi)

EOF

# Prepare Active Directory defaults
cat << EOF > ad.yaml
# AD-related variables for HVP Ansible playbooks

hvp_adjoin_realm: ${realm_name}
hvp_adjoin_username: ${winadmin_username}
hvp_adjoin_password: ${winadmin_password}
hvp_netbios_domainname: ${netbios_domain_name}
hvp_netbios_storagename: ${netbios_storage_name}
hvp_ad_range: 9999-1999999999
hvp_autorid_range: 2000000000-3999999999
hvp_autorid_rangesize: 1000000
EOF

popd

) 2>&1 | tee /tmp/kickstart_pre.log
%end

# Post-installation script (run with bash from installation image at the end of installation)
# Note: console logging to support commandline virt-install invocation
%post --nochroot --log /dev/console
( # Run the entire post section as a subshell for logging purposes.

# Copy configuration parameters files (generated in pre section above) into installed system (to be loaded during chrooted post section below)
mkdir -p ${ANA_INSTALL_PATH}/root/etc/kscfg-pre
for custom_frag in /tmp/kscfg-pre/*.sh ; do
	if [ -f "${custom_frag}" ]; then
		cp "${custom_frag}" ${ANA_INSTALL_PATH}/root/etc/kscfg-pre/
	fi
done

) 2>&1 | tee /tmp/kickstart_post_0.log
%end

# Post-installation script (run with bash from chroot after the first post section)
# Note: console logging to support commandline virt-install invocation
%post --log /dev/console
( # Run the entire post section as a subshell for logging purposes.

script_version="2018032802"

# Report kickstart version for reference purposes
logger -s -p "local7.info" -t "kickstart-post" "Kickstarting for $(cat /etc/system-release) - version ${script_version}"
# Report kernel commandline for reference purposes
logger -s -p "local7.info" -t "kickstart-post" "Kickstarting with kernel commandline: $(cat /proc/cmdline)"

# Note: NetworkManager correctly updates /etc/resolv.conf inside the installation root even when in DHCP mode

# Note: no need to explicitly set machine time with newer systemd/chrony installation environment

# Force sane language defaults for safe command output parsing
export LANG=C LC_ALL=C

# Set the hostname for apps that need it
# Note: hostnamectl would not work inside the installation chroot
export HOSTNAME=$(cat /etc/hostname)
hostname ${HOSTNAME}

# Set the homedir for apps that need it
export HOME="/root"

# Discover exact post-stage environment
echo "POST env" >> /tmp/post.out
env >> /tmp/post.out
echo "POST devs" >> /tmp/post.out
ls -l /dev/* >> /tmp/post.out
echo "POST block" >> /tmp/post.out
ls -l /sys/block/* >> /tmp/post.out
echo "POST mounts" >> /tmp/post.out
df -h >> /tmp/post.out
echo "POST progs" >> /tmp/post.out
for pathdir in $(echo "${PATH}" | sed -e 's/:/ /'); do
	if [ -d "${pathdir}" ]; then
		ls "${pathdir}"/* >> /tmp/post.out
	fi
done
echo "POST resolv.conf" >> /tmp/post.out
cat /etc/resolv.conf >> /tmp/post.out
echo "POST hosts" >> /tmp/post.out
cat /etc/hosts >> /tmp/post.out

# Define associative arrays
declare -A node_name
declare -A network netmask network_base bondmode bondopts mtu
declare -A domain_name
declare -A reverse_domain_name
declare -A bridge_name

# Hardcoded defaults

unset nicmacfix
unset orthodox_mode
unset nolocalvirt
unset ovirt_version

nicmacfix="false"
orthodox_mode="false"
nolocalvirt="false"
ovirt_version="4.1"

# Load configuration parameters files (generated in pre section above)
ks_custom_frags="hvp_parameters.sh hvp_parameters_heresiarch.sh hvp_parameters_*:*.sh"
pushd /root/etc/kscfg-pre
for custom_frag in ${ks_custom_frags} ; do
	if [ -f "${custom_frag}" ]; then
		# Perform a configuration fragment sanity check before loading
		bash -n "${custom_frag}" > /dev/null 2>&1
		res=$?
		if [ ${res} -ne 0 ]; then
			# Report invalid configuration fragment and skip it
			logger -s -p "local7.err" -t "kickstart-post" "Skipping invalid remote configuration fragment ${custom_frag}"
			continue
		fi
		source "./${custom_frag}"
	fi
done
popd

# Determine choice of nic MAC fixed assignment
if grep -w -q 'hvp_nicmacfix' /proc/cmdline ; then
	nicmacfix="true"
fi

# Determine choice of skipping custom packages intallation
if grep -w -q 'hvp_orthodox' /proc/cmdline ; then
	orthodox_mode="true"
fi

# Determine choice of skipping local virtualization support
if grep -w -q 'hvp_novirt' /proc/cmdline ; then
	nolocalvirt="true"
fi
if ! egrep -q '^flags.*(vmx|svm)' /proc/cpuinfo ; then
	nolocalvirt="true"
fi

# Determine oVirt version
given_ovirt_version=$(sed -n -e "s/^.*hvp_ovirt_version=\\(\\S*\\).*\$/\\1/p" /proc/cmdline)
if [ -n "${given_ovirt_version}" ]; then
	ovirt_version="${given_ovirt_version}"
fi

# Create /dev/root symlink for grubby (must differentiate for use of LVM or MD based "/")
# TODO: Open a Bugzilla notification
# TODO: remove when grubby gets fixed
mp=$(grep -w "/" /etc/fstab | sed -e 's/ .*//')
if echo "$mp" | grep -q "^UUID="
then
    uuid=$(echo "$mp" |sed 's/UUID=//')
    rootdisk=$(blkid -U $uuid)
elif echo "$mp" | grep -q "^/dev/"
then
    rootdisk=$mp
fi
ln -sf $rootdisk /dev/root

# Correctly initialize YUM cache to avoid 404 errors
# Note: following advice in https://access.redhat.com/articles/1320623
# TODO: remove when fixed upstream
rm -rf /var/cache/yum/*
yum --enablerepo '*' clean all

# Add YUM priorities plugin
yum -y install yum-plugin-priorities

# Add support for CentOS CR repository (to allow up-to-date upgrade later)
yum-config-manager --enable cr > /dev/null

# Add HVP custom repo
yum -y --nogpgcheck install https://dangerous.ovirt.life/hvp-repos/el7/hvp/x86_64/hvp-release-7-2.noarch.rpm
# If not explicitly denied, make sure that we prefer HVP own RHGS/OVN rebuild repos versus oVirt-dependency repos
# Note: if explicitly denied, HVP RHGS rebuild must not be enabled anyway on this external support machine (no special software requirements atm)
if [ "${orthodox_mode}" = "false" ]; then
	yum-config-manager --enable hvp-rhgs-rebuild > /dev/null
	yum-config-manager --save --setopt='hvp-rhgs-rebuild.priority=50' > /dev/null
	yum-config-manager --enable hvp-openvswitch-rebuild > /dev/null
	yum-config-manager --save --setopt='hvp-openvswitch-rebuild.priority=50' > /dev/null
fi

# Add upstream repository definitions
yum -y install http://packages.psychotic.ninja/6/base/i386/RPMS/psychotic-release-1.0.0-1.el6.psychotic.noarch.rpm
yum-config-manager --save --setopt='psychotic.include=unrar*' > /dev/null
yum-config-manager --enable psychotic > /dev/null
yum -y install epel-release
yum -y install http://www.elrepo.org/elrepo-release-7.0-3.el7.elrepo.noarch.rpm
ovirt_release_package_suffix=$(echo "${ovirt_version}" | sed -e 's/[.]//g')
if [ "${ovirt_release_package_suffix}" = "master" ]; then
	ovirt_release_package_suffix="-master"
fi
yum -y install http://resources.ovirt.org/pub/yum-repo/ovirt-release${ovirt_release_package_suffix}.rpm

# Enable use of delta rpms since we are not using our local mirror
yum-config-manager --save --setopt='deltarpm=1' > /dev/null

# Update OS (with "upgrade" to allow package obsoletion) non-interactively ("-y" yum option)
yum -y upgrade

# TODO: Make sure that the latest installed kernel is the default
# TODO: Kernel upgrade in kickstart post phase does not seem to set the latest installed kernel as boot default
# TODO: Open a Bugzilla notification
# TODO: Remove when fixed upstream
# TODO: the following works only with re-instated CentOS6 fix above
grubby --set-default=/boot/vmlinuz-$(rpm -q --last kernel | head -1 | cut -f 1 -d ' ' | sed -e 's/kernel-//')

# Install socat to allow IPMI tunneling through SSH towards our private management network
yum -y install socat

# Install HAVEGEd
# Note: even in presence of an actual/virtualized hardware random number generator (managed by rngd) we install haveged as a safety measure
yum -y install haveged

# Install YUM-cron, YUM-plugin-ps, Gdisk, PWGen, HPing, 7Zip, UnRAR and ARJ
yum -y install hping3 p7zip{,-{gui,plugins}} unrar arj pwgen
yum -y install yum-cron yum-plugin-ps gdisk

# Install Nmon and Dstat
yum -y install nmon dstat

# Install Apache
yum -y install httpd mod_ssl

# Install Webalizer and MRTG
yum -y install webalizer mrtg net-snmp net-snmp-utils

# Install DHCPd, TFTPd, Syslinux and Bind to support PXE
# Note: using HVP Fedora-rebuild repo to get a newer (6.x) Syslinux
yum -y --enablerepo hvp-fedora-rebuild install dhcp tftp tftp-server syslinux syslinux-efi64 syslinux-tftpboot syslinux-extlinux bind

# Install Ansible and gDeploy
yum -y install ansible gdeploy ovirt-engine-sdk-python python2-jmespath python-netaddr python-dns python-psycopg2 ovirt-ansible-roles NetworkManager-glib

# Install HVP Ansible support files
yum -y install hvp-ansible

# Install Memtest86+ to be also offered through PXE
yum -y install memtest86+

# Install Squid
yum -y install squid

# Install X2Go
yum -y install x2goserver x2goserver-xsession x2godesktopsharing
yum -y install x2goclient pyhoca-{cli,gui}

# Install PDSH
yum -y install pdsh pdsh-rcmd-ssh

# Install Midnight Commander
yum -y install mc

# Install Ncurses devel (for kernel "make menuconfig" support)
yum -y install ncurses-devel

# Install Java browser and Virt-Viewer support
yum -y install icedtea-web virt-viewer

# Install graphical bootsplash theme
yum -y install plymouth-theme-charge

# Install virtualization tools support packages
if dmidecode -s system-manufacturer | egrep -q "(innotek|Parallels)" ; then
	# Install dkms for virtualization tools support
	# TODO: configure virtualization tools under dkms
	yum -y install dkms
elif dmidecode -s system-manufacturer | grep -q "Red.*Hat" ; then
	yum -y install qemu-guest-agent
elif dmidecode -s system-manufacturer | grep -q "oVirt" ; then
	yum -y install ovirt-guest-agent
elif dmidecode -s system-manufacturer | grep -q "Microsoft" ; then
	yum -y install hyperv-daemons
elif dmidecode -s system-manufacturer | grep -q "VMware" ; then
	# Note: VMware basic support installed here (since it is included in base distro now)
	yum -y install open-vm-tools open-vm-tools-desktop fuse
fi

# Tune package list to underlying platform
if dmidecode -s system-manufacturer | egrep -q "(Microsoft|VMware|innotek|Parallels|Red.*Hat|oVirt|Xen)" ; then
	# Exclude CPU microcode updates to avoid errors on virtualized platform
	yum -y erase microcode_ctl
else
	# Install MCE logging/management service
	yum -y install mcelog
fi

# Add virtualization support on suitable platforms
if [ "${nolocalvirt}" != "true" ]; then
	# Add support for Qemu EV version from CentOS Virt SIG repo
	yum -y install centos-release-qemu-ev
	# Install packages
	yum -y install qemu-kvm qemu-img virt-manager libvirt libvirt-python libvirt-client virt-install virt-viewer virt-top libguestfs numpy virtio-win OVMF
	# Explicitly add package requirements to allow NGN development as per https://gerrit.ovirt.org/gitweb?p=ovirt-node-ng.git;a=blob;f=README
	yum -y install lorax libvirt libvirt-daemon-kvm virt-install libguestfs-tools
	# Perform a further upgrade to align with Qemu EV repo packages
	yum -y upgrade
	# Install Kimchi libvirt web management interface
	# TODO: find a way to define a repo (missing upstream) for the following packages (to be able to update them regularly)
	# TODO: find out why Kimchi comes up empty and unusable and correct
	yum -y install https://github.com/kimchi-project/kimchi/releases/download/2.5.0/wok-2.5.0-0.el7.centos.noarch.rpm https://github.com/kimchi-project/kimchi/releases/download/2.5.0/kimchi-2.5.0-0.el7.centos.noarch.rpm
else
	# Alternatively install Webmin for generic web management
	# Add Webmin repo
	cat <<- EOF > /etc/yum.repos.d/webmin.repo
	[webmin]
	name = Webmin Distribution Neutral
	baseurl = http://download.webmin.com/download/yum
	gpgcheck = 1
	enabled = 1
	gpgkey = http://www.webmin.com/jcameron-key.asc
	skip_if_unavailable = 1
	EOF
	chmod 644 /etc/yum.repos.d/webmin.repo
	yum -y install webmin
fi

# Clean up after all installations
yum --enablerepo '*' clean all

# Remove package update leftovers
find /etc -type f -name '*.rpmnew' -exec rename .rpmnew "" '{}' ';'
find /etc -type f -name '*.rpmsave' -exec rm -f '{}' ';'

# Now configure the base OS

# Setup auto-update via yum-cron (ala CentOS4, replacement for yum-updatesd in CentOS5)
# Note: Enable updates but leave to the user/administrator the final authority on download and installation
sed -i -e 's/^update_messages\s.*$/update_messages = yes/' -e 's/^download_updates\s.*$/download_updates = no/' -e 's/^apply_updates\s.*$/apply_updates = no/' -e 's/^emit_via\s.*$/emit_via = None/' /etc/yum/yum-cron*.conf
systemctl enable yum-cron

# Limit retained old kernels to 3 (as in CentOS5 default)
yum-config-manager --save --setopt='installonly_limit=3' > /dev/null

# Autodetecting BIOS/UEFI
# Note: the following identifies the symlink under /etc to abstract from BIOS/UEFI actual file placement
if [ -d /sys/firmware/efi ]; then
	grub2_cfg_file="/etc/grub2-efi.cfg"
else
	grub2_cfg_file="/etc/grub2.cfg"
fi

# Configure GRUB2 boot loader (force a well-known graphical mode, be silent and do not wait for manual override, set graphical Plymouth theme)
sed -i -e 's/^GRUB_TIMEOUT=.*$/GRUB_TIMEOUT="0"\nGRUB_HIDDEN_TIMEOUT="3"\nGRUB_HIDDEN_TIMEOUT_QUIET="true"/' /etc/default/grub
plymouth-set-default-theme -R charge
# TODO: we must manually rebuild the initramfs due to a known plymouth bug (https://bugzilla.redhat.com/show_bug.cgi?id=891039) - remove when fixed upstream
dracut -f /boot/initramfs-$(uname -r).img $(uname -r)

# Conditionally add memory test entry to boot loader
if dmidecode -s system-manufacturer | egrep -q -v "(Microsoft|VMware|innotek|Parallels|Red.*Hat|oVirt|Xen)" ; then
	memtest-setup
	grub2-mkconfig -o "${grub2_cfg_file}"
fi

# Configure kernel I/O scheduler policy
sed -i -e '/^GRUB_CMDLINE_LINUX/s/\selevator=[^[:space:]"]*//' -e '/^GRUB_CMDLINE_LINUX/s/"$/ elevator=deadline"/' /etc/default/grub
grub2-mkconfig -o "${grub2_cfg_file}"

# Configuration of session/system management (ignore power actions initiated by keyboard etc.)
# Note: interactive startup is disabled by default (enable with systemd.confirm_spawn=true on kernel commandline) and single user mode uses sulogin by default
if dmidecode -s system-manufacturer | egrep -q -v "(Microsoft|VMware|innotek|Parallels|Red.*Hat|oVirt|Xen)" ; then
	sed -i -e '/Handle[^=]*=[^i]/s/^#\(Handle[^=]*\)=.*$/\1=ignore/' /etc/systemd/logind.conf
fi

# Configure kernel behaviour

# Console verbosity
# TODO: check kernel cmdline option loglevel
cat << EOF > /etc/sysctl.d/console-log.conf
# Controls the severity level of kernel messages on local consoles
kernel.printk = 1
EOF
chmod 644 /etc/sysctl.d/console-log.conf

# Reboot on panic
cat << EOF > /etc/sysctl.d/panic.conf
# Controls the timeout for automatic reboot on panic
kernel.panic = 5
EOF
chmod 644 /etc/sysctl.d/panic.conf

# Conditionally add virtual guest optimizations
# TODO: verify wether we can skip this and delegate to tuned
if dmidecode -s system-manufacturer | egrep -q "(Microsoft|VMware|innotek|Parallels|Red.*Hat|oVirt|Xen)" ; then
	# Configure block devices for a virtual guest
	
	# Configure timeout for Qemu devices
	# Note: VirtIO devices do not need this (neither do they expose any timeout parameter)
	cat <<- EOF > /etc/udev/rules.d/99-qemu-block-timeout.rules
	#
	# Qemu block devices timeout settings
	#
	ACTION=="add|change", SUBSYSTEMS=="block", ATTRS{model}=="QEMU_HARDDISK", RUN+="/bin/sh -c 'echo 180 >/sys\$DEVPATH/timeout'"
	EOF
	chmod 644 /etc/udev/rules.d/99-qemu-block-timeout.rules
	
	# Configure readahead and requests for VirtIO devices
	cat <<- EOF > /etc/udev/rules.d/99-virtio-block.rules
	#
	# VirtIO block devices settings
	#
	ACTION=="add|change", KERNEL=="vd*[!0-9]", SUBSYSTEM=="block", ENV{DEVTYPE}=="disk", ATTR{queue/nr_requests}="8"
	ACTION=="add|change", KERNEL=="vd*[!0-9]", SUBSYSTEM=="block", ENV{DEVTYPE}=="disk", ATTR{bdi/read_ahead_kb}="4096"
	EOF
	chmod 644 /etc/udev/rules.d/99-virtio-block.rules

	# Configure scheduler and memory for a virtual guest
	cat <<- EOF > /etc/sysctl.d/virtualguest.conf
	# Tune for a KVM virtualization guest
	kernel.sched_min_granularity_ns = 10000000
	kernel.sched_wakeup_granularity_ns = 15000000
	vm.dirty_background_ratio = 10
	vm.dirty_ratio = 40
	vm.dirty_expire_centisecs = 500
	vm.dirty_writeback_centisecs = 100
	vm.swappiness = 30
	kernel.sched_migration_cost_ns = 5000000
	EOF
	chmod 644 /etc/sysctl.d/virtualguest.conf
fi

# Configure log rotation (keep 6 years of logs, compressed)
sed -i -e 's/^rotate.*$/rotate 312/' -e 's/^#\s*compress.*$/compress/' /etc/logrotate.conf

# Enable HAVEGEd
systemctl enable haveged

# Note: users configuration script generated in pre section above and copied in third post section below

# Conditionally force static the nic name<->MAC mapping to work around hardware bugs (eg nic "autoshifting" on some HP MicroServer G7)
if [ "${nicmacfix}" = "true" ] ; then
	for nic_cfg in /etc/sysconfig/network-scripts/ifcfg-* ; do
		eval $(grep '^DEVICE=' "${nic_cfg}")
		nic_name="${DEVICE}"
		if echo "${nic_name}" | egrep -q '^(bond|lo|br|sit)' ; then
			continue
		fi
		nic_mac=$(cat "/sys/class/net/${nic_name}/address" 2>/dev/null)
		# Detect bonding slaves (real MAC address must be specially extracted)
		if [ -L "/sys/class/net/${nic_name}/master" ]; then
			# Note: the following regex does not catch all stat-printf output characters
			#nic_master=$(stat --printf="%N" "/sys/class/net/${nic_name}/master" | sed -e "s%^.*-> \`.*/net/\\([^']*\\)'.*\$%\\1%")
			nic_master=$(stat --printf="%N" "/sys/class/net/${nic_name}/master" | sed -e "s%^.*->.*/net/\\([[:alnum:]]*\\).*\$%\\1%")
			# Note: all bonding slaves take the apparent MAC address from the bonding master device (which usually takes it from the first slave) - extract the real one
			nic_mac=$(cat /proc/net/bonding/${nic_master} | awk 'BEGIN {IGNORECASE=1; found="false"}; /^Slave Interface:[[:space:]]*'${nic_name}'[[:space:]]*/ {found="true"}; /^Permanent HW addr:[[:space:]]*/ {if (found == "true") {print $4; exit}}')
		fi
		if [ -n "${nic_mac}" ]; then
			if ! grep -q '^HWADDR=' "${nic_cfg}" ; then
				echo "HWADDR=\"${nic_mac}\"" >> "${nic_cfg}"
			fi
		fi
	done
fi

# System clock configuration
# Note: systemd sets clock to UTC by default
#echo 'UTC' >> /etc/adjtime

# Configure NTP time synchronization (immediate hardware sync, add initial time adjusting from given server)
sed -i -e 's/^SYNC_HWCLOCK=.*$/SYNC_HWCLOCK="yes"/' /etc/sysconfig/ntpdate
echo "0.centos.pool.ntp.org" > /etc/ntp/step-tickers

# Allow NTPdate hardware clock sync through SELinux
# Note: obtained by means of: cat /var/log/audit/audit.log | audit2allow -M myntpdate
# TODO: remove when SELinux policy fixed upstream
mkdir -p /etc/selinux/local
cat << EOF > /etc/selinux/local/myntpdate.te

module myntpdate 8.0;

require {
        type ntpd_t;
        type hwclock_exec_t;
        type adjtime_t;
        class file { open read write execute execute_no_trans getattr };
        class netlink_audit_socket create;
}

#============= ntpd_t ==============
allow ntpd_t hwclock_exec_t:file { open read execute execute_no_trans getattr };
allow ntpd_t self:netlink_audit_socket create;
allow ntpd_t adjtime_t:file { open read getattr write };
EOF
chmod 644 /etc/selinux/local/myntpdate.te

pushd /etc/selinux/local
checkmodule -M -m -o myntpdate.mod myntpdate.te
semodule_package -o myntpdate.pp -m myntpdate.mod
semodule -i myntpdate.pp
popd

# Configure Chronyd to always serve NTP to all networks
sed -i -e 's/^#allow.*$/allow/' -e 's/^#local/local/' /etc/chrony.conf
firewall-offline-cmd --add-service=ntp --zone=internal

# Note: Configured TCP wrappers allow file in pre above and copied in second post below
echo "ALL: ALL" >> /etc/hosts.deny

# Configure SSH (show legal banner, no root login with password, limit authentication tries, no DNS tracing of incoming connections)
sed -i -e 's/^#\s*PermitRootLogin.*$/PermitRootLogin without-password/' -e 's/^#\s*MaxAuthTries.*$/MaxAuthTries 3/' -e 's/^#\s*UseDNS.*$/UseDNS no/' -e 's%^#\s*Banner.*$%Banner /etc/issue.net%' /etc/ssh/sshd_config
# Force security-conscious length of host keys by pre-creating them here
# Note: ED25519 keys have a fixed length so they are not created here
# Note: using haveged to ensure enough entropy (but rngd could be already running from installation environment)
# Note: starting service manually since systemd inside a chroot would need special treatment
haveged -w 1024 -F &
haveged_pid=$!
ssh-keygen -b 4096 -t rsa -N "" -f /etc/ssh/ssh_host_rsa_key
ssh-keygen -b 1024 -t dsa -N "" -f /etc/ssh/ssh_host_dsa_key
ssh-keygen -b 521 -t ecdsa -N "" -f /etc/ssh/ssh_host_ecdsa_key
chgrp ssh_keys /etc/ssh/ssh_host_{rsa,dsa,ecdsa}_key
chmod 640 /etc/ssh/ssh_host_{rsa,dsa,ecdsa}_key
# Stopping haveged started above
kill ${haveged_pid}

# Configure use of at/cron facilities (allow only listed users)
rm -f /etc/{at,cron}.deny
cat << EOF > /etc/at.allow
root
EOF
chmod 600 /etc/at.allow
cat << EOF > /etc/cron.allow
root
EOF
chmod 600 /etc/cron.allow

# Configure legal warning messages
cat << EOF > /etc/issue

WARNING: THIS CONSOLE IS RESERVED FOR SYSTEM ADMINISTRATION ONLY.
EVERY ACCESS IS THOROUGHLY LOGGED.
THERE IS NO PRIVACY PROTECTION ON LOGGED DATA.
VIOLATIONS WILL BE PROSECUTED.
ACCESS IMPLIES ACCEPTANCE OF THE ABOVE CONDITIONS.

EOF
cat << EOF > /etc/issue.net

Access is reserved to explicitly authorized personnel only.
Violations will be prosecuted.
Every access is thoroughly logged.
This access service provides no privacy protection on logged data.
Access through this service implies acceptance of the above conditions.

EOF
cat << EOF > /etc/motd

                                  WARNING

This computer is the private property of his owners.
Permission of use must be individually and explicitly obtained in written form.
If you have not been authorized, you must immediately terminate your connection.
Violations will be prosecuted.
Use of this computer is thoroughly logged.
There is no privacy protection on logged data.
Continued use of this computer implies acceptance of the above conditions.

EOF
chmod 644 /etc/{issue*,motd}

# Configure ABRTd
# Keep crash info even for non-rpm-packaged programs but exclude users writable paths
sed -i -e 's/^ProcessUnpackaged.*$/ProcessUnpackaged = yes/' -e 's%\(BlackListedPaths.*\)$%\1, /home*, /tmp/*, /var/tmp/*%' /etc/abrt/abrt-action-save-package-data.conf
# Allow reports for signed packages from 3rd-party repos by adding their keys under /etc/pki/rpm-gpg/
for repokeyurl in $(grep -h '^gpgkey' /etc/yum.repos.d/*.repo | grep -v 'file:///' | sed -e 's/^gpgkey\s*=\s*//' -e 's/\s*$//' -e 's/\$releasever/'$(rpm -q --queryformat '%{version}\n' centos-release)'/g' | sort | uniq); do
	key_file="$(echo ${repokeyurl} | sed -e 's%^.*/\([^/]*\)$%\1%')"
	if [ ! -f "/etc/pki/rpm-gpg/${key_file}" ]; then
		wget -P /etc/pki/rpm-gpg/ "${repokeyurl}"
	fi
done
# Disable automatic reporting by email
sed -i -e 's/^/#/' /etc/libreport/events.d/mailx_event.conf

# Disable SMARTd on a virtual machine
if dmidecode -s system-manufacturer | egrep -q "(Microsoft|VMware|innotek|Parallels|Red.*Hat|oVirt|Xen)" ; then
	systemctl disable smartd
fi

# Configure Net-SNMP
cp -a /etc/snmp/snmpd.conf /etc/snmp/snmpd.conf.orig
cat << EOF > /etc/snmp/snmpd.conf
# Simple setup of Net-SNMP for traffic monitoring
rocommunity public
dontLogTCPWrappersConnects yes
EOF

# Enable Net-SNMP
systemctl enable snmpd

# Configure MRTG

# Configuration file customization through cfgmaker/indexmaker demanded to post-install rc.ks1stboot script

# Configure MRTG-Apache integration (allow access from everywhere)
sed -i -e 's/^\(\s*\)\(Require local.*\)$/\1Require all granted/' /etc/httpd/conf.d/mrtg.conf

# Configure Apache

# Note: using haveged to ensure enough entropy (but rngd could be already running from installation environment)
# Note: starting service manually since systemd inside a chroot would need special treatment
haveged -w 1024 -F &
haveged_pid=$!
# Prepare default (self-signed) certificate
openssl genrsa 2048 > /etc/pki/tls/private/localhost.key
cat << EOF | openssl req -new -sha256 -key /etc/pki/tls/private/localhost.key -x509 -days 3650 -out /etc/pki/tls/certs/localhost.crt
IT
Lombardia
Bergamo
FleurFlower
Heretic oVirt Project Demo Infrastructure
${HOSTNAME}
root@${HOSTNAME}
EOF
chmod 600 /etc/pki/tls/{private,certs}/localhost.*

# Create custom DH parameters
openssl dhparam -out /etc/pki/tls/dhparams.pem 2048
chmod 644 /etc/pki/tls/dhparams.pem
# Stopping haveged started above
kill ${haveged_pid}

# Configure Apache web service (disable certificate expiration warnings, do not advertise OS/Apache, disable default CGI directory and manual pages, create custom home page, disable TRACE/TRACK support, disable older/weakier protocols/crypto for SSL)
cat << EOF >> /etc/sysconfig/httpd

#
# To avoid periodic checking (with warning email) of certificates validity,
# set NOCERTWATCH here.
#
NOCERTWATCH="yes"

EOF

# Append custom DH parameters to our certificate file (needs httpd >= 2.2.15-32)
# Note: newer Apache versions allow specifying custom DH parameters with: SSLOpenSSLConfCmd DHParameters "/etc/pki/tls/dhparams.pem"
cat /etc/pki/tls/dhparams.pem >> /etc/pki/tls/certs/localhost.crt

sed -i -e 's/^ServerTokens.*$/ServerTokens ProductOnly/' -e 's/^ServerSignature.*$/ServerSignature Off\n\n#\n# Disable TRACE for PCI compliance\nTraceEnable off/' -e 's/^\(ScriptAlias.*\)$/#\1/' /etc/httpd/conf/httpd.conf
sed -i -e 's/^\(SSLProtocol.*\)$/#\1/' -e 's/^\(SSLCipherSuite.*\)$/#\1\n# Stricter settings for PCI compliance\nSSLProtocol all -SSLv2 -SSLv3\nSSLCipherSuite ALL:!EXP:!NULL:!ADH:!LOW:!RC4/' /etc/httpd/conf.d/ssl.conf

# Prepare home page
cat << EOF > /var/www/html/index.html
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
	<head>
		<title>Heretic oVirt Project - Installation Server</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<style type="text/css">
			body {
				background-color: #fff;
				color: #000;
				font-size: 0.9em;
				font-family: sans-serif,helvetica;
				margin: 0;
				padding: 0;
			}
			:link {
				color: #0000FF;
			}
			:visited {
				color: #0000FF;
			}
			a:hover {
				color: #3399FF;
			}
			h1 {
				text-align: center;
				margin: 0;
				padding: 0.6em 2em 0.4em;
				background-color: #3399FF;
				color: #ffffff;
				font-weight: normal;
				font-size: 1.75em;
				border-bottom: 2px solid #000;
			}
			h1 strong {
				font-weight: bold;
			}
			h2 {
				font-size: 1.1em;
				font-weight: bold;
			}
			.content {
				padding: 1em 5em;
			}
			.content-columns {
				/* Setting relative positioning allows for
				absolute positioning for sub-classes */
				position: relative;
				padding-top: 1em;
			}
			.content-column-left {
				/* Value for IE/Win; will be overwritten for other browsers */
				width: 47%;
				padding-right: 3%;
				float: left;
				padding-bottom: 2em;
			}
			.content-column-right {
				/* Values for IE/Win; will be overwritten for other browsers */
				width: 47%;
				padding-left: 3%;
				float: left;
				padding-bottom: 2em;
			}
			.content-columns>.content-column-left, .content-columns>.content-column-right {
				/* Non-IE/Win */
			}
			img {
				border: 2px solid #fff;
				padding: 2px;
				margin: 2px;
			}
			a:hover img {
				border: 2px solid #3399FF;
			}
		</style>
	</head>

	<body>
	<h1>Heretic oVirt Project - Installation Server</h1>

		<div class="content">
			<div class="content-columns">
				<div class="content-column-left">
					<h2>Avvertenza per gli utenti del servizio:</h2>
					<p>Questa macchina fornisce servizi di installazione legati al progetto Heretic oVirt.</p>
					<h2>Risorse di pubblico accesso:</h2>
					<p>Le seguenti risorse web offerte da questa macchina sono liberamente accessibili.
					<ul>
						<li>Un archivio pubblico dei pacchetti RPM &egrave; disponibile <a href="/hvp-repos/">qui</a>.</li>
					</ul>
					</p>
					<h2>Se siete parte del personale tecnico:</h2>
					<p>Le funzionalit&agrave; predisposte per amministrazione/controllo sono elencate di seguito.
					<ul>
						<li>Lo strumento web di gestione &egrave; disponibile <a href="/manage/">qui</a>.</li>
						<li>Lo strumento web di visualizzazione utilizzo rete &egrave; disponibile <a href="/mrtg/">qui</a>.</li>
						<li>Lo strumento web di visualizzazione utilizzo http &egrave; disponibile <a href="/usage/">qui</a>.</li>
					</ul>
					</p>
				</div>

				<div class="content-column-right">
					<h2>End users notice:</h2>
					<p>This machine hosts Heretic oVirt Project installation services.</p>
					<h2>Publicly available resources:</h2>
					<p>These are the publicly available resources hosted on this machine.
					<ul>
						<li>The public RPM repository is available <a href="/hvp-repos/">here</a>.</li>
					</ul>
					</p>
					<h2>If you are a staff member:</h2>
					<p>The  maintenance/administrative resources are listed below.
					<ul>
						<li>The general administration tool is available <a href="/manage/">here</a>.</li>
						<li>The server network utilization web tool is available <a href="/mrtg/">here</a>.</li>
						<li>The web server usage statistics are available <a href="/usage/">here</a>.</li>
					</ul>
					</p>
				</div>
			</div>
                </div>
</body>
</html>
EOF
chmod 644 /var/www/html/index.html

# Prepare network installation area
mkdir -p /var/www/hvp-repos/el7/{centos,ks}
# Mirror web contents here using wget
for subdir in ks centos node-${ovirt_version}; do
	wget -P /var/www/hvp-repos/el7 -m -np -nH --cut-dirs=2 --retry-connrefused --waitretry=5 --read-timeout=20 -T 15 -c --reject "index.html*" https://dangerous.ovirt.life/hvp-repos/el7/${subdir}/
done
# Note: providing link for compatibility purposes
ln -s node-${ovirt_version} /var/www/hvp-repos/el7/node

# Enable virtual host configuration
sed -i -e 's/^#*\s*NameVirtualHost.*$/NameVirtualHost *:80/' /etc/httpd/conf/httpd.conf
# Note: further configuration generated in pre section above and appended in second non-chroot post section below

# Configure our public repository with listing options
cat << EOF > /etc/httpd/conf.d/public.conf
# RPM public repository
Alias /hvp-repos /var/www/hvp-repos

<Directory /var/www/hvp-repos>
	#SSLRequireSSL
	Options Indexes FollowSymLinks
	Indexoptions +FoldersFirst -VersionSort
        AllowOverride None
        <IfModule mod_authz_core.c>
          # Apache 2.4
          Require all granted
        </IfModule>
        <IfModule !mod_authz_core.c>
          # Apache 2.2
          Order Deny,Allow
          Deny from all
          Allow from all
        </IfModule>
</Directory>

EOF
chmod 644 /etc/httpd/conf.d/public.conf

# Configure either Wok or Webmin
if [ "${nolocalvirt}" != "true" ]; then
	# TODO: default port 8000 is not available (already assigned by default SELinux policy to soundd_port_t) - adding 500 to all 8000-based ports - remove when fixed upstream
	cp /usr/lib/firewalld/services/wokd.xml /etc/firewalld/services/
	sed -i -e 's/800\([01]\)/850\1/g' /etc/firewalld/services/wokd.xml
	sed -i -e 's/80\([10]\)\([01]\)/85\1\2/g' /etc/nginx/conf.d/wok.conf
	sed -i -e '/_port\s*=/s/80\([10]\)\([01]\)/85\1\2/g' -e '/_port\s*=/s/^#*//g' -e 's/^\(proxy_port.*\)$/\1\nport = 8500/' /etc/wok/wok.conf
	# Note: need to allow nginx controlled ports through SELinux
	semanage port -a -t http_port_t -p tcp 8500
	semanage port -a -t http_port_t -p tcp 8501
	semanage port -a -t http_port_t -p tcp 8510
	semanage port -a -t http_port_t -p tcp 64667
	# Note: nginx by default would try to bind port 80 (already bound to apache) and fail
	sed -i -e '/^\s*server/,+19s/^/#/g' /etc/nginx/nginx.conf
	# Add "/manage/" location with forced redirect to Wok port in Apache configuration
	cat <<- EOF > /etc/httpd/conf.d/wok.conf
	#
	#  Apache-based redirection for Wok
	#
	
	<Location /manage>
	  RewriteEngine On
	  RewriteRule ^.*\$ https://%{HTTP_HOST}:8501 [R,L]
	  <IfModule mod_authz_core.c>
	    # Apache 2.4
	    Require all granted
	  </IfModule>
	  <IfModule !mod_authz_core.c>
	    # Apache 2.2
	    Order Deny,Allow
	    Deny from all
	    Allow from all
	  </IfModule>
	</Location>
	
	EOF
	chmod 644 /etc/httpd/conf.d/wok.conf

	# Configure Wok to use a custom certificate
	cat /etc/pki/tls/private/localhost.key > /etc/wok/wok-key.pem
	chmod 600 /etc/wok/wok-key.pem
	cat /etc/pki/tls/certs/localhost.crt > /etc/wok/wok-cert.pem
	chmod 644 /etc/wok/wok-cert.pem

	# Enable Wok
	firewall-offline-cmd --add-service=wokd --zone=external
	systemctl enable wokd
else
	# Add "/manage/" location with forced redirect to Webmin port in Apache configuration
	cat <<- EOF > /etc/httpd/conf.d/webmin.conf
	#
	#  Apache-based redirection for Webmin
	#
	
	<Location /manage>
	  RewriteEngine On
	  RewriteRule ^.*\$ https://%{HTTP_HOST}:10000 [R,L]
	  <IfModule mod_authz_core.c>
	    # Apache 2.4
	    Require all granted
	  </IfModule>
	  <IfModule !mod_authz_core.c>
	    # Apache 2.2
	    Order Deny,Allow
	    Deny from all
	    Allow from all
	  </IfModule>
	</Location>
	
	EOF
	chmod 644 /etc/httpd/conf.d/webmin.conf

	# Configure Webmin to use a custom certificate
	cat /etc/pki/tls/private/localhost.key > /etc/webmin/miniserv.pem
	cat /etc/pki/tls/certs/localhost.crt >> /etc/webmin/miniserv.pem

	# Modify default setup
	cat <<- EOF >> /etc/webmin/config
	logfiles=1
	logfullfiles=1
	logtime=21900
	logperms=
	logsyslog=0
	logusers=
	logmodules=
	logclear=1
	hostnamemode=0
	help_width=
	dateformat=dd/mon/yyyy
	showhost=0
	nofeedbackcc=0
	hostnamedisplay=
	feedback_to=
	sysinfo=0
	texttitles=1
	showlogin=0
	help_height=
	acceptlang=0
	gotoone=1
	gotomodule=
	deftab=webmin
	nohostname=0
	notabs=0
	realname=
	noremember=1
	EOF
	sed -i -e 's/^logtime=.*$/logtime=21900/' /etc/webmin/miniserv.conf
	cat <<- EOF >> /etc/webmin/miniserv.conf
	no_resolv_myname=1
	sockets=
	login_script=/etc/webmin/login.pl
	logout_script=/etc/webmin/logout.pl
	logclf=0
	logclear=1
	loghost=0
	pam_conv=
	blockuser_time=
	blocklock=
	blockuser_failures=
	no_pam=0
	logouttime=10
	utmp=
	extracas=
	certfile=
	ssl_redirect=1
	EOF

	# Add firewalld configuration for Webmin
	cat <<- EOF > /etc/firewalld/services/webmin.xml
	<?xml version="1.0" encoding="utf-8"?>
	<service>
	  <short>webmin</short>
	  <description>webmin is a web-based interface for system administration for unix.</description>
	  <port protocol="tcp" port="10000"/>
	</service>
	EOF
	chmod 644 /etc/firewalld/services/webmin.xml

	# Enable Webmin
	firewall-offline-cmd --add-service=webmin --zone=external
	systemctl enable webmin
fi

# Configure Webalizer (allow access from everywhere)
sed -i -e 's/^\(\s*\)\(Require local.*\)$/\1#\2/' /etc/httpd/conf.d/webalizer.conf

# Enable Webalizer
sed -i -e '/WEBALIZER_CRON=/s/^#*\(WEBALIZER_CRON=\).*$/\1yes/' /etc/sysconfig/webalizer

# Enable Apache
firewall-offline-cmd --add-service=http --zone=internal
systemctl enable httpd

# Configure Bind
# Note: base configuration files generated in pre section above - actual file copying happens in non-chroot post section below

# Note: using haveged to ensure enough entropy (but rngd could be already running from installation environment)
# Note: starting service manually since systemd inside a chroot would need special treatment
haveged -w 1024 -F &
haveged_pid=$!
pushd /etc

# Generate key for rndc control connections
rndckey=$(grep Key $(/usr/sbin/dnssec-keygen -a HMAC-MD5 -b 512 -n HOST -T KEY rndc_key).private | awk '{print $2}')
cat << EOM > rndc.key
// rndc key for control connections
key "rndc_key" {
        algorithm hmac-md5;
        secret "${rndckey}";
};
EOM
chgrp named rndc.key
chmod 640 rndc.key
cat << EOM > rndc.conf
// rndc configuration for control connections
options {
        default-server  localhost;
        default-key     "rndc_key";
};

server localhost {
        key  "rndc_key";
};

// rndc key for control connections
include "/etc/rndc.key";

EOM
chmod 644 rndc.conf
popd

# Stopping haveged started above
kill ${haveged_pid}

# TODO: disabling IPv6 DNS resolution - remove when smoothly working everywhere
cat << EOF >> /etc/sysconfig/named
OPTIONS="-4"
EOF

# Enable Bind
systemctl enable named
firewall-offline-cmd --add-service=dns --zone=internal

# Enable TFTPd
firewall-offline-cmd --add-service=tftp --zone=internal
systemctl enable tftp.service tftp.socket

# Configure DHCP service
# Note: no need for commandline options - interfaces are implicitly defined by configured subnets below
# Note: base configuration file generated in pre section above - actual file copying happens in non-chroot post section below

# Create separate file for for broken PXE implementations
# TODO: add PXE ROMs from ROM-O-matic service if needed
cat << EOF > /etc/dhcp/dhcpd-broken-pxe.conf
#
# Workarounds for broken PXE implementations using Etherboot ROMs
#

EOF
chmod 644 /etc/dhcp/dhcpd-broken-pxe.conf

# Create separate file for reservations
cat << EOF > /etc/dhcp/dhcpd-static-leases.conf
## Add static address leases here

EOF
chmod 644 /etc/dhcp/dhcpd-static-leases.conf

# Enable DHCPd
# TODO: check actual need (and configuration) for proxy service
firewall-offline-cmd --add-service=dhcp --zone=internal
firewall-offline-cmd --add-service=proxy-dhcp --zone=internal
systemctl enable dhcpd

# Add PXE menu/setup configuration

# Copy PXElinux and Memtest86+ files under TFTP boot area
cp /boot/memtest86+* /var/lib/tftpboot
pushd /var/lib/tftpboot
ln -s memtest86+* memtest86+
popd
# Note: the following assumes a newer (6.x) Syslinux package - rebuilt Fedora version installed above
mkdir -p /var/lib/tftpboot/{pxelinux.cfg,bios,efi{32,64}}
cp /usr/share/syslinux/bios/memdisk /var/lib/tftpboot/
cp /usr/share/syslinux/bios/*.0 /var/lib/tftpboot/
cp /usr/share/syslinux/bios/ldlinux.c32 /var/lib/tftpboot/
cp /usr/share/syslinux/bios/*.c32 /var/lib/tftpboot/bios
cp /usr/share/syslinux/efi32/efi32/ldlinux.e32 /var/lib/tftpboot/
cp /usr/share/syslinux/efi32/efi32/*.c32 /var/lib/tftpboot/efi32
cp /usr/share/syslinux/efi32/efi32/syslinux.efi /var/lib/tftpboot/bootia32.efi
cp /usr/share/syslinux/efi64/efi64/ldlinux.e64 /var/lib/tftpboot/
cp /usr/share/syslinux/efi64/efi64/*.c32 /var/lib/tftpboot/efi64
cp /usr/share/syslinux/efi64/efi64/syslinux.efi /var/lib/tftpboot/bootx64.efi

# Create PXELinux menus
# Note: PXElinux common.cfg and vm.cfg menus created in pre section above and copied in third post section below
touch /var/lib/tftpboot/{common,vm}.cfg
cat << EOF > /var/lib/tftpboot/bios.cfg
PATH bios
INCLUDE common.cfg
EOF
chmod 644 /var/lib/tftpboot/bios.cfg
pushd /var/lib/tftpboot
ln -s ../bios.cfg pxelinux.cfg/default
popd
cat << EOF > /var/lib/tftpboot/efi32.cfg
PATH efi32
INCLUDE common.cfg
EOF
chmod 644 /var/lib/tftpboot/efi32.cfg
cat << EOF > /var/lib/tftpboot/efi64.cfg
PATH efi64
INCLUDE common.cfg
EOF
chmod 644 /var/lib/tftpboot/efi64.cfg

# Copy netboot images mirrored above
mkdir -p /var/lib/tftpboot/linux/{centos,node}
pushd /var/lib/tftpboot/linux/node
cp /var/www/hvp-repos/el7/node/vmlinuz .
cp /var/www/hvp-repos/el7/node/initrd.img .
popd
pushd /var/lib/tftpboot/linux/centos
cp /var/www/hvp-repos/el7/centos/vmlinuz .
cp /var/www/hvp-repos/el7/centos/initrd.img .
popd

# Configure SSH root login with key
# Note: using haveged to ensure enough entropy (but rngd could be already running from installation environment)
# Note: using ECDSA keys (supported only for protocol 2) - beware: not supported by PuTTY
# Note: it seems that publickey login is disabled for DSA keys by default
haveged -w 1024 -F &
haveged_pid=$!
ssh-keygen -t ecdsa -b 521 -N "" -f /root/.ssh/id_ecdsa
cp /root/.ssh/id_ecdsa.pub /root/.ssh/authorized_keys
# Stopping haveged started above
kill ${haveged_pid}

# Configure Ansible and gDeploy
# TODO: take out all these files and place them inside a proper rpm package to be installed above - leave only variable definition files creation in kickstart
# Note: Configured Ansible hosts file in pre above and copied in second post below
# TODO: find a way to re-enable host key checking without impacting automation
sed -i -e 's/^#*\s*host_key_checking\s*=.*$/host_key_checking = False/' -e 's/^#*\s*pipelining\s*=.*$/pipelining = True/' /etc/ansible/ansible.cfg
# Prepare Ansible roles
# Note: Ansible group var files created in pre section above and copied in third post section below
# TODO: create var file vms.yaml for virtual machines creation (parse kickstart files downloaded above)
# Note: oVirt defaults created in pre section above and copied in third post section below
# TODO: copy files from installed package - remove when fully using them in place
mkdir -p /usr/local/etc/hvp-ansible
cp -r /usr/share/ansible/hvp-ansible/* /usr/local/etc/hvp-ansible/

# Configure Squid as a transparent proxy with disk caching
# Note: default Squid configuration file accepts all RFC1918 subnets as local networks
# TODO: substitute default ACLs with one line for each internal zone
sed -i -e '/^http_port/s/$/\nhttp_port 8080 intercept/' -e 's%^#\s*cache_dir\s*ufs\s*/var/spool/squid\s*100\s*16\s*256\s*$%cache_dir aufs /var/spool/squid 30720 32 256%' /etc/squid/squid.conf

# Add firewalld configuration for Squid in transparent proxy mode
cat << EOF > /etc/firewalld/services/tproxy.xml
<?xml version="1.0" encoding="utf-8"?>
<service>
  <short>tproxy</short>
  <description>transparent proxy is the intercept mode for squid.</description>
  <port protocol="tcp" port="8080"/>
</service>
EOF
chmod 644 /etc/firewalld/services/tproxy.xml

# Enable Squid
firewall-offline-cmd --zone=internal --add-service=squid
systemctl enable squid

# Enable verbose logging in firewalld
firewall-offline-cmd --set-log-denied=all

# Define GNOME3 global settings (mandatory/defaults)
# Note: schema inspected on a live GNOME session using "gsettings list-recursively"
# Note: pre-seeding values with gsettings as root works for root user only and needs dbus running - using dconf instead

# Note: clock panel applet under GNOME3 takes all settings from system defaults (location, time format, display etc.)

# Disable autorun for external media
cat << EOF > /etc/dconf/db/local.d/01-autorun-settings
# Custom settings for GNOME autorun
[org/gnome/desktop/media-handling]
autorun-never=true
EOF
chmod 644 /etc/dconf/db/local.d/01-autorun-settings

# Disable switch user
cat << EOF > /etc/dconf/db/local.d/01-switchuser-settings
# Custom settings for GNOME user session switching
[org/gnome/desktop/lockdown]
disable-user-switching=true
EOF
chmod 644 /etc/dconf/db/local.d/01-switchuser-settings

# Note: GNOME3 (or newer CUPS) does not show other user print jobs by default
# TODO: verify

# Disable online account providers
cat << EOF > /etc/dconf/db/local.d/01-goa-settings
# Custom settings for GNOME online account providers
[org/gnome/online-accounts]
whitelisted-providers=['']
EOF
chmod 644 /etc/dconf/db/local.d/01-goa-settings

# Conditionally apply custom defaults to screensaver under GNOME3 (do not start on idle, do not lock)
if dmidecode -s system-manufacturer | egrep -q "(Microsoft|VMware|innotek|Parallels|Red.*Hat|oVirt|Xen)" ; then
	cat <<- EOF > /etc/dconf/db/local.d/01-screensaver-settings
	# Custom settings for GNOME screensaver
	[org/gnome/desktop/lockdown]
	disable-lock-screen=true
	[org/gnome/settings-daemon/plugins/media-keys]
	screensaver=''
	[org/gnome/desktop/screensaver]
	idle-activation-enabled=false
	lock-enabled=false
	lock-delay=uint32 0
	[org/gnome/desktop/session]
	idle-delay=uint32 0
	[org/gnome/session]
	idle-delay=uint32 0
	[org/gnome/settings-daemon/plugins/power]
	sleep-display-ac=0
	sleep-display-battery=0
	sleep-inactive-ac-timeout=0
	sleep-inactive-battery-timeout=0
	sleep-inactive-battery-type='nothing'
	sleep-inactive-ac-type='nothing'
	EOF
	chmod 644 /etc/dconf/db/local.d/01-screensaver-settings
	# Lock our custom defaults applied above
	cat <<- EOF > /etc/dconf/db/local.d/locks/01-screensaver-settings-locks
	/org/gnome/desktop/lockdown/disable-lock-screen
	/org/gnome/settings-daemon/plugins/media-keys/screensaver
	/org/gnome/desktop/screensaver/idle-activation-enabled
	/org/gnome/desktop/screensaver/lock-enabled
	/org/gnome/desktop/screensaver/lock-delay
	/org/gnome/desktop/session/idle-delay
	/org/gnome/session/idle-delay
	/org/gnome/settings-daemon/plugins/power/sleep-display-ac
	/org/gnome/settings-daemon/plugins/power/sleep-display-battery
	/org/gnome/settings-daemon/plugins/power/sleep-inactive-ac-timeout
	/org/gnome/settings-daemon/plugins/power/sleep-inactive-battery-timeout
	/org/gnome/settings-daemon/plugins/power/sleep-inactive-ac-type
	/org/gnome/settings-daemon/plugins/power/sleep-inactive-battery-type
	EOF
	chmod 644 /etc/dconf/db/local.d/locks/01-screensaver-settings-locks
	# Disable power management (blanking) on the X server side too
	cat <<- EOF > /etc/X11/xorg.conf.d/01-dpms.conf
	Section "ServerFlags"
		Option "BlankTime" "0"
		Option "StandbyTime" "0"
		Option "SuspendTime" "0"
		Option "OffTime" "0"
	EndSection
	EOF
	chmod 644 /etc/X11/xorg.conf.d/01-dpms.conf
	# Disable power/update actions via PolKit (affects GNOME menus and other ways to perform them)
	# TODO: verify default rules under /usr/share/polkit-1/actions/
	cat <<- EOF > /etc/polkit-1/rules.d/60-nousershutdown.rules
	polkit.addRule(function(action, subject) {
	  if ((action.id.indexOf("org.freedesktop.login1.hibernate") == 0) ||
	      (action.id.indexOf("org.freedesktop.login1.suspend") == 0)   ||
	    if (subject.user === "root") {
	        return polkit.Result.YES;
	    } else {
	        return polkit.Result.NO;
	    }
	  }
	});
	EOF
	chmod 644 /etc/polkit-1/rules.d/60-nousershutdown.rules
fi

# Note: filemanager under GNOME3 does not use spatial mode by default

# Apply all GNOME3 settings specified above
rm -f /etc/dconf/db/local
dconf update

# Disable graphical initial system setup
sed -i -e 's/^\(\[daemon\].*\)$/\1\nInitialSetupEnable=False/' /etc/gdm/custom.conf

# Disable GNOME initial setup
# TODO: there is no way to globally disable this: faking an already performed initial setup - remove when fixed upstream
mkdir -m 700 /etc/skel/.config
echo "yes" > /etc/skel/.config/gnome-initial-setup-done
chmod 644 /etc/skel/.config/gnome-initial-setup-done

# TODO: there is a known inconsistency (personal bin directories not in path) in the PATH setting for a terminal opened through Nautilus "Open in Terminal" menu entry
# TODO: adding workaround here (http://seven.centos.org/2014/04/path-inconsistency-in-el7/) - remove when fixed upstream
cat << EOF > /etc/profile.d/consistent-user-path.sh
#!/bin/sh
# Fix broken nautilus-open-terminal
if ! echo "\${PATH}" | grep -q "\${HOME}/bin" ; then
	PATH=\${PATH}:\${HOME}/.local/bin:\${HOME}/bin
	export PATH
fi
EOF
chmod 644 /etc/profile.d/consistent-user-path.sh

# Note: users configuration script created in pre section above and copied in third post section below

# Exclude /var/tmp from systemd-tmpfiles (equivalent of tmpwatch in CentOS <= 6)
mkdir -p /etc/tmpfiles.d
cp /usr/lib/tmpfiles.d/tmp.conf /etc/tmpfiles.d
sed -i -e 's>^\(.\s*/var/tmp.*\)$>#\1>' /etc/tmpfiles.d/tmp.conf

# Configure X2Go
systemctl enable x2gocleansessions

# Conditionally enable MCE logging/management service
if dmidecode -s system-manufacturer | egrep -q -v "(Microsoft|VMware|innotek|Parallels|Red.*Hat|oVirt|Xen)" ; then
	systemctl enable mcelog
fi

# Configure root home dir (with utility scripts for basic configuration/log backup)
mkdir -p /root/{etc,bin,log,tmp,backup}
cat << EOF > /root/bin/backup-log
#!/bin/bash
tar -czf /root/backup/\$(hostname)-\$(date '+%Y-%m-%d')-log.tar.gz /root/etc /root/log \$(find /var/log/ -type f ! -iname '*z' -print)
EOF
chmod 755 /root/bin/backup-log
cat << EOF > /root/bin/backup-conf
#!/bin/bash
tar -czf /root/backup/\$(hostname)-\$(date '+%Y-%m-%d')-conf.tar.gz \$(cat /root/etc/backup.list)
EOF
chmod 755 /root/bin/backup-conf
cat << EOF > /root/etc/backup.list
/boot/grub2
/etc
/var/www/html
/usr/local/bin
/usr/local/sbin
/usr/local/etc
/root/bin
/root/etc
/root/log
/root/.[^ekmn]?*
EOF
# Initialize administration log journal
cat << EOF > /root/log/sysadm.log
$(date '+%Y/%m/%d')
*) installed $(lsb_release -i -r -s) $(uname -m) from kickstart

EOF

# Set up "first-boot" configuration script (steps that require a fully up system)
cat << EOF > /etc/rc.d/rc.ks1stboot
#!/bin/bash

# Conditionally enable either IPMI or LMsensors monitoring
# TODO: configure IPMI options
# TODO: find a way to ignore partial IPMI implementations (e.g. those needing a [missing] add-on card)
if dmidecode -s system-manufacturer | egrep -q -v "(Microsoft|VMware|innotek|Parallels|Red.*Hat|oVirt|Xen)" ; then
	if dmidecode --type 38 | grep -q 'IPMI' ; then
		systemctl --now enable ipmi
		systemctl --now enable ipmievd
	else
		sensors-detect --auto
		systemctl --now enable lm_sensors
	fi
fi

# Setup virtualization tools (Hyper-V/KVM/VMware/VirtualBox/Parallels supported)
# TODO: Verify that VirtIO drivers get used for Xen/KVM, warn otherwise
# TODO: disable kernel updating or configure dkms (if not already done above or by tools installation)
pushd /tmp
need_reboot="no"
if dmidecode -s system-manufacturer | grep -q "Microsoft" ; then
	# TODO: configure Hyper-V integration agents
	systemctl --now enable hypervkvpd hypervvssd hypervfcopyd
elif dmidecode -s system-manufacturer | grep -q 'Xen' ; then
	# Enable ARP notifications for vm migrations
	cat <<- EOM > /etc/sysctl.d/99-xen-guest.conf
	net.ipv4.conf.all.arp_notify=1
	EOM
	chmod 644 /etc/sysctl.d/99-xen-guest.conf
	sysctl -p
	wget https://dangerous.ovirt.life/support/Xen/xe-guest-utilities*.rpm
	yum -y --nogpgcheck install ./xe-guest-utilities*.rpm
	rm -f xe-guest-utilities*.rpm
elif dmidecode -s system-manufacturer | grep -q "VMware" ; then
	# Note: VMware basic support uses distro-provided packages installed during post phase
	# Note: using vmware-hgfsclient (already part of open-vm-tools) for shared folders support
	shared_folders="\$(vmware-hgfsclient)"
	if [ -z "\${shared_folders}" ]; then
		cat <<- EOM >> /etc/fstab
		# Template line to activate boot-mounted shared folders
		#.host:/Test	/mnt/hgfs/Test	fuse.vmhgfs-fuse	allow_other,auto_unmount,defaults	0 0
		EOM
	else
		for shared_folder in \${shared_folders} ; do
			mkdir -p "/mnt/hgfs/\${shared_folder}"
			cat <<- EOM >> /etc/fstab
			.host:/\${shared_folder}	/mnt/hgfs/\${shared_folder}	fuse.vmhgfs-fuse	allow_other,auto_unmount,defaults	0 0
			EOM
		done
	fi
	need_reboot="no"
elif dmidecode -s system-manufacturer | grep -q "innotek" ; then
	wget https://dangerous.ovirt.life/support/VirtualBox/VBoxLinuxAdditions.run
	chmod a+rx VBoxLinuxAdditions.run
	./VBoxLinuxAdditions.run --nox11
	usermod -a -G vboxsf mwtouser
	rm -f VBoxLinuxAdditions.run
	need_reboot="yes"
elif dmidecode -s system-manufacturer | grep -q "Parallels" ; then
	wget https://dangerous.ovirt.life/support/Parallels/ParallelsTools.tar.gz | tar xzf -
	pushd parallels-tools-distrib
	./install --install-unattended-with-deps
	popd
	rm -rf parallels-tools-distrib
	need_reboot="yes"
elif dmidecode -s system-manufacturer | grep -q "Red.*Hat" ; then
	# TODO: configure Qemu agent
	systemctl --now enable qemu-guest-agent
elif dmidecode -s system-manufacturer | grep -q "oVirt" ; then
	# TODO: configure oVirt agent
	systemctl --now enable qemu-guest-agent ovirt-guest-agent
fi
popd
# Note: CentOS 7 persistent net device naming means that MAC addresses are not statically registered by default anymore

# Initialize MRTG configuration (needs Net-SNMP up)
# TODO: add CPU/RAM/disk/etc. resource monitoring
cfgmaker --output /etc/mrtg/mrtg.cfg --global "HtmlDir: /var/www/mrtg" --global "ImageDir: /var/www/mrtg" --global "LogDir: /var/lib/mrtg" --global "ThreshDir: /var/lib/mrtg" --no-down --zero-speed=1000000000 --if-filter='(\$default && \$if_is_ethernet)' public@localhost

# Set execution mode parameters
# Note: on CentOS7 MRTG is preferably configured as an always running service (for efficiency reasons)
sed -i -e '/Global Config Options/s/^\\(.*\\)\$/\\1\\nRunAsDaemon: Yes\\nInterval: 5\\nNoDetach: Yes/' /etc/mrtg/mrtg.cfg

# Setup MRTG index page
indexmaker --output=/var/www/mrtg/index.html /etc/mrtg/mrtg.cfg

# Enable MRTG
# Note: MRTG is an always running service (for efficiency reasons) now
systemctl --now enable mrtg

EOF

# Saving installation instructions
# Note: done in rc.ks1stboot since this seems to get created after all post scripts are run
# TODO: something tries to load /root/anaconda-ks.cfg - find out what/why - seems related to https://bugzilla.redhat.com/show_bug.cgi?id=1213114
# TODO: it seems that a side effect of not moving it is the unconditional execution of the graphical firstboot phase - restoring file moving as a workaround
# TODO: it seems that the graphical firstboot phase happens anyway and at the end creates a /root/initial-ks.cfg
cat << EOF >> /etc/rc.d/rc.ks1stboot
mv /root/*-ks.cfg /root/etc
EOF

cat << EOF >> /etc/rc.d/rc.ks1stboot

# Run dynamically determined users configuration actions
if [ -x /etc/rc.d/rc.users-setup ]; then
	/etc/rc.d/rc.users-setup
fi

# Run dynamically determined firewalld configuration actions
if [ -x /etc/rc.d/rc.firewalld-setup ]; then
	/etc/rc.d/rc.firewalld-setup
fi

# Disable further executions of this script from systemd
systemctl disable ks1stboot.service

# Perform reboot after virtualization tools installation
if [ "\${need_reboot}" = "yes" ]; then
	shutdown -r +1
	# Note: the command above exits immediately - wait for the most part of the remaining minute
	sleep 57
fi

exit 0
EOF
chmod 750 /etc/rc.d/rc.ks1stboot
# Prepare first-boot execution through systemd
# TODO: find a way to actually block logins till this unit exits
cat << EOF > /etc/systemd/system/ks1stboot.service
[Unit]
Description=Post Kickstart first boot configurations
After=network.target network.service
Requires=network.target network.service
Before=getty.target sshd.service display-manager.service

[Service]
Type=oneshot
RemainAfterExit=true
ExecStart=/usr/bin/bash -c '/etc/rc.d/rc.ks1stboot > /root/log/rc.ks1stboot.log 2>&1'

[Install]
RequiredBy=getty.target sshd.service display-manager.service
EOF
chmod 644 /etc/systemd/system/ks1stboot.service
systemctl enable ks1stboot.service

# TODO: forcibly disable execution of graphical firstboot tool - kickstart directive on top seems to be ignored and moving away anaconda-ks.cfg is not enough - remove when fixed upstream - see https://bugzilla.redhat.com/show_bug.cgi?id=1213114
systemctl mask firstboot-graphical
systemctl mask initial-setup-graphical
systemctl mask initial-setup-text
systemctl mask initial-setup

) 2>&1 | tee /root/kickstart_post_1.log
%end

# Post-installation script (run with bash from installation image after the second post section)
%post --nochroot
( # Run the entire post section as a subshell for logging purposes.

# Append hosts fragment (generated in pre section above) into installed system
if [ -s /tmp/hvp-bind-zones/hosts ]; then
	cat /tmp/hvp-bind-zones/hosts >> ${ANA_INSTALL_PATH}/etc/hosts
fi

# Copy bind configuration (generated in pre section above) into installed system
# Note: using numeric uids/gids since anaconda image may lack the corresponding passwd/group entries
if [ -d /tmp/hvp-bind-zones ]; then
	if [ -d /tmp/hvp-bind-zones/dynamic ]; then
		cp /tmp/hvp-bind-zones/dynamic/* ${ANA_INSTALL_PATH}/var/named/dynamic/
		chmod 644 ${ANA_INSTALL_PATH}/var/named/dynamic/*
		chown 25:25 ${ANA_INSTALL_PATH}/var/named/dynamic/*
	fi
	if [ -f /tmp/hvp-bind-zones/named.conf ]; then
		cp /tmp/hvp-bind-zones/named.conf ${ANA_INSTALL_PATH}/etc/named.conf
		chmod 644 ${ANA_INSTALL_PATH}/etc/named.conf
		chgrp 25 ${ANA_INSTALL_PATH}/etc/named.conf
	fi
	# Reconfigure networking to use localhost DNS
	for file in /tmp/hvp-bind-zones/ifcfg-* ; do
		if [ -f "${file}" ]; then
			nic_cfg_file=$(basename "${file}")
			sed -i -e '/^PEERDNS/d' -e '/^DNS[0-9]/d' "${ANA_INSTALL_PATH}/etc/sysconfig/network-scripts/${nic_cfg_file}"
			cat "${file}" >> "${ANA_INSTALL_PATH}/etc/sysconfig/network-scripts/${nic_cfg_file}"
			sed -i -e '/^nameserver\s/d' ${ANA_INSTALL_PATH}/etc/resolv.conf
			echo 'nameserver 127.0.0.1' >> ${ANA_INSTALL_PATH}/etc/resolv.conf
		fi
	done
fi

# Copy dhcpd configuration (generated in pre section above) into installed system
if [ -f /tmp/hvp-dhcpd-conf/dhcpd.conf ]; then
	cp /tmp/hvp-dhcpd-conf/dhcpd.conf ${ANA_INSTALL_PATH}/etc/dhcp/dhcpd.conf
	chmod 644 ${ANA_INSTALL_PATH}/etc/dhcp/dhcpd.conf
	chown root:root ${ANA_INSTALL_PATH}/etc/dhcp/dhcpd.conf
fi

# Copy syslinux configuration (generated in pre section above) into installed system
if [ -f /tmp/hvp-syslinux-conf/common.cfg ]; then
	cp /tmp/hvp-syslinux-conf/common.cfg ${ANA_INSTALL_PATH}/var/lib/tftpboot/common.cfg
	chmod 644 ${ANA_INSTALL_PATH}/var/lib/tftpboot/common.cfg
	chown root:root ${ANA_INSTALL_PATH}/var/lib/tftpboot/common.cfg
fi
if [ -f /tmp/hvp-syslinux-conf/ngn.cfg ]; then
	cp /tmp/hvp-syslinux-conf/ngn.cfg ${ANA_INSTALL_PATH}/var/lib/tftpboot/ngn.cfg
	chmod 644 ${ANA_INSTALL_PATH}/var/lib/tftpboot/ngn.cfg
	chown root:root ${ANA_INSTALL_PATH}/var/lib/tftpboot/ngn.cfg
fi
if [ -f /tmp/hvp-syslinux-conf/host.cfg ]; then
	cp /tmp/hvp-syslinux-conf/host.cfg ${ANA_INSTALL_PATH}/var/lib/tftpboot/host.cfg
	chmod 644 ${ANA_INSTALL_PATH}/var/lib/tftpboot/host.cfg
	chown root:root ${ANA_INSTALL_PATH}/var/lib/tftpboot/host.cfg
fi
if [ -f /tmp/hvp-syslinux-conf/vm.cfg ]; then
	cp /tmp/hvp-syslinux-conf/vm.cfg ${ANA_INSTALL_PATH}/var/lib/tftpboot/vm.cfg
	chmod 644 ${ANA_INSTALL_PATH}/var/lib/tftpboot/vm.cfg
	chown root:root ${ANA_INSTALL_PATH}/var/lib/tftpboot/vm.cfg
fi

# Copy kickstart parameters files (generated in pre section above) into installed system
# Note: the following will overwrite the generic samples mirrored from the HVP site
for parameters_file in /tmp/hvp-syslinux-conf/hvp_parameters*.sh ; do
	if [ -f "${parameters_file}" ]; then
		cp --backup --suffix .orig "${parameters_file}" ${ANA_INSTALL_PATH}/var/www/hvp-repos/el7/ks/
	fi
done
chmod 644 ${ANA_INSTALL_PATH}/var/www/hvp-repos/el7/ks/hvp_parameters*.sh
chown root:root ${ANA_INSTALL_PATH}/var/www/hvp-repos/el7/ks/hvp_parameters*.sh

# Create local installation source tree to support PXE-based installations
if [ -d /run/install/repo/Packages -a -d /run/install/repo/repodata ]; then
	# Copy CentOS repo from DVD image when using that as install source
	cp -r /run/install/repo/{Packages,repodata} ${ANA_INSTALL_PATH}/var/www/hvp-repos/el7/centos/
else
	# Mirror an external repo otherwise
	wget -P ${ANA_INSTALL_PATH}/var/www/hvp-repos/el7/centos -m -np -nH --cut-dirs=4 --retry-connrefused --waitretry=5 --read-timeout=20 -T 15 -c --reject "index.html*" http://mirror.centos.org/centos/7/os/x86_64/Packages
	wget -P ${ANA_INSTALL_PATH}/var/www/hvp-repos/el7/centos -m -np -nH --cut-dirs=4 --retry-connrefused --waitretry=5 --read-timeout=20 -T 15 -c --reject "index.html*" http://mirror.centos.org/centos/7/os/x86_64/repodata
fi

# Copy httpd configuration (generated in pre section above) into installed system
# Note: it should be inserted before the inclusion of /etc/httpd/conf.d/*.conf fragments
# Note: ed is not present in the anaconda environment, while ex is (as part of vim)
if [ -f /tmp/hvp-dhcpd-conf/httpd.conf ]; then
	ex -s ${ANA_INSTALL_PATH}/etc/httpd/conf/httpd.conf <<- EOF
	/^# Supplemental configuration/-r /tmp/hvp-dhcpd-conf/httpd.conf
	w
	q
	EOF
fi

# Copy users setup script (generated in pre section above) into installed system
if [ -f /tmp/hvp-users-conf/rc.users-setup ]; then
	cp /tmp/hvp-users-conf/rc.users-setup ${ANA_INSTALL_PATH}/etc/rc.d/rc.users-setup
	# Note: cleartext passwords contained - must restrict access
	chmod 700 ${ANA_INSTALL_PATH}/etc/rc.d/rc.users-setup
	chown root:root ${ANA_INSTALL_PATH}/etc/rc.d/rc.users-setup
fi

# Copy firewalld setup script (generated in pre section above) into installed system
if [ -f /tmp/hvp-firewalld-conf/rc.firewalld-setup ]; then
	cp /tmp/hvp-firewalld-conf/rc.firewalld-setup ${ANA_INSTALL_PATH}/etc/rc.d/rc.firewalld-setup
	chmod 755 ${ANA_INSTALL_PATH}/etc/rc.d/rc.firewalld-setup
	chown root:root ${ANA_INSTALL_PATH}/etc/rc.d/rc.firewalld-setup
fi

# Copy TCP wrappers configuration (generated in pre section above) into installed system
if [ -f /tmp/hvp-tcp_wrappers-conf/hosts.allow ]; then
	cat /tmp/hvp-tcp_wrappers-conf/hosts.allow >> ${ANA_INSTALL_PATH}/etc/hosts.allow
fi

# Copy Ansible configuration (generated in pre section above) into installed system
if [ -f /tmp/hvp-ansible-files/hosts ]; then
	cat /tmp/hvp-ansible-files/hosts > ${ANA_INSTALL_PATH}/etc/ansible/hosts
fi
if [ -f /tmp/hvp-ansible-files/hvp.yaml ]; then
	cp -f /tmp/hvp-ansible-files/hvp.yaml ${ANA_INSTALL_PATH}/usr/local/etc/hvp-ansible/roles/common/vars/hvp.yaml
	chmod 600 ${ANA_INSTALL_PATH}/usr/local/etc/hvp-ansible/roles/common/vars/hvp.yaml
	chown root:root ${ANA_INSTALL_PATH}/usr/local/etc/hvp-ansible/roles/common/vars/hvp.yaml
fi
if [ -f /tmp/hvp-ansible-files/ad.yaml ]; then
	cp -f /tmp/hvp-ansible-files/ad.yaml ${ANA_INSTALL_PATH}/usr/local/etc/hvp-ansible/roles/common/vars/ad.yaml
	chmod 600 ${ANA_INSTALL_PATH}/usr/local/etc/hvp-ansible/roles/common/vars/ad.yaml
	chown root:root ${ANA_INSTALL_PATH}/usr/local/etc/hvp-ansible/roles/common/vars/ad.yaml
fi
for file in /tmp/hvp-ansible-files/group_vars/* ; do
	if [ -f "${file}" ]; then
		mkdir -p ${ANA_INSTALL_PATH}/etc/ansible/group_vars
		chmod 755 ${ANA_INSTALL_PATH}/etc/ansible/group_vars
		chown root:root ${ANA_INSTALL_PATH}/etc/ansible/group_vars
		cp "${file}" ${ANA_INSTALL_PATH}/etc/ansible/group_vars/
		chmod 600 ${ANA_INSTALL_PATH}/etc/ansible/group_vars/*
		chown root:root ${ANA_INSTALL_PATH}/etc/ansible/group_vars/*
	fi
done

# TODO: perform NetworkManager workaround configuration on interfaces as detected in pre section above - remove when fixed upstream
for file in /tmp/hvp-networkmanager-conf/ifcfg-* ; do
	if [ -f "${file}" ]; then
		cfg_file_name=$(basename "${file}")
		sed -i -e '/^DEFROUTE=/d' -e '/^MTU=/d' "${ANA_INSTALL_PATH}/etc/sysconfig/network-scripts/${cfg_file_name}"
		cat "${file}" >> "${ANA_INSTALL_PATH}/etc/sysconfig/network-scripts/${cfg_file_name}"
	fi
done

# Save exact pre-stage environment
if [ -f /tmp/pre.out ]; then
	cp /tmp/pre.out ${ANA_INSTALL_PATH}/root/log/pre.out
fi
# Save exact post-stage environment
if [ -f ${ANA_INSTALL_PATH}/tmp/post.out ]; then
	cp ${ANA_INSTALL_PATH}/tmp/post.out ${ANA_INSTALL_PATH}/root/log/post.out
fi
# Save installation instructions/logs
# Note: installation logs are now saved under /var/log/anaconda/ by default
cp /run/install/ks.cfg ${ANA_INSTALL_PATH}/root/etc
for full_frag in /tmp/full-* ; do
	if [ -f "${full_frag}" ]; then
		cp "${full_frag}" ${ANA_INSTALL_PATH}/root/etc
	fi
done
cp /tmp/kickstart_*.log ${ANA_INSTALL_PATH}/root/log
mv ${ANA_INSTALL_PATH}/root/kickstart_post*.log ${ANA_INSTALL_PATH}/root/log

) 2>&1 | tee ${ANA_INSTALL_PATH}/root/log/kickstart_post_2.log
%end

# Post-installation script (run with bash from chroot after the third post section)
%post
( # Run the entire post section as a subshell for logging purposes.

# Relabel filesystem
# This has to be the last post action to catch any files we have created/modified
# TODO: verify whether the following is actually needed (latest Anaconda seems to perform a final relabel anyway)
setfiles -F -e /proc -e /sys -e /dev -e /selinux /etc/selinux/targeted/contexts/files/file_contexts /
setfiles -F /etc/selinux/targeted/contexts/files/file_contexts.homedirs /home/ /root/

) 2>&1 | tee /root/log/kickstart_post_3.log
%end
