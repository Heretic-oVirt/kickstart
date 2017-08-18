# Kickstart file for Heretic oVirt Project oVirt-Node physical host
# Note: minimum amount of RAM successfully tested for installation: 1536 MiB (test failed with 1024 MiB)

# Install from PXE with commandline (see below for comments):
# TODO: check each and every custom "hvp_" parameter below for overlap with default dracut/anaconda parameters and convert to using those instead
# TODO: switch to HTTPS as soon as a non-self-signed certificate will be available
# nomodeset elevator=deadline ip=nicname:dhcp inst.stage2=http://dangerous.ovirt.life/hvp-repos/el7/node inst.ks=http://dangerous.ovirt.life/hvp-repos/el7/ks/heretic-ngn.ks hvp_nodeid=[0123]
# Note: nicname is the name of the network interface to be used for installation (eg: ens32) - DHCP is assumed available on that network
# Note: to force custom/predictable nic names add ifname=netN:AA:BB:CC:DD:EE:FF where netN is the desired nic name and AA:BB:CC:DD:EE:FF is the MAC address of the corresponding physical interface (beware: not honored for bond slaves)
# Note: alternatively, to force legacy nic names (ethN), add biosdevname=0 net.ifnames=0
# Note: alternatively burn this kickstart into your oVirt Node image and append to default commandline:
# nomodeset elevator=deadline inst.ks=cdrom:/dev/cdrom:/ks/ks.cfg hvp_nodeid=[0123]
# Note: to access the running installation by SSH (beware of publishing the access informations specified with the sshpw directive below) add the option inst.sshd
# Note: to influence selection of the target disk for node OS installation add hvp_nodeosdisk=AAA where AAA is either the device name (sda, sdb ecc) or a qualifier like first, last, smallest, last-smallest (default)
# Note: to force static nic name-to-MAC mapping add the option hvp_nicmacfix
# Note: to force custom node identity add hvp_nodeid=X where X is the node index
# Note: to force custom addressing add hvp_{mgmt,gluster,lan,internal}=x.x.x.x/yy where x.x.x.x may either be the node IP or the network address on the given network and yy is the prefix on the given network - other node addresses will count up and down from current node IP
# Note: to force custom node bonding mode add hvp_{mgmt,gluster,lan,internal}_bondmode=vvvv where vvvv is the bonding mode, either activepassive, roundrobin (only for gluster) or lacp
# Note: to force custom network MTU add hvp_{mgmt,gluster,lan,internal}_mtu=zzzz where zzzz is the MTU value
# Note: to force custom test IPs add hvp_{mgmt,gluster,lan,internal}_test_ip=t.t.t.t where t.t.t.t is the test IP on the given network
# Note: to force custom switch IP add hvp_switch=p.p.p.p where p.p.p.p is the switch IP
# Note: to force custom network domain naming add hvp_{mgmt,gluster,lan,internal}_domainname=mynet.name where mynet.name is the domain name
# Note: to force custom nameserver IP (during installation) add hvp_nameserver=w.w.w.w where w.w.w.w is the nameserver IP
# Note: to force custom forwarders IPs add hvp_forwarders=forw0,forw1,forw2 where forwN are the forwarders IPs
# Note: to force custom gateway IP add hvp_gateway=n.n.n.n where n.n.n.n is the gateway IP
# Note: to force custom node count add hvp_nodecount=N where N is the number of nodes in the cluster
# Note: to force custom master node identity add hvp_masternodeid=Y where Y is the master node index
# Note: to force custom node naming add hvp_nodename=nodename0,nodename1,nodename2,nodename3 where nodenameN are the unqualified (ie without domain name part) hostnames
# Note: to force custom switch naming add hvp_switchname=myswitchname where myswitchname is the unqualified (ie without domain name part) hostname of the switch management interface
# Note: to force custom engine naming add hvp_enginename=myenginename where myenginename is the unqualified (ie without domain name part) hostname of the Engine
# Note: to force custom storage naming add hvp_storagename=mystoragename where mystoragename is the unqualified (ie without domain name part) hostname of the storage
# Note: to force custom node BMC IP offsets add hvp_bmcs_offset=M where M is the offset
# Note: to force custom node IP offsets add hvp_nodes_offset=L where L is the offset
# Note: to force custom engine IP add hvp_engine=m.m.m.m where m.m.m.m is the engine IP on the mgmt network
# Note: to force custom storage IPs add hvp_storage_offset=o where o is the storage IPs base offset on mgmt/lan/internal networks
# Note: to force custom root password add hvp_rootpwd=mysecret where mysecret is the root user password
# Note: to force custom admin username add hvp_adminname=myadmin where myadmin is the admin username
# Note: to force custom admin password add hvp_adminpwd=myothersecret where myothersecret is the admin user password
# Note: to force custom keyboard layout add hvp_kblayout=cc where cc is the country code
# Note: to force custom local timezone add hvp_timezone=VV where VV is the timezone specification
# Note: the default node OS disk is sda
# Note: the default behaviour does not register fixed nic name-to-MAC mapping
# Note: the default node id is assumed to be 0
# Note: the default addressing on connected networks is assumed to be 172.20.{10,11,12,13}.0/24 on {mgmt,gluster,lan,internal} respectively with nodes addresses starting from 10 (adding node id)
# Note: the default node bonding mode is assumed to be activepassive on mgmt (if there are separate gluster and lan, otherwise lacp) and lacp on {lan,gluster,internal}
# Note: the default MTU is assumed to be 1500 on {mgmt,lan} and 9000 on {gluster,internal}
# Note: the default test IPs are assumed to be the first IPs available (network address + 1) on each connected network
# Note: the default switch IP is assumed to be the 200th IP available (network address + 200) on the mgmt network
# Note: the default domain names are assumed to be {mgmt,gluster,lan,internal}.private
# Note: the default nameserver IP is assumed to be 8.8.8.8 during installation (afterwards it will be switched to 127.0.0.1 unconditionally)
# Note: the default forwarder IP is assumed to be 8.8.8.8
# Note: the default gateway IP is assumed to be equal to the test IP on the mgmt network
# Note: the default node count is 3
# Note: the default master node id is assumed to be 0
# Note: the default node naming uses "My Little Pony" character names {pinkiepie,applejack,rarity,fluttershy} for node ids {0,1,2,3} and nodeN for further ones
# Note: the default switch naming uses the "My Little Pony" character name scootaloo for the switch
# Note: the default engine naming uses the "My Little Pony" character name celestia for the Engine
# Note: the default storage naming uses the "My Little Pony" character name discord for the storage service
# Note: the default nodes BMC IP offset is 100
# Note: the default nodes IP offset is 10
# Note: the default engine IP on the mgmt network is assumed to be the mgmt network address plus 5
# Note: the default storage IPs base offset on mgmt/lan/internal networks is assumed to be the network address plus 30
# Note: the default root user password is hvpdemo
# Note: the default admin username is hvpadmin
# Note: the default admin user password is hvpdemo
# Note: the default keyboard layout is us
# Note: the default local timezone is UTC

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
reboot

# The following replaces any package set composition and their cdrom/url/nfs directives
# Liveimg configuration dynamically generated in pre section below
%include /tmp/full-liveimg

# System localization configuration dynamically generated in pre section below
%include /tmp/full-localization

# Network interface configuration dynamically generated in pre section below
%include /tmp/full-network

# Control "First Boot" interactive tool execution
firstboot --disable
# EULA is implicitly accepted
eula --agreed

# Users configuration dynamically generated in pre section below
%include /tmp/full-users

# Firewall (firewalld) enabled
# Note: the following seems to allow all oVirt Node services (libvirt, VDSM, Cockpit etc.) by default anyway
firewall --enabled
# Configure authentication mode
authconfig --enableshadow --passalgo=sha512
# Leave SELinux on (default will be "targeted" mode)
selinux --enforcing
# Disable kdump
%addon com_redhat_kdump --disable
%end

# Disk configuration dynamically generated in pre section below
%include /tmp/full-disk

# Note: neither repository directives nor packages section for an oVirt Node kickstart (incompatible with liveimg directive above)

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

# Create liveimg setup fragment
# Note: we use a non-local (hd:) stage2 location as indicator of network boot
given_stage2=$(sed -n -e 's/^.*inst\.stage2=\(\S*\).*$/\1/p' /proc/cmdline)
if echo "${given_stage2}" | grep -q '^hd:' ; then
	cat <<- EOF > /tmp/full-liveimg
	# Note: embedded image to be used for cdrom/ISO booting
	liveimg --url=file:///run/install/repo/ovirt-node-ng-image.squashfs.img
	EOF
else
	cat <<- EOF > /tmp/full-liveimg
	# Note: external image to be used for PXE network booting
	# TODO: switch to HTTPS as soon as a non-self-signed certificate will be available
	liveimg --url=http://dangerous.ovirt.life/hvp-repos/el7/node/ovirt-node-ng-image.squashfs.img
	EOF
fi

# Determine OS disk choice
given_nodeosdisk=$(sed -n -e 's/^.*hvp_nodeosdisk=\(\S*\).*$/\1/p' /proc/cmdline)
# Note: we want the devices list alphabetically ordered anyway
all_devices="$(list-harddrives | egrep -v '^(fd|sr)[[:digit:]]*[[:space:]]' | awk '{print $1}' | sort)"
# No indication on OS disk choice: use default choice
if [ -z "${given_nodeosdisk}" ]; then
	given_nodeosdisk="last-smallest"
fi
if [ -b "/dev/${given_nodeosdisk}" ]; then
	# If the given string is a device name then use that
	device_name="${given_nodeosdisk}"
else
	# If the given string is a generic indication then find the proper device
	case "${given_nodeosdisk}" in
		first)
			device_name=$(echo "${all_devices}" | head -1)
			;;
		last)
			device_name=$(echo "${all_devices}" | tail -1)
			;;
		*)
			# Note: we allow for choosing either the first smallest device (default, if only "smallest" has been indicated) or the last one
			case "${given_nodeosdisk}" in
				smallest)
					# If we want the first of the smallests then change the selected device only if the size is strictly smaller
					comparison_logic="-lt"
					;;
				*)
					# In case of unrecognized/unsupported indication use last-smallest as default choice
					# If we want the last of the smallests then keep changing selected device even for the same size
					comparison_logic="-le"
					;;
			esac
			device_name=""
			for current_device in ${all_devices}; do
				current_size=$(blockdev --getsize64 /dev/${current_device})
				if [ -z "${device_name}" ]; then
					device_name="${current_device}"
					device_size="${current_size}"
				else
					if [ ${current_size} ${comparison_logic} ${device_size} ]; then
						device_name="${current_device}"
						device_size="${current_size}"
					fi
				fi
			done
			;;
	esac
fi

# Define all cluster default network data
# Note: engine-related data will only be used for automatic DNS zones configuration
unset node_count
unset network
unset netmask
unset network_base
unset bondopts
unset mtu
unset domain_name
unset reverse_domain_name
unset bridge_name
unset node_name
unset bmc_ip_offset
unset node_ip_offset
unset test_ip_offset
unset switch_ip_offset
unset switch_name
unset engine_name
unset storage_name
unset engine_ip
unset engine_ip_offset
unset storage_ip_offset
unset master_index
unset my_index
unset my_name
unset my_nameserver
unset my_forwarders
unset my_gateway
unset root_password
unset admin_username
unset admin_password
unset keyboard_layout
unset local_timezone

# TODO: perform better consistency check on all commandline-given parameters

# Determine cluster members number
given_node_count=$(sed -n -e 's/^.*hvp_nodecount=\(\S*\).*$/\1/p' /proc/cmdline)
if ! echo "${given_node_count}" | grep -q '^[[:digit:]]\+$' ; then
	node_count="3"
else
	node_count="${given_node_count}"
fi

# Define number of active storage members
# Note: if we have three nodes only, then one (the last one) is an all-arbiter no-I/O node
if [ "${node_count}" -eq 3 ]; then
	active_storage_node_count="2"
else
	active_storage_node_count="${node_count}"
fi

declare -A node_name
node_name[0]="pinkiepie"
node_name[1]="applejack"
node_name[2]="rarity"
node_name[3]="fluttershy"
for ((i=3;i<${node_count};i=i+1)); do
	node_name[${i}]="node${i}"
done

switch_name="scootaloo"

engine_name="celestia"

storage_name="discord"

# Note: IP offsets below get used to automatically derive IP addresses
# Note: no need to allow offset overriding from commandline if the IP address itself can be specified

# Note: the following can be overridden from commandline
test_ip_offset="1"

# Note: the following can be overridden from commandline
switch_ip_offset="200"

# TODO: verify whether the final addresses (network+offset+index) lie inside the network boundaries
# Note: the following can be overridden from commandline
bmc_ip_offset="100"

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

declare -A network netmask network_base bondopts mtu
network['mgmt']="172.20.10.0"
netmask['mgmt']="255.255.255.0"
network_base['mgmt']="172.20.10"
bondopts['mgmt']="mode=active-backup;miimon=100"
mtu['mgmt']="1500"
network['gluster']="172.20.11.0"
netmask['gluster']="255.255.255.0"
network_base['gluster']="172.20.11"
bondopts['gluster']="mode=802.3ad;xmit_hash_policy=layer2+3;miimon=100"
mtu['gluster']="9000"
network['lan']="172.20.12.0"
netmask['lan']="255.255.255.0"
network_base['lan']="172.20.12"
bondopts['lan']="mode=802.3ad;xmit_hash_policy=layer2+3;miimon=100"
mtu['lan']="1500"
network['internal']="172.20.13.0"
netmask['internal']="255.255.255.0"
network_base['internal']="172.20.13"
bondopts['internal']="mode=802.3ad;xmit_hash_policy=layer2+3;miimon=100"
mtu['internal']="9000"

declare -A domain_name
domain_name['mgmt']="mgmt.private"
domain_name['gluster']="gluster.private"
domain_name['lan']="lan.private"
domain_name['internal']="internal.private"

declare -A reverse_domain_name
reverse_domain_name['mgmt']="10.20.172.in-addr.arpa"
reverse_domain_name['gluster']="11.20.172.in-addr.arpa"
reverse_domain_name['lan']="12.20.172.in-addr.arpa"
reverse_domain_name['internal']="13.20.172.in-addr.arpa"

declare -A bridge_name
bridge_name['mgmt']="ovirtmgmt"
bridge_name['gluster']=""
bridge_name['lan']="lan"
bridge_name['internal']="internal"

my_nameserver="8.8.8.8"

my_forwarders="8.8.8.8"

root_password="hvpdemo"
admin_username="hvpadmin"
admin_password="hvpdemo"
keyboard_layout="us"
local_timezone="UTC"

# Determine cluster member identity
my_index=$(sed -n -e 's/^.*hvp_nodeid=\(\S*\).*$/\1/p' /proc/cmdline)
if ! echo "${my_index}" | grep -q '^[[:digit:]]\+$' ; then
	my_index="0"
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
my_name="${node_name[${my_index}]}"

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

# Determine node BMC IPs offset base
given_bmcs_offset=$(sed -n -e 's/^.*hvp_bmcs_offset=\(\S*\).*$/\1/p' /proc/cmdline)
if echo "${given_bmcs_offset}" | grep -q '^[[:digit:]]\+$' ; then
	bmc_ip_offset="${given_bmcs_offset}"
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

# Determine network segments parameters
fixed_mgmt_bondmode="false"
unset my_ip test_ip
declare -A my_ip test_ip
for zone in "${!network[@]}" ; do
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
	unset IPADDR
	IPADDR=$(echo "${given_network}" | sed -n -e 's>^\([^/]*\)/.*$>\1>p')
	if [ -n "${IPADDR}" -a "${IPADDR}" != "${NETWORK}" ]; then
		my_ip["${zone}"]="${IPADDR}"
	else
		my_ip["${zone}"]=$(ipmat $(ipmat ${NETWORK} ${node_ip_offset} +) ${my_index} +)
	fi
	given_network_domain_name=$(sed -n -e "s/^.*hvp_${zone}_domainname=\\(\\S*\\).*\$/\\1/p" /proc/cmdline)
	if [ -n "${given_network_domain_name}" ]; then
		domain_name["${zone}"]="${given_network_domain_name}"
	fi
	given_network_bondmode=$(sed -n -e "s/^.*hvp_${zone}_bondmode=\\(\\S*\\).*\$/\\1/p" /proc/cmdline)
	if [ -n "${given_network_bondmode}" ]; then
		case "${given_network_bondmode}" in
			lacp)
				bondopts["${zone}"]="mode=802.3ad;xmit_hash_policy=layer2+3;miimon=100"
				# Detect whether mgmt network bondmode has been explicitly specified
				if [ "${zone}" = "mgmt" ]; then
					fixed_mgmt_bondmode="true"
				fi
				;;
			roundrobin)
				# Note: roundrobin is supported only on GLUSTER network, otherwise we force activepassive
				if [ "${zone}" = "gluster" ]; then
					bondopts["${zone}"]="mode=balance-rr;miimon=100"
				else
					bondopts["${zone}"]="mode=active-backup;miimon=10"
				fi
				;;
			activepassive)
				bondopts["${zone}"]="mode=active-backup;miimon=100"
				# Detect whether mgmt network bondmode has been explicitly specified
				if [ "${zone}" = "mgmt" ]; then
					fixed_mgmt_bondmode="true"
				fi
				;;
			*)
				# In case of unrecognized mode force activepassive
				bondopts["${zone}"]="mode=active-backup;miimon=100"
				;;
		esac
	fi
	given_network_mtu=$(sed -n -e "s/^.*hvp_${zone}_mtu=\\(\\S*\\).*\$/\\1/p" /proc/cmdline)
	if [ -n "${given_network_mtu}" ]; then
		mtu["${zone}"]="${given_network_mtu}"
	fi
	given_network_test_ip=$(sed -n -e "s/^.*hvp_${zone}_test_ip=\\(\\S*\\).*\$/\\1/p" /proc/cmdline)
	if [ -n "${given_network_test_ip}" ]; then
		test_ip["${zone}"]="${given_network_test_ip}"
	else
		test_ip["${zone}"]=$(ipmat ${NETWORK} ${test_ip_offset} +)
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
if [ -z "${my_gateway}" ]; then
	my_gateway="${test_ip['mgmt']}"
fi

# Determine switch IP
given_switch=$(sed -n -e "s/^.*hvp_switch=\\(\\S*\\).*\$/\\1/p" /proc/cmdline)
if [ -n "${given_switch}" ]; then
	switch_ip="${given_switch}"
else
	switch_ip=$(ipmat $(ipmat $(ipmat ${my_ip['mgmt']} ${my_index} -) ${node_ip_offset} -) ${switch_ip_offset} +)
fi

# Determine engine IP
given_engine=$(sed -n -e 's/^.*hvp_engine=\(\S*\).*$/\1/p' /proc/cmdline)
if [ -n "${given_engine}" ]; then
	engine_ip="${given_engine}"
else
	engine_ip=$(ipmat $(ipmat $(ipmat ${my_ip['mgmt']} ${my_index} -) ${node_ip_offset} -) ${engine_ip_offset} +)
fi

# Disable any interface configured by NetworkManager
# Note: NetworkManager may interfer with interface assignment autodetection logic below
# Note: interfaces will be explicitly activated again by our dynamically created network configuration fragment
for nic_name in $(ls /sys/class/net/ 2>/dev/null | egrep -v '^(bonding_masters|lo|sit[0-9])$' | sort); do
	if nmcli device show "${nic_name}" | grep -q '^GENERAL.STATE:.*(connected)' ; then
		nmcli device disconnect "${nic_name}"
		nmcli connection delete "${nic_name}"
	fi
done

# Determine network interface assignment
# Note: unconnected nics will be disabled
unset nics
declare -A nics
for nic_name in $(ls /sys/class/net/ 2>/dev/null | egrep -v '^(bonding_masters|lo|sit[0-9])$' | sort); do
	# Note: the file below will contain 1 for link up, 0 for link down or will result inaccessible for interface disabled
	if [ "$(cat /sys/class/net/${nic_name}/carrier 2>/dev/null)" = "1" ]; then
		ip addr flush dev "${nic_name}"
		nic_assigned='false'
		for zone in "${!network[@]}" ; do
			# Note: check whether the desired MTU setting can be obtained or not - skip if it fails
			ip link set mtu "${mtu[${zone}]}" dev "${nic_name}"
			res=$?
			effective_mtu=$(cat /sys/class/net/${nic_name}/mtu 2>/dev/null)
			if [ ${res} -ne 0 -o "${effective_mtu}" != "${mtu[${zone}]}" ] ; then
				ip addr flush dev "${nic_name}"
				continue
			fi
			unset PREFIX
			eval $(ipcalc -s -p "${network[${zone}]}" "${netmask[${zone}]}")
			ip addr add "${my_ip[${zone}]}/${PREFIX}" dev "${nic_name}"
			res=$?
			if [ ${res} -ne 0 ] ; then
				ip addr flush dev "${nic_name}"
				continue
			fi
			if ping -c 3 -w 8 -i 2 "${test_ip[${zone}]}" > /dev/null 2>&1 ; then
				nics["${zone}"]="${nics[${zone}]} ${nic_name}"
				nic_assigned='true'
				ip addr flush dev "${nic_name}"
				break
			fi
			ip addr flush dev "${nic_name}"
		done
		if [ "${nic_assigned}" = "false" ]; then
			nics['unused']="${nics['unused']} ${nic_name}"
		fi
	else
		nics['unused']="${nics['unused']} ${nic_name}"
	fi
done

# TODO: Perform nic connections consistency check
# Note: with one network it must be mgmt
# Note: with two networks they must be mgmt and gluster
# Note: with three networks they must be mgmt, gluster and lan
# Note: with four networks they must be mgmt, gluster, lan and internal

# Remove my_ip/test_ip, network/netmask/network_base/bondopts/mtu and domain_name/reverse_domain_name entries for non-existent networks
for zone in "${!network[@]}" ; do
	if [ -z "${nics[${zone}]}" ]; then
		unset my_ip[${zone}]
		unset test_ip[${zone}]
		unset network[${zone}]
		unset netmask[${zone}]
		unset network_base[${zone}]
		unset bondopts[${zone}]
		unset mtu[${zone}]
		unset domain_name[${zone}]
		unset reverse_domain_name[${zone}]
	fi
done

# Adapt bonding mode to network setup
# Note: if not explicitly configured, mgmt network bonding mode is activepassive if there are separate gluster and lan networks, otherwise lacp
if [ "${fixed_mgmt_bondmode}" = "false" ]; then
	if [ -n "${nics['gluster']}" -a -n "${nics['lan']}" ]; then
		bondopts['mgmt']="mode=active-backup;miimon=100"
	else
		bondopts['mgmt']="mode=802.3ad;xmit_hash_policy=layer2+3;miimon=100"
	fi
fi

# Determine network segment identity
if [ -n "${nics['gluster']}" ]; then
	gluster_zone="gluster"
else
	gluster_zone="mgmt"
fi


# Create network setup fragment
# Note: dynamically created here to make use of full autodiscovery above
# Note: defining statically configured single/bonded access to autodetected networks
cat << EOF > /tmp/full-network
# Network device configuration - static version (always verify that your nic is supported by install kernel/modules)
# Use a "void" configuration to make sure anaconda quickly steps over "onboot=no" devices
EOF
bond_index="0"
for zone in $(echo "${!network[@]}" | tr ' ' '\n' | sort -r); do
	if [ -n "${nics[${zone}]}" ]; then
		nics_number=$(echo ${nics[${zone}]} | wc -w)
		nic_names=$(echo ${nics[${zone}]} | sed -e 's/^\s*//' -e 's/\s*$//')
		further_options=""
		# Add gateway and nameserver options only if the default gateway is on this network
		unset NETWORK
		eval $(ipcalc -s -n "${my_gateway}" "${netmask[${zone}]}")
		if [ "${NETWORK}" = "${network[${zone}]}" ]; then
			further_options="${further_options} --gateway=${my_gateway} --nameserver=${my_nameserver}"
		else
			further_options="${further_options} --nodefroute"
		fi
		# Add hostname option on the mgmt zone only
		# Note: oVirt requires the node hostname to be on the ovirtmgmt network
		if [ "${zone}" = "mgmt" ]; then
			further_options="${further_options} --hostname=${my_name}.${domain_name[${zone}]}"
		fi
		if [ "${nics_number}" -eq 1 ]; then
			# Single (plain) interface
			cat <<- EOF >> /tmp/full-network
			network --device=${nic_names} --activate --onboot=yes --bootproto=static --ip=${my_ip[${zone}]} --netmask=${netmask[${zone}]} --mtu=${mtu[${zone}]} ${further_options}
			EOF
		else
			cat <<- EOF >> /tmp/full-network
			network --device=bond${bond_index} --bondslaves=$(echo "${nic_names}" | sed -e 's/ /,/g') --bondopts=${bondopts[${zone}]} --activate --onboot=yes --bootproto=static --ip=${my_ip[${zone}]} --netmask=${netmask[${zone}]} --mtu=${mtu[${zone}]} ${further_options}
			EOF
			# Note: saving actual interface (bond) name for further use below
			nics[${zone}]="bond${bond_index}"
			bond_index=$((bond_index+1))
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

# Create users setup fragment
cat << EOF > /tmp/full-users
# Use given username and password for SSH access to installation
# Note: you must add inst.sshd to installation commandline for the following to have any effect
sshpw --username=${admin_username} ${admin_password} --plaintext
# Define root password
rootpw ${root_password}
# Create an unprivileged user
user --name=${admin_username} --password=${admin_password} --plaintext --gecos=Admin
EOF
# Prepare users configuration script to be run at first boot
mkdir -p /tmp/hvp-users-conf
cat << EOF > /tmp/hvp-users-conf/rc.users-setup
#!/bin/bash
# Configure email aliases (divert root email to administrative account)
sed -i -e 's/^#\\s*root.*\$/root:\\t\\t${admin_username}/' /etc/aliases
cat << EOM >> /etc/aliases

# Email alias for server monitoring
monitoring:	${admin_username}

EOM
newaliases
EOF

# Create localization setup fragment
cat << EOF > /tmp/full-localization
# Default system language
lang en_US.UTF-8
# Keyboard layout
keyboard --vckeymap=${keyboard_layout}
# Configure time zone (NTP details demanded to post section)
timezone ${local_timezone} --isUtc
EOF

# Create disk setup fragment
cat << EOF > /tmp/full-disk
# oVirt Node hyperconverged disk configuration: there will surely be multiple SCSI/SATA disks but only one will be used for OS
# Initialize partition table (GPT) on all available disks
clearpart --all --initlabel --disklabel=gpt
# Bootloader placed on MBR, with 3 seconds waiting, without password protection, disabling high res text console, disabling CPU C-states and with I/O scheduler optimized for a virtualization/storage server
bootloader --location=mbr --timeout=3 --append="nomodeset elevator=deadline processor.max_cstate=1 intel_idle.max_cstate=0"
# Ignore further disks
# Note: further disks will be used as bricks later on
ignoredisk --only-use=${device_name}
# Either all automatic...
#autopart --type=thinp
# ...or explicitly detailed as per https://github.com/oVirt/ovirt-node-ng/blob/master/docs/book/install.md and https://bugzilla.redhat.com/show_bug.cgi?id=1369874
# Automatically create UEFI or BIOS boot partition depending on hardware capabilities
reqpart --add-boot
# Note: the following uses only the first disk as PV and leaves other disks unused if the first one is sufficiently big, otherwise starts using other disks too
part pv.01 --size=42000 --grow
# Create a VG
volgroup HostVG pv.01
# Define swap space
logvol swap --vgname=HostVG --name=swap --fstype=swap --recommended
# Define thin provisioned LVs
logvol none --vgname=HostVG --name=HostPool --thinpool --size=40000 --grow
# Note: ext4 is required for oVirt Node by imgbased software
logvol / --vgname=HostVG --name=root --thin --fstype=ext4 --poolname=HostPool --fsoptions="defaults,discard" --size=6000 --grow
logvol /var --vgname=HostVG --name=var --thin --fstype=ext4 --poolname=HostPool --fsoptions="defaults,discard" --size=15000
logvol /var/log --vgname=HostVG --name=var_log --thin --fstype=ext4 --poolname=HostPool --fsoptions="defaults,discard" --size=8000
logvol /var/log/audit --vgname=HostVG --name=var_audit --thin --fstype=ext4 --poolname=HostPool --fsoptions="defaults,discard" --size=2000
logvol /home --vgname=HostVG --name=home --thin --fstype=ext4 --poolname=HostPool --fsoptions="defaults,discard" --size=1000
logvol /tmp --vgname=HostVG --name=tmp --thin --fstype=ext4 --poolname=HostPool --fsoptions="defaults,discard" --size=1000
EOF
# Clean up disks from any previous software-RAID (Linux or BIOS based)
# TODO: this does not work on CentOS7 (it would need some sort of late disk-status refresh induced inside anaconda) - workaround by manually zeroing-out the first 10 MiBs from a rescue boot before starting the install process (or simply restarting when installation stops/hangs at storage setup)
# Note: skipping this on a virtual machine to avoid inflating a thin-provisioned virtual disk
# Note: dmidecode command may no longer be available in pre environment
if cat /sys/class/dmi/id/sys_vendor | egrep -q -v "(Microsoft|VMware|innotek|Parallels|Red.*Hat|oVirt|Xen)" ; then
	# Note: resetting all disk devices since leftover LVM configurations may interfer with installation and/or setup later on
	for current_device in ${all_devices}; do
		dd if=/dev/zero of=/dev/${current_device} bs=1M count=10
		dd if=/dev/zero of=/dev/${current_device} bs=1M count=10 seek=$(($(blockdev --getsize64 /dev/${current_device}) / (1024 * 1024) - 10))
	done
fi

# Create bind zone files if running on master node
if [ "${my_index}" -eq "${master_index}" ]; then
	mkdir -p /tmp/hvp-bind-zones/dynamic
	pushd /tmp/hvp-bind-zones/dynamic
	for zone in "${!network[@]}" ; do
		cat <<- EOF > ${domain_name[${zone}]}.db
		\$ORIGIN ${domain_name[${zone}]}.
		\$TTL 15552000
		@		IN	SOA	${node_name[${master_index}]}.${domain_name['mgmt']}. root.${node_name[${master_index}]}.${domain_name['mgmt']}. (
		                         $(date '+%Y%m%d')01 ; serial
		                         3600 ; refresh
		                         900 ; retry
		                         1209600 ; expire
		                         43200 ; default_ttl
		                         )
		@			NS	${node_name[${master_index}]}.${domain_name['mgmt']}.
		
		; Names for static addresses assigned to our virtual/physical machines
		
		EOF
		# Note: switch, engine and BMCs are connected only on the MGMT network
		if [ "${zone}" = "mgmt" ]; then
			cat <<- EOF >> ${domain_name[${zone}]}.db
			${switch_name}		A	${switch_ip}
			${engine_name}		A	${engine_ip}
			EOF
			for ((i=0;i<${node_count};i=i+1)); do
				cat <<- EOF >> ${domain_name[${zone}]}.db
				${node_name[${i}]}bmc		A	$(ipmat $(ipmat $(ipmat $(ipmat ${my_ip[${zone}]} ${my_index} -) ${node_ip_offset} -) ${bmc_ip_offset} +) ${i} +)
				EOF
			done
		fi
		for ((i=0;i<${node_count};i=i+1)); do
			cat <<- EOF >> ${domain_name[${zone}]}.db
			${node_name[${i}]}		A	$(ipmat $(ipmat ${my_ip[${zone}]} ${my_index} -) ${i} +)
			EOF
		done
		# Add round-robin-resolved name for CTDB-controlled NFS/CIFS services on lan/internal/mgmt zones (depending on actual network availability)
		# Note: registered with a TTL of 1 to enhance round-robin load balancing
		if [ "${zone}" = "lan" -o "${zone}" = "internal" -o "${zone}" = "mgmt" -a -z "${network['lan']}" ]; then
			for ((i=0;i<${active_storage_node_count};i=i+1)); do
				cat <<- EOF >> ${domain_name[${zone}]}.db
				${storage_name}	1 IN	A	$(ipmat $(ipmat $(ipmat $(ipmat ${my_ip[${zone}]} ${my_index} -) ${node_ip_offset} -) ${storage_ip_offset} +) ${i} +)
				EOF
			done
		fi
		cat <<- EOF > ${reverse_domain_name[${zone}]}.db
		\$ORIGIN ${reverse_domain_name[${zone}]}.
		\$TTL 15552000
		@		IN	SOA	${node_name[${master_index}]}.${domain_name['mgmt']}. root.${node_name[${master_index}]}.${domain_name['mgmt']}. (
		                         $(date '+%Y%m%d')01 ; serial
		                         3600 ; refresh
		                         900 ; retry
		                         1209600 ; expire
		                         43200 ; default_ttl
		                         )
		@		IN	NS	${node_name[${master_index}]}.${domain_name['mgmt']}.
		
		; Static addresses assigned to our virtual/physical machines
		
		EOF
		# Note: switch, engine and BMCs are connected only on the MGMT network
		if [ "${zone}" = "mgmt" ]; then
			cat <<- EOF >> ${reverse_domain_name[${zone}]}.db
			$(echo ${switch_ip} | sed -e "s/^$(echo ${network_base[${zone}]} | sed -e 's/[.]/\\./g')[.]//")		IN	PTR	${switch_name}.${domain_name[${zone}]}.
			$(echo ${engine_ip} | sed -e "s/^$(echo ${network_base[${zone}]} | sed -e 's/[.]/\\./g')[.]//")		IN	PTR	${engine_name}.${domain_name[${zone}]}.
			EOF
			for ((i=0;i<${node_count};i=i+1)); do
				cat <<- EOF >> ${reverse_domain_name[${zone}]}.db
				$(ipmat $(ipmat $(ipmat $(ipmat ${my_ip[${zone}]} ${my_index} -) ${node_ip_offset} -) ${bmc_ip_offset} +) ${i} + | sed -e "s/^$(echo ${network_base[${zone}]} | sed -e 's/[.]/\\./g')[.]//")		IN	PTR	${node_name[${i}]}bmc.${domain_name[${zone}]}.
				EOF
			done
		fi
		for ((i=0;i<${node_count};i=i+1)); do
			cat <<- EOF >> ${reverse_domain_name[${zone}]}.db
			$(ipmat $(ipmat ${my_ip[${zone}]} ${my_index} -) ${i} + | sed -e "s/^$(echo ${network_base[${zone}]} | sed -e 's/[.]/\\./g')[.]//")		IN	PTR	${node_name[${i}]}.${domain_name[${zone}]}.
			EOF
		done
		# Add round-robin-resolved IPs for CTDB-controlled NFS/CIFS services on lan/internal/mgmt zones (depending on actual network availability)
		if [ "${zone}" = "lan" -o "${zone}" = "internal" -o "${zone}" = "mgmt" -a -z "${network['lan']}" ]; then
			for ((i=0;i<${active_storage_node_count};i=i+1)); do
				cat <<- EOF >> ${reverse_domain_name[${zone}]}.db
				$(ipmat $(ipmat $(ipmat $(ipmat ${my_ip[${zone}]} ${my_index} -) ${node_ip_offset} -) ${storage_ip_offset} +) ${i} + | sed -e "s/^$(echo ${network_base[${zone}]} | sed -e 's/[.]/\\./g')[.]//")		IN	PTR	${storage_name}.${domain_name[${zone}]}.
				EOF
			done
		fi
	done
	popd
	my_role="master"
	my_options="// allow-update { key ddns_key; };"
	file_location="dynamic"
else
	my_role="slave"
	master_ip=$(ipmat $(ipmat ${my_ip['mgmt']} ${my_index} -) ${master_index} +)
	my_options="masters { ${master_ip}; };"
	file_location="slaves"
fi
# Use information gathered above to create bind configuration file
mkdir -p /tmp/hvp-bind-zones
pushd /tmp/hvp-bind-zones
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

EOF
for zone in "${!network[@]}" ; do
	cat <<- EOF >> named.conf
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
done
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

EOF
for zone in "${!network[@]}" ; do
	cat <<- EOF >> named.conf
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
done
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

# Cluster related names

EOF
for zone in "${!network[@]}" ; do
	if [ "${zone}" = "mgmt" ]; then
		# Note: switch and engine are connected only on the mgmt network
		cat <<- EOF >> hosts
		${switch_ip}	${switch_name}.${domain_name[${zone}]}
		${engine_ip}	${engine_name}.${domain_name[${zone}]}
		EOF
	fi
	for ((i=0;i<${node_count};i=i+1)); do
		cat <<- EOF >> hosts
		$(ipmat $(ipmat ${my_ip[${zone}]} ${my_index} -) ${i} +)	${node_name[${i}]}.${domain_name[${zone}]}
		EOF
	done
done
popd

# Prepare CTDB files to be copied later on below
mkdir -p /tmp/hvp-ctdb-files
pushd /tmp/hvp-ctdb-files

# Create nodes and addresses files for CTDB
for zone in "${!network[@]}" ; do
	# CTDB will use mgmt network for communication
	if [ "${zone}" = "mgmt" ]; then
		for ((i=0;i<${node_count};i=i+1)); do
			cat <<- EOF >> nodes
			$(ipmat $(ipmat ${my_ip[${zone}]} ${my_index} -) ${i} +)
			EOF
		done
	fi
	# Only active storage nodes can receive shared storage IPs
	if [ "${my_index}" -le $((${active_storage_node_count}-1)) ]; then
		# Add round-robin-resolved IPs for CTDB-controlled NFS/CIFS services on lan/internal/mgmt zones (depending on actual network availability)
		if [ "${zone}" = "lan" -o "${zone}" = "internal" -o "${zone}" = "mgmt" -a -z "${network['lan']}" ]; then
			unset PREFIX
			eval $(ipcalc -s -p "${network[${zone}]}" "${netmask[${zone}]}")
			for ((i=0;i<${active_storage_node_count};i=i+1)); do
				cat <<- EOF >> public_addresses
				$(ipmat $(ipmat $(ipmat $(ipmat ${my_ip[${zone}]} ${my_index} -) ${node_ip_offset} -) ${storage_ip_offset} +) ${i} +)/${PREFIX} ${bridge_name[${zone}]}
				EOF
			done
		fi
	fi
done

# Create mount systemd unit to add mountpoint for shared CTDB area
# Note: systemd doesn't recognize the directives Restart, RestartSec and TimeoutStartSec in Mount units
# Note: alternatively we could configure /var/lib/glusterd/hooks/1/{start/post/S29CTDBsetup.sh,stop/pre/S29CTDB-teardown.sh}
# TODO: verify whether the selinux option is actually supported - https://bugzilla.redhat.com/show_bug.cgi?id=1272868
cat << EOF > gluster-lock.mount
[Unit]
Description=CTDB shared area
After=glusterd.service
Requires=glusterd.service
Before=ctdb.service multi-user.target

[Mount]
What=${node_name[${my_index}]}.${domain_name[${gluster_zone}]}:ctdb
Where=/gluster/lock
Type=glusterfs
Options=acl,selinux,_netdev,xlator-option=*client*.ping-timeout=10
TimeoutSec=50s

[Install]
WantedBy=ctdb.service multi-user.target
EOF

popd

# Prepare CTDB files to be copied later on below
mkdir -p /tmp/hvp-samba-files
pushd /tmp/hvp-samba-files

# Create sample Samba configuration
# TODO: a proper configuration (AD domain member etc.) should be pushed by means of Ansible once the whole infrastructure is up and running
cat << EOF > smb.conf
[global]
   server string = Workgroup File Server
   netbios name = $(echo "${storage_name}" | awk '{print toupper($0)}')
   workgroup = WORKGROUP
   security = user
   bind interfaces only = no
   clustering = yes
   ctdbd socket = /run/ctdb/ctdbd.socket
   private dir = /gluster/lock

   passdb backend = tdbsam

   load printers = no
   printing = bsd
   printcap name = /dev/null
   disable spoolss = yes
   show add printer wizard = no
   cups options = raw

   map to guest = Bad user
   username map = /etc/samba/smbusers
   store dos attributes = no
   map acl inherit = no
   dos filemode = no
   dos filetime resolution = yes
   create mask = 0664
   force create mode = 440
   directory mask = 6775
   force directory mode = 550
   unix extensions = no
   hide special files = yes
   dead time = 15
   preserve case = yes
   short preserve case = yes
   default case = lower
   case sensitive = no
   max protocol = SMB3
   kernel share modes = no
   locking = yes
   strict locking = no
   oplocks = no
   level2 oplocks = no
   kernel oplocks = no
   stat cache = no
   max open files = 16404

[IPC\$]
   comment = Remote IPC
   path = /tmp


#====================== Local Share Definitions ==============================

[Test]
   comment = Test share
   path = /
   browseable = yes
   writable = yes
   available = yes
   guest ok = yes
   vfs objects = glusterfs recycle
   recycle:keeptree = no
   recycle:versions = yes
   #glusterfs:loglevel = 7
   #glusterfs:logfile = /var/log/samba/glusterfs-shares.log
   glusterfs:volume = winshare

EOF

popd

) 2>&1 | tee /tmp/kickstart_pre.log
%end

# Post-installation script (run with bash from chroot at the end of installation)
%post

( # Run the entire post section as a subshell for logging purposes.

script_version="2017081201"

# Report kickstart version for reference purposes
logger -s -p "local7.info" -t "kickstart-post" "Kickstarting for $(cat /etc/system-release) - version ${script_version}"
# Report kernel commandline for reference purposes
logger -s -p "local7.info" -t "kickstart-post" "Kickstarting with kernel commandline: $(cat /proc/cmdline)"

# TODO: the following should be embedded in a custom-rebuilt oVirt Node image

# Note: NetworkManager correctly updates /etc/resolv.conf inside the installation root even when in DHCP mode

# Note: no need to explicitly set machine time with newer systemd/chrony installation environment

# Force sane language defaults for safe command output parsing
export LANG=C LC_ALL=C
# Set the hostname for apps that need it
# Note: hostnamectl would not work inside the installation chroot
export HOSTNAME=$(cat /etc/hostname)
hostname $HOSTNAME

# Set the homedir for apps that need it
export HOME="/root"

# Determine cluster member identity
unset my_index
my_index=$(sed -n -e 's/^.*hvp_nodeid=\(\S*\).*$/\1/p' /proc/cmdline)
if ! echo "${my_index}" | grep -q '^[[:digit:]]\+$' ; then
	my_index="0"
fi

# Determine master node identity
unset master_index
master_index="0"
given_master_index=$(sed -n -e 's/^.*hvp_masternodeid=\(\S*\).*$/\1/p' /proc/cmdline)
if echo "${given_master_index}" | grep -q '^[[:digit:]]\+$' ; then
	master_index="${given_master_index}"
fi

# Correctly initialize YUM cache to avoid 404 errors
# Note: following advice in https://access.redhat.com/articles/1320623
# TODO: remove when fixed upstream
rm -rf /var/cache/yum/*
yum --enablerepo '*' clean all

# Comment out mirrorlist directives and uncomment the baseurl ones to make better use of proxy caches
# TODO: investigate whether to disable fastestmirror yum plugin too (may interfer in round-robin-DNS-served names?)
sed -i -e '/^mirrorlist=/s/^/#/g' -e '/^#baseurl=/s/^#//g' /etc/yum.repos.d/CentOS-Base.repo

# Enable EPEL
yum -y --enablerepo extras install epel-release
# Limit EPEL as per oVirt recommendations
yum-config-manager --save --setopt='epel.exclude=collectd*' > /dev/null
# Comment out mirrorlist directives and uncomment the baseurl ones to make better use of proxy caches
sed -i -e '/^mirrorlist=/s/^/#/g' -e '/^#baseurl=/s/^#//g' /etc/yum.repos.d/epel.repo

# Install HAVEGEd
# Note: even in presence of an actual hardware random number generator (managed by rngd) we install haveged as a safety measure
yum -y install haveged

# Add HVP custom repo
yum -y --enablerepo base --enablerepo updates install wget
# TODO: switch to HTTPS as soon as a non-self-signed certificate will be available
wget -P /etc/yum.repos.d http://dangerous.ovirt.life/hvp-repos/el7/HVP.repo
chmod 644 /etc/yum.repos.d/HVP.repo

# Install custom packages for NAS functions
yum -y --enablerepo base --enablerepo updates install krb5-workstation samba samba-client samba-winbind samba-winbind-clients samba-winbind-krb5-locator samba-vfs-glusterfs ctdb nfs-ganesha gstatus
# TODO: Install Gluster-block and its dependencies (must replace some packages in base with recompiled newer Fedora versions or wait for RHEL7.4-compatible bits in RHGS)
#yum -y --enablerepo base --enablerepo updates --enablerepo hvp-fedora-rebuild install gluster-block

# Install custom packages for OVN functions
# Note: we explicitly add OpenvSwitch to force updating it if needed
yum -y --enablerepo base --enablerepo updates install ovirt-provider-ovn-driver openvswitch

# Install oVirt Engine appliance (on master node only)
if [ "${my_index}" = "${master_index}" ]; then
	yum -y install ovirt-engine-appliance
fi

# Install further packages for additional functions: Bind
yum -y --enablerepo base --enablerepo updates install bind

# Rebase to GlusterFS packages from HVP repo (recompiled RHGS version)
# Note: gdeploy is older in HVP repo
yum -y --disablerepo '*' --enablerepo hvp-rhgs-rebuild distribution-synchronization 'glusterfs*' gdeploy

# Clean up after all installations
yum --enablerepo '*' clean all

# TODO: Decide which part to configure here and which part to demand to Ansible

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

# Enable HAVEGEd
systemctl enable haveged

# Note: users configuration script generated in pre section above and copied in second post section below

# Conditionally force static the nic name<->MAC mapping to work around hardware bugs (eg nic "autoshifting" on some HP MicroServer G7)
if grep -w -q 'hvp_nicmacfix' /proc/cmdline ; then
	for nic_cfg in /etc/sysconfig/network-scripts/ifcfg-* ; do
		eval $(grep '^DEVICE=' "${nic_cfg}")
		nic_name="${DEVICE}"
		if echo "${nic_name}" | egrep -q '^(bond|lo|br|sit)' ; then
			continue
		fi
		nic_mac=$(cat "/sys/class/net/${nic_name}/address" 2>/dev/null)
		# Detect bonding slaves (real MAC address must be specially extracted)
		if [ -L "/sys/class/net/${nic_name}/master" ]; then
			nic_master=$(stat --printf="%N" "/sys/class/net/${nic_name}/master" | sed -e "s%^.*-> \`.*/net/\\([^']*\\)'.*\$%\\1%")
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

# Configure CTDB
# Note: CTDB is needed for HA NFS/CIFS storage domain
# Note: /gluster/lock gets created/mounted by Gluster hook scripts - we disable those but keep using the standard path
# TODO: determine whether Samba/Ganesha should start on inactive nodes
# TODO: enable Winbind when switching to AD domain member mode
sed -i -e 's>^#*\s*CTDB_RECOVERY_LOCK=.*$>CTDB_RECOVERY_LOCK=/gluster/lock/lockfile>' /etc/sysconfig/ctdb
#sed -i -e 's/^#*\s*CTDB_MANAGES_SAMBA=.*$/CTDB_MANAGES_SAMBA=yes\nCTDB_MANAGES_WINBIND=yes/' /etc/sysconfig/ctdb
# Skip CTDB check of paths (not valid/needed with GlusterFS)
sed -i -e 's/^#*\s*CTDB_SAMBA_SKIP_SHARE_CHECK=.*$/CTDB_SAMBA_SKIP_SHARE_CHECK=yes/' /etc/sysconfig/ctdb
cat << EOF >> /etc/sysconfig/ctdb
CTDB_SET_DeterministicIPs=1
CTDB_SET_RecoveryBanPeriod=120
CTDB_SET_TraverseTimeout=60
# Set CTDB socket location
CTDB_SOCKET=/run/ctdb/ctdbd.socket
EOF

# Note: hosts and addresses configuration files created in pre section above and copied in second post section below

# Note: a mount systemd unit for CTDB shared lock area created in pre section above and copied in second post section below
mkdir -p /gluster/lock

# Note: adding a glusterd-wait-online service to avoid random failures on global cluster reboot
# Note: alternatively we could configure /var/lib/glusterd/hooks/1/{start/post/S29CTDBsetup.sh,stop/pre/S29CTDB-teardown.sh}
cat << EOF > /etc/systemd/system/gluster-ctdb-wait-online.service
[Unit]
Description=Gluster CTDB Volume Wait Online
Requires=glusterd.service
After=glusterd.service
Before=gluster-lock.mount

[Service]
Type=oneshot
ExecStart=/usr/local/sbin/gluster-volume-wait ctdb
TimeoutStartSec=50s

[Install]
WantedBy=gluster-lock.mount
EOF
chmod 644 /etc/systemd/system/gluster-ctdb-wait-online.service
cat << EOF > /usr/local/sbin/gluster-volume-wait
#!/bin/bash
result="255"
trap 'exit \${result}' SIGHUP SIGINT SIGQUIT SIGTERM
while [ \${result} != 0 ]; do
	sleep 3
	/usr/sbin/gluster volume status \$1 > /dev/null 2>&1
	result=\$?
done
exit \${result}
EOF
chmod 755 /usr/local/sbin/gluster-volume-wait

# TODO: enable after initializing GlusterFS
systemctl disable gluster-ctdb-wait-online.service

# Modify CTDB service to force dependency on shared locking area and realtime bandwidth availability
# TODO: verify restart-mode reconfiguration
mkdir -p /etc/systemd/system/ctdb.service.d
cat << EOF > /etc/systemd/system/ctdb.service.d/custom-dependencies.conf

[Unit]
After=gluster-lock.mount cgroup-rt-bandwidth.service
Requires=gluster-lock.mount cgroup-rt-bandwidth.service

[Service]
Restart=on-failure
CPUSchedulingPolicy=fifo

EOF
chmod 644 /etc/systemd/system/ctdb.service.d/custom-dependencies.conf

# Add custom unit to add realtime bandwidth shares required by CTDB to use SCHED_FIFO scheduler
# Note: see https://bugzilla.redhat.com/show_bug.cgi?id=1201952 http://www.linuxquestions.org/questions/centos-111/running-ctdb-in-an-lxc-container-4175549857/ http://systemd-devel.freedesktop.narkive.com/YoWYF8EI/set-cgroup-attributes-not-supported-by-systemd-what-do-you-recommend
# TODO: remove when supported explicitly in systemd
cat << EOF > /etc/systemd/system/cgroup-rt-bandwidth.service
[Unit]
Description=Set apart RT bandwidth in cgroup hierarchy
Before=ctdb.service multi-user.target

[Service]
ExecStart=/usr/bin/bash -c '/usr/bin/echo 10000 > /sys/fs/cgroup/cpu/gluster.slice/cpu.rt_runtime_us'

[Install]
WantedBy=ctdb.service multi-user.target
EOF
chmod 644 /etc/systemd/system/cgroup-rt-bandwidth.service

# TODO: enable after initializing GlusterFS
systemctl disable cgroup-rt-bandwidth.service

# Add firewalld configuration for CTDB
cat << EOF > /etc/firewalld/services/ctdb.xml
<?xml version="1.0" encoding="utf-8"?>
<service>
  <short>ctdb</short>
  <description>Clustered TDB.</description>
  <port protocol="tcp" port="4379"/>
</service>
EOF
chmod 644 /etc/firewalld/services/ctdb.xml

# TODO: Enable CTDB
# TODO: enable after initializing GlusterFS
firewall-offline-cmd --add-service=ctdb
systemctl disable ctdb

# Configure Samba

# Note: Samba main configuration file created in pre section above and copied in second post section below
cp /etc/samba/smb.conf /etc/samba/smb.conf.orig

# Username mappings
cat << EOF > /etc/samba/smbusers
# Unix_name = SMB_name1 SMB_name2 ...
root = administrator admin
EOF
chmod 644 /etc/samba/smbusers

# TODO: Rise user limits to avoid (benign) warning by testparm on max files
# TODO: the following causes Cockpit login to fail with SELinux denial while trying to raise limits - find a workaround (maybe custom SELinux policy)
#cat << EOF > /etc/security/limits.d/10-smb.conf
## Make sure that Samba/testparm does not complain about max files
#*                -       nofile          16405
#
#EOF
#chmod 644 /etc/security/limits.d/10-smb.conf

# Disable Samba services (will be managed by CTDB anyway)
for service in smb nmb winbind; do
	systemctl disable ${service}
done

# Allow network traffic related to Samba
firewall-offline-cmd --add-service=samba

# TODO: configure Ganesha-NFS

# TODO: configure Gluster-block

# TODO: Lower VDSM log level
# Note: putting it on WARNING level as already per libvirt default
#sed -i -r -e 's/(DEBUG|INFO)/WARNING/' /etc/vdsm/logger.conf
#sed -i -r -e 's/(DEBUG|INFO)/WARNING/' /etc/vdsm/svdsm.logger.conf
# TODO: Lower oVirt HE HA agent/broker log level
#sed -i -r -e 's/(DEBUG|INFO)/WARNING/' /etc/ovirt-hosted-engine-ha/agent-log.conf
#sed -i -r -e 's/(DEBUG|INFO)/WARNING/' /etc/ovirt-hosted-engine-ha/broker-log.conf

# TODO: Lower GlusterFS log level
#sed -i -e 's/^#*\s*LOG_LEVEL=.*$/LOG_LEVEL=WARNING/' /etc/sysconfig/glusterd

# Limit GlusterFS/Samba/Ganesha resource usage by means of cgroup using systemd slices
# Note: the following applies to both glusterd and glusterfsd (the latter being started on demand by the former) by means of the settings below
# TODO: verify whether to use CPUQuota=400% instead of CPUShares
cat << EOF > /etc/systemd/system/storage.slice
[Unit]
Description=Storage services Slice
Documentation=man:systemd.special(7)
DefaultDependencies=no
Before=slices.target
Wants=-.slice
After=-.slice

[Slice]
CPUAccounting=on
CPUShares=4096
EOF
chmod 644 /etc/systemd/system/storage.slice

# Put GlusterFS services under proper cgroup control (configured above)
# Note: the following applies to both glusterd and glusterfsd (the latter being started on demand by the former)
mkdir -p /etc/systemd/system/glusterd.service.d
cat << EOF > /etc/systemd/system/glusterd.service.d/custom-slice.conf

[Service]
Slice=storage.slice

EOF
chmod 644 /etc/systemd/system/glusterd.service.d/custom-slice.conf

# Put CTDB controlled services under proper cgroup control (the GlusterFS slice configured above)
# TODO: verify whether the following applies to both ctdb and smbd/nmbd/winbindd/nfs-ganesha and remove specific smbd/nmbd/winbindd/nfs-ganesha fragments if not needed
mkdir -p /etc/systemd/system/ctdb.service.d
cat << EOF > /etc/systemd/system/ctdb.service.d/custom-slice.conf

[Service]
Slice=storage.slice

EOF
chmod 644 /etc/systemd/system/ctdb.service.d/custom-slice.conf
mkdir -p /etc/systemd/system/smb.service.d
cat << EOF > /etc/systemd/system/smb.service.d/custom-slice.conf

[Service]
Slice=storage.slice

EOF
chmod 644 /etc/systemd/system/smb.service.d/custom-slice.conf
mkdir -p /etc/systemd/system/nmb.service.d
cat << EOF > /etc/systemd/system/nmb.service.d/custom-slice.conf

[Service]
Slice=storage.slice

EOF
chmod 644 /etc/systemd/system/nmb.service.d/custom-slice.conf
mkdir -p /etc/systemd/system/winbind.service.d
cat << EOF > /etc/systemd/system/winbind.service.d/custom-slice.conf

[Service]
Slice=storage.slice

EOF
chmod 644 /etc/systemd/system/winbind.service.d/custom-slice.conf
mkdir -p /etc/systemd/system/nfs-ganesha.service.d
cat << EOF > /etc/systemd/system/nfs-ganesha.service.d/custom-slice.conf

[Service]
Slice=storage.slice

EOF
chmod 644 /etc/systemd/system/nfs-ganesha.service.d/custom-slice.conf

# TODO: Configure OVN

# TODO: Enable OVN
# TODO: OVN to be enabled later on
#firewall-offline-cmd --add-service=ovirt-provider-ovn
systemctl disable openvswitch
systemctl disable ovn-controller

# Configure Bind
# Note: actual configuration file generated in pre section above to make use of kernel commandline parsing - will be put in place in second post section below

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
firewall-offline-cmd --add-service=dns
# Reconfigure networking to use localhost DNS
# Note: explicitly editing DNS1 in ifcfg configuration files since NetworkManager won't be running inside chroot
sed -i -e "/^DNS1=/s/\"[^\"]*\"/\"127.0.0.1\"/" $(grep -l '^DNS1=' /etc/sysconfig/network-scripts/ifcfg-* | head -1)
sed -i -e '/^nameserver\s/d' /etc/resolv.conf
echo 'nameserver 127.0.0.1' >> /etc/resolv.conf

# Configure Chronyd to always serve NTP to all networks
sed -i -e 's/^#allow.*$/allow/' -e 's/^#local/local/' /etc/chrony.conf
firewall-offline-cmd --add-service=ntp

# TODO: Debug - enable verbose logging in firewalld - maybe disable for production use?
firewall-offline-cmd --set-log-denied=all

# Configure Ansible
sed -i -e 's/^#*\s*pipelining\s*=.*$/pipelining = True/' /etc/ansible/ansible.cfg

# Configure root home dir (with utility script for basic configuration backup)
mkdir -p /root/{etc,bin,log,tmp,backup}
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

# Set up "first-boot" configuration script (steps that require a fully up system)
cat << EOF > /etc/rc.d/rc.ks1stboot
#!/bin/bash

# Run dynamically determined users configuration actions
if [ -x /etc/rc.d/rc.users-setup ]; then
	/etc/rc.d/rc.users-setup
fi

# TODO: enable after initializing GlusterFS
systemctl disable gluster-lock.mount

# Disable further executions of this script from systemd
systemctl disable ks1stboot.service

# Perform an unconditional delayed reboot since oVirt-NGN first boot is "incomplete"
shutdown -r +1
# Note: the command above exits immediately - wait for the most part of the remaining minute
sleep 57

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

) 2>&1 | tee /root/kickstart_post.log
%end

# Post-installation script (run with bash from installation image after the first post section)
%post --nochroot
# Copy CTDB configuration (generated in pre section above) into installed system
if [ -s /tmp/hvp-ctdb-files/nodes ]; then
	cat /tmp/hvp-ctdb-files/nodes >> /mnt/sysimage/etc/ctdb/nodes
	chmod 644 /mnt/sysimage/etc/ctdb/nodes
fi
if [ -s /tmp/hvp-ctdb-files/public_addresses ]; then
	cat /tmp/hvp-ctdb-files/public_addresses >> /mnt/sysimage/etc/ctdb/public_addresses
	chmod 644 /mnt/sysimage/etc/ctdb/public_addresses
fi
if [ -s /tmp/hvp-ctdb-files/gluster-lock.mount ]; then
	cp /tmp/hvp-ctdb-files/gluster-lock.mount /mnt/sysimage/etc/systemd/system/gluster-lock.mount
	chmod 644 /mnt/sysimage/etc/systemd/system/gluster-lock.mount
	chown root:root /mnt/sysimage/etc/systemd/system/gluster-lock.mount
fi

# Copy Samba configuration (generated in pre section above) into installed system
if [ -s /tmp/hvp-samba-files/smb.conf ]; then
	cp /tmp/hvp-samba-files/smb.conf /mnt/sysimage/etc/samba/smb.conf
	chmod 644 /mnt/sysimage/etc/samba/smb.conf
	chown root:root /mnt/sysimage/etc/samba/smb.conf
fi

# Append hosts fragment (generated in pre section above) into installed system
if [ -s /tmp/hvp-bind-zones/hosts ]; then
	cat /tmp/hvp-bind-zones/hosts >> /mnt/sysimage/etc/hosts
fi

# Copy bind configuration (generated in pre section above) into installed system
# Note: using numeric uids/gids since anaconda image may lack the corresponding passwd/group entries
if [ -d /tmp/hvp-bind-zones ]; then
	# Note: the following will be present on node 0 only
	if [ -d /tmp/hvp-bind-zones/dynamic ]; then
		cp /tmp/hvp-bind-zones/dynamic/* /mnt/sysimage/var/named/dynamic/
		chmod 644 /mnt/sysimage/var/named/dynamic/*
		chown 25:25 /mnt/sysimage/var/named/dynamic/*
	fi
	# Note: the following will be present on all nodes
	if [ -f /tmp/hvp-bind-zones/named.conf ]; then
		cp /tmp/hvp-bind-zones/named.conf /mnt/sysimage/etc/named.conf
		chmod 644 /mnt/sysimage/etc/named.conf
		chgrp 25 /mnt/sysimage/etc/named.conf
	fi
fi

# Copy users setup script (generated in pre section above) into installed system
if [ -f /tmp/hvp-users-conf/rc.users-setup ]; then
	cp /tmp/hvp-users-conf/rc.users-setup /mnt/sysimage/etc/rc.d/rc.users-setup
	chmod 755 /mnt/sysimage/etc/rc.d/rc.users-setup
	chown root:root /mnt/sysimage/etc/rc.d/rc.users-setup
fi

# Save exact pre-stage environment
if [ -f /tmp/pre.out ]; then
	cp /tmp/pre.out /mnt/sysimage/root/log/pre.out
fi
# Save installation instructions/logs
# Note: installation logs are now saved under /var/log/anaconda/ by default
cp /run/install/ks.cfg /mnt/sysimage/root/etc
for full_frag in /tmp/full-* ; do
	if [ -f "${full_frag}" ]; then
		cp "${full_frag}" /mnt/sysimage/root/etc
	fi
done
cp /tmp/kickstart_pre.log /mnt/sysimage/root/log
mv /mnt/sysimage/root/kickstart_post.log /mnt/sysimage/root/log
mv /mnt/sysimage/root/*-ks.cfg /mnt/sysimage/root/etc
%end

# Post-installation script (run with bash from chroot after the second post section)
%post --erroronfail

# Initialize imgbased layout
# Note: the following must be executed inside the last post section
imgbase layout --init

%end