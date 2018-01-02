# Kickstart file for Heretic oVirt Project oVirt-Node physical host
# Note: minimum amount of RAM successfully tested for installation: 1536 MiB (test failed with 1024 MiB)

# Install from PXE with commandline (see below for comments):
# TODO: check each and every custom "hvp_" parameter below for overlap with default dracut/anaconda parameters and convert to using those instead
# nomodeset elevator=deadline inst.stage2=https://dangerous.ovirt.life/hvp-repos/el7/node inst.ks=https://dangerous.ovirt.life/hvp-repos/el7/ks/heretic-ngn.ks hvp_nodeid=[0123]
# Note: DHCP is assumed to be available on one and only one network (the mgmt one, which will be autodetected, albeit with a noticeable delay) otherwise the ip=nicname:dhcp option must be added, where nicname is the name of the network interface to be used for installation (eg: ens32)
# Note: to force custom/fixed nic names add ifname=netN:AA:BB:CC:DD:EE:FF where netN is the desired nic name and AA:BB:CC:DD:EE:FF is the MAC address of the corresponding network interface (beware: not honored for bond slaves)
# Note: alternatively, to force legacy nic names (ethN), add biosdevname=0 net.ifnames=0
# Note: alternatively to install from DVD burn this kickstart into your oVirt Node image and append to default commandline:
# nomodeset elevator=deadline inst.ks=cdrom:/dev/cdrom:/ks/ks.cfg hvp_nodeid=[0123]
# Note: to access the running installation by SSH (beware of publishing the access informations specified with the sshpw directive below) add the option inst.sshd
# Note: to skip installing custom versions of Gluster-related/OVN packages add hvp_orthodox
# Note: to influence selection of the target disk for node OS installation add hvp_nodeosdisk=AAA where AAA is either the device name (sda, sdb ecc) or a qualifier like first, last, smallest, last-smallest
# Note: to force static nic name-to-MAC mapping add the option hvp_nicmacfix
# Note: to force custom node identity add hvp_nodeid=X where X is the node index
# Note: to force custom addressing add hvp_{mgmt,gluster,lan,internal}=x.x.x.x/yy where x.x.x.x may either be the node IP or the network address on the given network and yy is the prefix on the given network - other node addresses will count up and down from current node IP
# Note: to force custom test IPs add hvp_{mgmt,gluster,lan,internal}_test_ip=t.t.t.t where t.t.t.t is the test IP on the given network
# Note: to force custom node bonding mode add hvp_{mgmt,gluster,lan,internal}_bondmode=vvvv where vvvv is the bonding mode, either activepassive, roundrobin (only for gluster) or lacp
# Note: to force custom network MTU add hvp_{mgmt,gluster,lan,internal}_mtu=zzzz where zzzz is the MTU value
# Note: to force custom switch IP add hvp_switch=p.p.p.p where p.p.p.p is the switch IP
# Note: to force custom network domain naming add hvp_{mgmt,gluster,lan,internal}_domainname=mynet.name where mynet.name is the domain name
# Note: to force custom network bridge naming add hvp_{mgmt,gluster,lan,internal}_bridge=bridgename where bridgename is the bridge name
# Note: to force custom AD subdomain naming add hvp_ad_subdomainname=myprefix where myprefix is the subdomain name
# Note: to force custom AD DC IP add hvp_ad_dc=u.u.u.u where u.u.u.u is the AD DC IP on the AD network
# Note: to force custom nameserver IP (during installation) add hvp_nameserver=w.w.w.w where w.w.w.w is the nameserver IP
# Note: to force custom forwarders IPs add hvp_forwarders=forw0,forw1,forw2 where forwN are the forwarders IPs
# Note: to force custom gateway IP add hvp_gateway=n.n.n.n where n.n.n.n is the gateway IP
# Note: to force custom node count add hvp_nodecount=N where N is the number of nodes in the cluster
# Note: to force custom master node identity add hvp_masternodeid=Y where Y is the master node index
# Note: to force custom node naming add hvp_nodename=nodename0,nodename1,nodename2,nodename3 where nodenameN are the unqualified (ie without domain name part) hostnames
# Note: to force custom installer naming add hvp_installername=myinstallername where myinstallername is the unqualified (ie without domain name part) hostname of the installer management interface
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
# Note: the default behaviour involves installing custom versions of Gluster-related/OVN packages
# Note: the default node OS disk is the first of the smallests
# Note: the default behaviour does not register fixed nic name-to-MAC mapping
# Note: the default node id is assumed to be 0
# Note: the default addressing on connected networks is assumed to be 172.20.{10,11,12,13}.0/24 on {mgmt,gluster,lan,internal} respectively with nodes addresses starting from 10 (adding node id)
# Note: the default node bonding mode is assumed to be activepassive on {mgmt,lan,gluster,internal}
# Note: the default MTU is assumed to be 1500 on {mgmt,lan,gluster,internal}
# Note: the default test IPs are assumed to be the first IPs available (network address + 1) on each connected network
# Note: the default switch IP is assumed to be the 200th IP available (network address + 200) on the mgmt network
# Note: the default domain names are assumed to be {mgmt,gluster,lan,internal}.private
# Note: the default bridge names are assumed to be {ovirtmgmt,,lan,internal}
# Note: the default AD subdomain name is assumed to be ad
# Note: the default AD DC IP on the AD network is assumed to be the AD network address plus 220
# Note: the default nameserver IP is assumed to be 8.8.8.8 during installation (afterwards it will be switched to 127.0.0.1 unconditionally)
# Note: the default forwarder IP is assumed to be 8.8.8.8
# Note: the default gateway IP is assumed to be equal to the test IP on the mgmt network
# Note: the default node count is 3
# Note: the default master node id is assumed to be 0
# Note: the default node naming uses "My Little Pony" character names {pinkiepie,applejack,rarity,fluttershy} for node ids {0,1,2,3} and nodeN for further ones
# Note: the default installer naming uses the "My Little Pony" character name twilight for the installer
# Note: the default switch naming uses the "My Little Pony" character name scootaloo for the switch
# Note: the default engine naming uses the "My Little Pony" character name celestia for the Engine
# Note: the default storage naming uses the "My Little Pony" character name discord for the storage service
# Note: the default nodes BMC IP offset is 100
# Note: the default nodes IP offset is 10
# Note: the default engine IP on the mgmt network is assumed to be the mgmt network address plus 5
# Note: the default storage IPs base offset on mgmt/lan/internal networks is assumed to be the network address plus 30
# Note: the default root user password is HVP_dem0
# Note: the default admin username is hvpadmin
# Note: the default admin user password is hvpdemo
# Note: the default keyboard layout is us
# Note: the default local timezone is UTC
# Note: to work around a known kernel commandline length limitation, all hvp_* parameters above can be omitted and proper default values (overriding the hardcoded ones) can be placed in Bash-syntax variables-definition files placed alongside the kickstart file - the name of the files retrieved and sourced (in the exact order) is: hvp_parameters.sh hvp_parameters_heretic_ngn.sh hvp_parameters_hh:hh:hh:hh:hh:hh.sh (where hh:hh:hh:hh:hh:hh is the MAC address of the nic used to retrieve the kickstart file)

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

# Create liveimg setup fragment
# Note: we use a non-local (hd:) stage2 location as indicator of network boot
# TODO: investigate whether we could have a local boot image without a valid embedded squash image (similar to NetInstall)
given_stage2=$(sed -n -e 's/^.*inst\.stage2=\(\S*\).*$/\1/p' /proc/cmdline)
if echo "${given_stage2}" | grep -q '^hd:' ; then
	cat <<- EOF > /tmp/full-liveimg
	# Note: embedded image to be used for cdrom/ISO booting
	liveimg --url=file:///run/install/repo/ovirt-node-ng-image.squashfs.img
	EOF
else
	cat <<- EOF > /tmp/full-liveimg
	# Note: external image to be used for PXE network booting
	liveimg --url=${given_stage2}/ovirt-node-ng-image.squashfs.img
	EOF
fi

# Define all cluster default network data
# Note: engine-related data will only be used for automatic DNS zones configuration
unset nicmacfix
unset orthodox_mode
unset node_count
unset network
unset netmask
unset network_base
unset bondopts
unset mtu
unset domain_name
unset ad_subdomain_prefix
unset ad_dc_ip
unset ad_dc_ip_offset
unset reverse_domain_name
unset bridge_name
unset node_name
unset bmc_ip_offset
unset node_ip_offset
unset test_ip
unset test_ip_offset
unset switch_ip
unset switch_ip_offset
unset installer_name
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

# Hardcoded defaults

nicmacfix="false"

orthodox_mode="false"

default_nodeosdisk="smallest"

default_node_count="3"

default_node_index="0"

declare -A node_name
node_name[0]="pinkiepie"
node_name[1]="applejack"
node_name[2]="rarity"
node_name[3]="fluttershy"

installer_name="twilight"

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
bondopts['gluster']="mode=active-backup;miimon=100"
mtu['gluster']="1500"
network['lan']="172.20.12.0"
netmask['lan']="255.255.255.0"
network_base['lan']="172.20.12"
bondopts['lan']="mode=active-backup;miimon=100"
mtu['lan']="1500"
network['internal']="172.20.13.0"
netmask['internal']="255.255.255.0"
network_base['internal']="172.20.13"
bondopts['internal']="mode=active-backup;miimon=100"
mtu['internal']="1500"

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

ad_subdomain_prefix="ad"

ad_dc_ip_offset="220"

declare -A test_ip
# Note: default values for test_ip derived below - defined here to allow loading as configuration parameters

my_nameserver="8.8.8.8"

my_forwarders="8.8.8.8"

root_password="HVP_dem0"
admin_username="hvpadmin"
admin_password="hvpdemo"
keyboard_layout="us"
local_timezone="UTC"

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
		ks_custom_frags="hvp_parameters.sh hvp_parameters_heretic_ngn.sh"
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

# Determine node OS disk choice
given_nodeosdisk=$(sed -n -e 's/^.*hvp_nodeosdisk=\(\S*\).*$/\1/p' /proc/cmdline)
# Note: we want the devices list alphabetically ordered anyway
all_devices="$(list-harddrives | egrep -v '^(fd|sr)[[:digit:]]*[[:space:]]' | awk '{print $1}' | sort)"
# No indication on node OS disk choice: use default choice
if [ -z "${given_nodeosdisk}" ]; then
	given_nodeosdisk="${default_nodeosdisk}"
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
				last-smallest)
					# If we want the last of the smallests then keep changing selected device even for the same size
					comparison_logic="-le"
					;;
				*)
					# In case of unrecognized/unsupported indication use smallest as default choice
					# If we want the first of the smallests then change the selected device only if the size is strictly smaller
					comparison_logic="-lt"
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

# Determine cluster member identity
my_index=$(sed -n -e 's/^.*hvp_nodeid=\(\S*\).*$/\1/p' /proc/cmdline)
if ! echo "${my_index}" | grep -q '^[[:digit:]]\+$' ; then
	my_index="${default_node_index}"
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

# Determine installer name
given_installer_name=$(sed -n -e 's/^.*hvp_installername=\(\S*\).*$/\1/p' /proc/cmdline)
if echo "${given_installer_name}" | grep -q '^[-[:alnum:]]\+$' ; then
	installer_name="${given_installer_name}"
fi

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

# Determine AD subdomain name
given_ad_subdomainname=$(sed -n -e "s/^.*hvp_ad_subdomainname=\\(\\S*\\).*\$/\\1/p" /proc/cmdline)
if [ -n "${given_ad_subdomainname}" ]; then
	ad_subdomain_prefix="${given_ad_subdomainname}"
fi

# Determine network segments parameters
fixed_mgmt_bondmode="false"
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
					echo "Unsupported bonding mode (${given_network_bondmode}) for zone ${zone} - forcing activepassive" 1>&2
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
				echo "Unrecognized bonding mode (${given_network_bondmode}) for zone ${zone} - forcing activepassive" 1>&2
				bondopts["${zone}"]="mode=active-backup;miimon=100"
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
	unset IPADDR
	IPADDR=$(echo "${given_network}" | sed -n -e 's>^\([^/]*\)/.*$>\1>p')
	if [ -n "${IPADDR}" -a "${IPADDR}" != "${NETWORK}" ]; then
		my_ip["${zone}"]="${IPADDR}"
	else
		my_ip["${zone}"]=$(ipmat $(ipmat ${NETWORK} ${node_ip_offset} +) ${my_index} +)
	fi
	given_network_test_ip=$(sed -n -e "s/^.*hvp_${zone}_test_ip=\\(\\S*\\).*\$/\\1/p" /proc/cmdline)
	if [ -n "${given_network_test_ip}" ]; then
		test_ip["${zone}"]="${given_network_test_ip}"
	fi
	if [ -z "${test_ip[${zone}]}" ]; then
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
				ip link set mtu 1500 dev "${nic_name}"
				continue
			fi
			unset PREFIX
			eval $(ipcalc -s -p "${network[${zone}]}" "${netmask[${zone}]}")
			ip addr add "${my_ip[${zone}]}/${PREFIX}" dev "${nic_name}"
			res=$?
			if [ ${res} -ne 0 ] ; then
				ip addr flush dev "${nic_name}"
				ip link set mtu 1500 dev "${nic_name}"
				continue
			fi
			# Note: adding extra sleep and ping to work around possible hardware delays
			sleep 2
			ping -c 3 -w 8 -i 2 "${test_ip[${zone}]}" > /dev/null 2>&1
			if ping -c 3 -w 8 -i 2 "${test_ip[${zone}]}" > /dev/null 2>&1 ; then
				nics["${zone}"]="${nics[${zone}]} ${nic_name}"
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

# TODO: Adapt bonding mode to network setup
# TODO: disabled for maximum compatibility (LACP needs switch support)
# Note: if not explicitly configured, mgmt network bonding mode is activepassive if there are separate gluster and lan networks, otherwise lacp
#if [ "${fixed_mgmt_bondmode}" = "false" ]; then
#	if [ -n "${nics['gluster']}" -a -n "${nics['lan']}" ]; then
#		bondopts['mgmt']="mode=active-backup;miimon=100"
#	else
#		bondopts['mgmt']="mode=802.3ad;xmit_hash_policy=layer2+3;miimon=100"
#	fi
#fi

# Determine network segment identity
if [ -n "${nics['gluster']}" ]; then
	gluster_zone="gluster"
else
	gluster_zone="mgmt"
fi

# Determine switch IP
given_switch=$(sed -n -e "s/^.*hvp_switch=\\(\\S*\\).*\$/\\1/p" /proc/cmdline)
if [ -n "${given_switch}" ]; then
	switch_ip="${given_switch}"
fi
if [ -z "${switch_ip}" ]; then
	switch_ip=$(ipmat $(ipmat $(ipmat ${my_ip['mgmt']} ${my_index} -) ${node_ip_offset} -) ${switch_ip_offset} +)
fi

# Determine engine IP
given_engine=$(sed -n -e 's/^.*hvp_engine=\(\S*\).*$/\1/p' /proc/cmdline)
if [ -n "${given_engine}" ]; then
	engine_ip="${given_engine}"
fi
if [ -z "${engine_ip}" ]; then
	engine_ip=$(ipmat $(ipmat $(ipmat ${my_ip['mgmt']} ${my_index} -) ${node_ip_offset} -) ${engine_ip_offset} +)
fi

# Determine AD DC IP
given_dc=$(sed -n -e 's/^.*hvp_ad_dc=\(\S*\).*$/\1/p' /proc/cmdline)
if [ -n "${given_dc}" ]; then
	ad_dc_ip="${given_dc}"
fi
if [ -z "${ad_dc_ip}" ]; then
	if [ -n "${nics['lan']}" ]; then
		ad_zone="lan"
	else
		ad_zone="mgmt"
	fi
	ad_dc_ip=$(ipmat $(ipmat $(ipmat ${my_ip[${ad_zone}]} ${my_index} -) ${node_ip_offset} -) ${ad_dc_ip_offset} +)
fi

# Create network setup fragment
# Note: dynamically created here to make use of full autodiscovery above
# Note: defining statically configured single/bonded access to autodetected networks
# Note: listing interfaces using reverse alphabetical order for networks (results in: mgmt, lan, gluster)
# TODO: Anaconda/NetworkManager do not add DEFROUTE="no" and MTU="xxxx" parameters - adding workarounds here - remove when fixed upstream
mkdir -p /tmp/hvp-networkmanager-conf
pushd /tmp/hvp-networkmanager-conf
cat << EOF > /tmp/full-network
# Network device configuration - static version (always verify that your nic is supported by install kernel/modules)
# Use a "void" configuration to make sure anaconda quickly steps over "onboot=no" devices
EOF
bond_index="0"
for zone in $(echo "${!network[@]}" | tr ' ' '\n' | sort -r); do
	if [ -n "${nics[${zone}]}" ]; then
		nics_number=$(echo ${nics[${zone}]} | wc -w)
		nic_names=$(echo ${nics[${zone}]} | sed -e 's/^\s*//' -e 's/\s*$//')
		if [ "${nics_number}" -eq 1 ]; then
			ifcfg_name="${nic_names}"
		else
			ifcfg_name="bond${bond_index}"
		fi
		further_options=""
		# Add gateway and nameserver options only if the default gateway is on this network
		unset NETWORK
		eval $(ipcalc -s -n "${my_gateway}" "${netmask[${zone}]}")
		if [ "${NETWORK}" = "${network[${zone}]}" ]; then
			further_options="${further_options} --gateway=${my_gateway} --nameserver=${my_nameserver}"
			# TODO: workaround for Anaconda/NetworkManager bug - remove when fixed upstream
			echo 'DEFROUTE="yes"' >> ifcfg-${ifcfg_name}
		else
			further_options="${further_options} --nodefroute"
			# TODO: workaround for Anaconda/NetworkManager bug - remove when fixed upstream
			echo 'DEFROUTE="no"' >> ifcfg-${ifcfg_name}
		fi
		# Add hostname option on the mgmt zone only
		# Note: oVirt requires the node hostname to be on the ovirtmgmt network
		if [ "${zone}" = "mgmt" ]; then
			further_options="${further_options} --hostname=${my_name}.${domain_name[${zone}]}"
		fi
		if [ "${nics_number}" -eq 1 ]; then
			# Single (plain) interface
			cat <<- EOF >> /tmp/full-network
			network --device=${ifcfg_name} --activate --onboot=yes --bootproto=static --ip=${my_ip[${zone}]} --netmask=${netmask[${zone}]} --mtu=${mtu[${zone}]} ${further_options}
			EOF
		else
			cat <<- EOF >> /tmp/full-network
			network --device=${ifcfg_name} --bondslaves=$(echo "${nic_names}" | sed -e 's/ /,/g') --bondopts=${bondopts[${zone}]} --activate --onboot=yes --bootproto=static --ip=${my_ip[${zone}]} --netmask=${netmask[${zone}]} --mtu=${mtu[${zone}]} ${further_options}
			EOF
			# Note: saving actual interface (bond) name for further use below
			nics[${zone}]="${ifcfg_name}"
			bond_index=$((bond_index+1))
		fi
		# TODO: workaround for Anaconda/NetworkManager bug - remove when fixed upstream
		echo "MTU=\"${mtu[${zone}]}\"" >> ifcfg-${ifcfg_name}
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
user --name=${admin_username} --password=${admin_password} --plaintext --gecos=Admin
EOF
# Prepare users configuration script to be run at first boot
mkdir -p /tmp/hvp-users-conf
cat << EOF > /tmp/hvp-users-conf/rc.users-setup
#!/bin/bash
# Configure email aliases (divert root email to administrative account)
sed -i -e "s/^#\\\\s*root.*\\\$/root:\\\\t\\\\t${admin_username}/" /etc/aliases
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
# Note: all sizes in MiB except for data_block_size which is in KiB
data_dev_size=$((${device_size} / 1024 / 1024))
data_block_size="2048"
min_metadata_size="3072"
metadata_size=$((48 * ${data_dev_size} / ${data_block_size} / 1024))
if [ "${metadata_size}" -lt "${min_metadata_size}" ]; then
	metadata_size="${min_metadata_size}"
fi
cat << EOF > /tmp/full-disk
# oVirt Node hyperconverged disk configuration: there will surely be multiple SCSI/SATA disks but only one will be used for OS
# Initialize partition table (GPT) on all available disks
clearpart --all --initlabel --disklabel=gpt
# Bootloader placed on MBR, with 3 seconds waiting, with password protection, disabling high res text console, disabling CPU C-states and with I/O scheduler optimized for a virtualization/storage server
bootloader --location=mbr --timeout=3 --password=${root_password} --append="nomodeset processor.max_cstate=1 intel_idle.max_cstate=0"
# Ignore further disks
# Note: further disks will be used as bricks later on
ignoredisk --only-use=${device_name}
# Either all automatic...
#autopart --type=thinp
# ...or explicitly detailed as per https://github.com/oVirt/ovirt-node-ng/blob/master/docs/book/install.md and https://bugzilla.redhat.com/show_bug.cgi?id=1369874
# Automatically create UEFI or BIOS boot partition depending on hardware capabilities
reqpart --add-boot
# Note: the following uses only the first disk as PV and leaves other disks unused if the first one is sufficiently big, otherwise starts using other disks too
part pv.01 --size=50000 --grow
# Create a VG
# Note: leaving a reserved percent to allow metadata growing
volgroup HostVG pv.01 --reserved-percent=5
# Define swap space
logvol swap --vgname=HostVG --name=swap --fstype=swap --recommended
# Define thin provisioned LVs
logvol none --vgname=HostVG --name=HostPool --thinpool --size=48000 --metadatasize=${metadata_size} --chunksize=${data_block_size} --grow
# Note: ext4 is required for oVirt Node by imgbased software
logvol / --vgname=HostVG --name=root --thin --fstype=ext4 --poolname=HostPool --fsoptions="defaults,discard" --size=6000 --grow
logvol /var --vgname=HostVG --name=var --thin --fstype=ext4 --poolname=HostPool --fsoptions="defaults,discard" --size=20000
logvol /var/log --vgname=HostVG --name=var_log --thin --fstype=ext4 --poolname=HostPool --fsoptions="defaults,discard" --size=10000
logvol /var/log/audit --vgname=HostVG --name=var_log_audit --thin --fstype=ext4 --poolname=HostPool --fsoptions="defaults,discard" --size=2000
logvol /home --vgname=HostVG --name=home --thin --fstype=ext4 --poolname=HostPool --fsoptions="defaults,discard" --size=1000
logvol /tmp --vgname=HostVG --name=tmp --thin --fstype=ext4 --poolname=HostPool --fsoptions="defaults,discard" --size=2000
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
		# Note: installer, switch, engine and BMCs are connected only on the MGMT network
		if [ "${zone}" = "mgmt" ]; then
			cat <<- EOF >> ${domain_name[${zone}]}.db
			${installer_name}	A	${test_ip[${zone}]}
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
		# Note: installer, switch, engine and BMCs are connected only on the MGMT network
		if [ "${zone}" = "mgmt" ]; then
			cat <<- EOF >> ${reverse_domain_name[${zone}]}.db
			$(echo ${test_ip[${zone}]} | sed -e "s/^$(echo ${network_base[${zone}]} | sed -e 's/[.]/\\./g')[.]//")		IN	PTR	${installer_name}.${domain_name[${zone}]}.
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
if [ -n "${nics['lan']}" ]; then
	ad_zone="${ad_subdomain_prefix}.${domain_name['lan']}"
else
	ad_zone="${ad_subdomain_prefix}.${domain_name['mgmt']}"
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

        zone "${ad_zone}" IN {
                type slave;
                masters { ${ad_dc_ip}; };
                forwarders {};
        };

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

        zone "${ad_zone}" IN {
                type slave;
                masters { ${ad_dc_ip}; };
                forwarders {};
        };

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
# Note: a proper configuration (AD domain member etc.) will be pushed and activated by means of Ansible once the whole infrastructure is up and running
# TODO: lower log level to 0 general and vfs-glusterfs too
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

   log file = /var/log/samba/log.%m
   log level = 2
   max log size = 50
   syslog = 1
   syslog only = No

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
   glusterfs:logfile = /var/log/samba/glusterfs-test.log
   glusterfs:volume = winshare

EOF

popd

) 2>&1 | tee /tmp/kickstart_pre.log
%end

# Post-installation script (run with bash from installation image at the end of installation)
%post --nochroot

# Copy configuration parameters files (generated in pre section above) into installed system (to be loaded during chrooted post section below)
mkdir -p /mnt/sysimage/root/etc/kscfg-pre
for custom_frag in /tmp/kscfg-pre/*.sh ; do
	if [ -f "${custom_frag}" ]; then
		cp "${custom_frag}" /mnt/sysimage/root/etc/kscfg-pre/
	fi
done

%end

# Post-installation script (run with bash from chroot after the first post section)
%post

( # Run the entire post section as a subshell for logging purposes.

script_version="2017123001"

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
hostname ${HOSTNAME}

# Set the homedir for apps that need it
export HOME="/root"

# Define associative arrays
declare -A node_name
declare -A network netmask network_base bondopts mtu
declare -A domain_name
declare -A reverse_domain_name
declare -A test_ip
declare -A bridge_name

# Hardcoded defaults
unset my_index
unset master_index
unset nicmacfix
unset orthodox_mode

master_index="0"
nicmacfix="false"
orthodox_mode="false"

# Load configuration parameters files (generated in pre section above)
ks_custom_frags="hvp_parameters.sh hvp_parameters_heretic_ngn.sh hvp_parameters_*:*.sh"
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

# Determine cluster member identity
my_index=$(sed -n -e 's/^.*hvp_nodeid=\(\S*\).*$/\1/p' /proc/cmdline)
if ! echo "${my_index}" | grep -q '^[[:digit:]]\+$' ; then
	my_index="${default_node_index}"
fi

# Determine master node identity
given_master_index=$(sed -n -e 's/^.*hvp_masternodeid=\(\S*\).*$/\1/p' /proc/cmdline)
if echo "${given_master_index}" | grep -q '^[[:digit:]]\+$' ; then
	master_index="${given_master_index}"
fi

# Correctly initialize YUM cache to avoid 404 errors
# Note: following advice in https://access.redhat.com/articles/1320623
# TODO: remove when fixed upstream
rm -rf /var/cache/yum/*
yum --enablerepo '*' clean all

# Add YUM priorities plugin
yum -y --enablerepo extras install yum-plugin-priorities

# Add HVP custom repo
yum -y --nogpgcheck install https://dangerous.ovirt.life/hvp-repos/el7/hvp/x86_64/hvp-release-7-1.noarch.rpm
# If not explicitly denied, make sure that we prefer HVP own RHGS/OVN rebuild repos versus oVirt-dependency repos
if [ "${orthodox_mode}" = "false" ]; then
	yum-config-manager --enable hvp-rhgs-rebuild > /dev/null
	yum-config-manager --save --setopt='hvp-rhgs-rebuild.priority=50' > /dev/null
	yum-config-manager --enable hvp-openvswitch-rebuild > /dev/null
	yum-config-manager --save --setopt='hvp-openvswitch-rebuild.priority=50' > /dev/null
else
	# Note: HVP RHGS rebuild must be enabled anyway to allow access to slightly newer/tweaked (but compatible with community Gluster) versions of other packages
	yum-config-manager --enable hvp-rhgs-rebuild > /dev/null
fi

# Note: adding to already present package restrictions on EPEL repo
sed -i -e '/^include.*=epel-release,/s/\s*$/,haveged/' /etc/yum.repos.d/ovirt-*-dependencies.repo

# Comment out mirrorlist directives and uncomment the baseurl ones to make better use of proxy caches
# TODO: investigate whether to disable fastestmirror yum plugin too (may interfer in round-robin-DNS-served names?)
for repofile in /etc/yum.repos.d/*.repo; do
	if egrep -q '^(mirrorlist|metalink)' "${repofile}"; then
		sed -i -e 's/^mirrorlist/#mirrorlist/g' "${repofile}"
		sed -i -e 's/^metalink/#metalink/g' "${repofile}"
		sed -i -e 's/^#baseurl/baseurl/g' "${repofile}"
	fi
done
# Modify baseurl definitions to allow effective use of our proxy cache
sed -i -e 's>http://download.fedoraproject.org/pub/epel/7/>http://www.nic.funet.fi/pub/mirrors/fedora.redhat.com/pub/epel/7/>g' /etc/yum.repos.d/ovirt-*-dependencies.repo

# Install Wget and patch
yum -y --enablerepo base --enablerepo updates --enablerepo cr install wget patch

# Install HAVEGEd
# Note: even in presence of an actual hardware random number generator (managed by rngd) we install haveged as a safety measure
yum -y install haveged

# Install Memtest86+
yum -y --enablerepo base --enablerepo updates --enablerepo cr install memtest86+

# Install MCE logging/management service
yum -y --enablerepo base --enablerepo updates --enablerepo cr install mcelog

# Install oVirt Host
# Note: the following packages should already be present on a Node image
# Note: tuned and qemu-kvm-tools are needed to add host to datacenter
# Note: the following already brings in GlusterFS as a dependency
# Note: explicitly adding virt-v2v as per https://bugzilla.redhat.com/show_bug.cgi?id=1250376 - needs CentOS >= 7.2
yum -y install ovirt-hosted-engine-setup virt-v2v tuned qemu-kvm-tools

# Install GlusterFS
# Note: the following packages should already be present on a Node image
# Note: rpm post scriptlet for glusterfs-server fails - errors can be safely ignored
yum -y install glusterfs glusterfs-fuse glusterfs-server glusterfs-coreutils vdsm-gluster

# Install custom packages for NAS functions
yum -y --enablerepo base --enablerepo updates --enablerepo cr install krb5-workstation samba samba-client samba-winbind samba-winbind-clients samba-winbind-krb5-locator samba-vfs-glusterfs ctdb nfs-ganesha gluster-block gstatus

# Install custom packages for OVN functions
yum -y --enablerepo base --enablerepo updates --enablerepo cr install openvswitch openvswitch-ovn-common openvswitch-ovn-host python-openvswitch ovirt-provider-ovn-driver

# Install oVirt Engine appliance (on master node only)
if [ "${my_index}" = "${master_index}" ]; then
	yum -y install ovirt-engine-appliance
fi

# Install further packages for additional functions: Bind
yum -y --enablerepo base --enablerepo updates --enablerepo cr install bind

# Install Bareos tools, client (file daemon + console) and storage daemon (all with Gluster support)
yum -y install bareos-tools bareos-client bareos-filedaemon-glusterfs-plugin bareos-storage bareos-storage-glusterfs

# Install further packages for additional functions: Ansible automation
# TODO: package ovirt-ansible-roles is masked out by means of exclude directive on ovirt-4.1 repo - fix upstream
yum -y --enablerepo base --enablerepo updates --enablerepo cr --enablerepo hvp-rhgs-rebuild install ansible gdeploy ovirt-engine-sdk-python python2-jmespath ovirt-ansible-roles NetworkManager-glib

# Clean up after all installations
yum --enablerepo '*' clean all

# Remove package update leftovers
find /etc -type f -name '*.rpmnew' -exec rename .rpmnew "" '{}' ';'
find /etc -type f -name '*.rpmsave' -exec rm -f '{}' ';'

# Now configure the Node OS
# TODO: Decide which part to configure here and which part to demand to Ansible

# TODO: apply patch to imgbased from https://gerrit.ovirt.org/#/c/85687/ - remove when integrated upstream (see https://bugzilla.redhat.com/show_bug.cgi?id=1528468 )
pushd /usr/lib/python2.7/site-packages
cat << EOF | patch -p2
--- a/src/imgbased/plugins/rpmpersistence.py
+++ b/src/imgbased/plugins/rpmpersistence.py
@@ -28,7 +28,7 @@ import glob
 import subprocess
 
 from .. import utils
-from ..utils import mounted, SystemRelease, SELinuxDomain
+from ..utils import File, mounted, SystemRelease, SELinuxDomain
 
 
 log = logging.getLogger(__package__)
@@ -65,17 +65,20 @@ def on_os_upgraded(imgbase, previous_lv_name, new_lv_name):
 def reinstall_rpms(imgbase, new_lv, previous_lv):
     # FIXME: this should get moved to a generalized plugin. We need to check
     # it in multiple places
-    with mounted(new_lv.path) as new_fs:
-        new_etc = new_fs.path("/etc")
+    if "inst.ks" not in File('/proc/cmdline').contents:
+        with mounted(new_lv.path) as new_fs:
+            new_etc = new_fs.path("/etc")
 
-        new_rel = SystemRelease(new_etc + "/system-release-cpe")
+            new_rel = SystemRelease(new_etc + "/system-release-cpe")
 
-        if not new_rel.is_supported_product():
-            log.error("Unsupported product: %s" % new_rel)
-            raise RpmPersistenceError()
+            if not new_rel.is_supported_product():
+                log.error("Unsupported product: %s" % new_rel)
+                raise RpmPersistenceError()
 
-        with utils.bindmounted("/var", target=new_fs.target + "/var"):
-            install_rpms(new_fs)
+            with utils.bindmounted("/var", target=new_fs.target + "/var"):
+                install_rpms(new_fs)
+
+        log.info("Not reinstalling RPMs during system installation")
 
     imgbase.hooks.emit("rpms-persisted",
                        previous_lv.lv_name,
EOF
popd

# Autodetecting BIOS/UEFI
# Note: the following identifies the symlink under /etc to abstract from BIOS/UEFI actual file placement
if [ -d /sys/firmware/efi ]; then
	grub2_cfg_file="/etc/grub2-efi.cfg"
else
	grub2_cfg_file="/etc/grub2.cfg"
fi

# TODO: Setup a serial terminal
# TODO: find a way to detect actual serial hardware presence
#sed -i -e '/^GRUB_CMDLINE_LINUX/s/quiet/quiet console=tty0 console=ttyS0,115200n8/' /etc/default/grub
#cat << EOF >> /etc/default/grub
#GRUB_TERMINAL="console serial"
#GRUB_SERIAL_COMMAND="serial --speed=115200 --unit=0 --word=8 --parity=no --stop=1"
#EOF
# Note: the following uses the generic symlink under /etc to abstract from BIOS/UEFI actual file placement
#grub2-mkconfig -o "${grub2_cfg_file}"

# Add memory test entry to boot loader
memtest-setup
grub2-mkconfig -o "${grub2_cfg_file}"

# Configure kernel I/O scheduler policy
sed -i -e '/^GRUB_CMDLINE_LINUX/s/\selevator=[^[:space:]"]*//' -e '/^GRUB_CMDLINE_LINUX/s/"$/ elevator=deadline"/' /etc/default/grub
grub2-mkconfig -o "${grub2_cfg_file}"

# Configuration of session/system management (ignore power actions initiated by keyboard etc.)
# Note: interactive startup is disabled by default (enable with systemd.confirm_spawn=true on kernel commandline) and single user mode uses sulogin by default
sed -i -e '/Handle[^=]*=[^i]/s/^#\(Handle[^=]*\)=.*$/\1=ignore/' /etc/systemd/logind.conf

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

# Configure Chronyd to always serve NTP to all networks
sed -i -e 's/^#allow.*$/allow/' -e 's/^#local/local/' /etc/chrony.conf
firewall-offline-cmd --add-service=ntp

# TODO: configure TCP wrappers

# Configure SSH (show legal banner, limit authentication tries, no DNS tracing of incoming connections)
sed -i -e 's/^#\s*MaxAuthTries.*$/MaxAuthTries 3/' -e 's/^#\s*UseDNS.*$/UseDNS no/' -e 's%^#\s*Banner.*$%Banner /etc/issue.net%' /etc/ssh/sshd_config
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

# TODO: nodectl profile fragments have uncommon permissions - remove when fixed upstream
chmod 644 /etc/profile.d/nodectl-*
# TODO: nodectl active login messages are an overhead on each logon (think of Ansible via SSH) so we disable them - remove when fixed upstream
rename .sh .sh.disabled /etc/profile.d/nodectl-*
# TODO: a static workaround does not work
#cat << EOF > /etc/cron.d/nodectl-motd
#@reboot root /sbin/nodectl motd > /etc/motd 2>&1 ; /sbin/nodectl generate-banner >> /etc/motd 2>&1
#*/10 * * * * root /sbin/nodectl motd > /etc/motd 2>&1 ; /sbin/nodectl generate-banner >> /etc/motd 2>&1
#EOF
#chmod 644 /etc/cron.d/nodectl-motd

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
firewall-offline-cmd --add-service=dns
# Reconfigure networking to use localhost DNS
# Note: explicitly editing DNS1 in ifcfg configuration files since NetworkManager will not be running inside chroot
sed -i -e "/^DNS1=/s/\"[^\"]*\"/\"127.0.0.1\"/" $(grep -l '^DNS1=' /etc/sysconfig/network-scripts/ifcfg-* | head -1)
sed -i -e '/^nameserver\s/d' /etc/resolv.conf
echo 'nameserver 127.0.0.1' >> /etc/resolv.conf

# Configure log rotation (keep 6 years of logs, compressed)
sed -i -e 's/^rotate.*$/rotate 312/' -e 's/^#\s*compress.*$/compress/' /etc/logrotate.conf

# Enable HAVEGEd
systemctl enable haveged

# Note: users configuration script generated in pre section above and copied in third post section below

# Conditionally force static the nic name<->MAC mapping to work around hardware bugs (eg nic "autoshifting" on some HP MicroServer G7)
# TODO: oVirt setup removes HWADDR parameter from ifcfg file when enslaving it to ovirtmgmt - open a bug upstream - use bonding on mgmt as a workaround
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
#CTDB_SET_DeterministicIPs=1
CTDB_SET_RecoveryBanPeriod=120
CTDB_SET_TraverseTimeout=60
# Set CTDB socket location
CTDB_SOCKET=/run/ctdb/ctdbd.socket
EOF

# Note: hosts and addresses configuration files created in pre section above and copied in third post section below

# Add monitoring script for GlusterFS-based NFS
# Note: taken from https://xrsa.net/2015/04/25/ctdb-glusterfs-nfs-event-monitor-script/
# Note: tracked upstream in https://bugzilla.redhat.com/show_bug.cgi?id=1371178
# TODO: remove when included upstream and/or switching to NFS-Ganesha
cat << EOF > /etc/ctdb/events.d/60.glusternfs
#!/bin/sh
# Event script to monitor GlusterFS NFS in a cluster environment
# Source: https://xrsa.net
# Author: Ben Draper
# Email: ben@xrsa.net
# Install Location: /etc/ctdb/events.d/60.glusternfs
#
 
[ -n "\$CTDB_BASE" ] || \\
    export CTDB_BASE=\$(cd -P \$(dirname "\$0") ; dirname "\$PWD")
 
. \$CTDB_BASE/functions
 
service_ports="111 2049 38465 38466"
 
# Placeholder
service_name="glusterfs_nfs"
 
# Verify GlusterFS Services are running
verify_supporting_services ()
{
    l_ret=0
    /usr/bin/systemctl -q is-active glusterd || {
        echo "Service - glusterd is not running"
        l_ret=1
    }
 
#    /usr/bin/systemctl -q is-active glusterfsd || {
#        echo "Service - glusterfsd is not running"
#        l_ret=1
#    }
 
    /usr/bin/systemctl -q is-active rpcbind || {
        echo "Service - rpcbind is not running"
        l_ret=1
    }
 
    if [ \$l_ret -eq 1 ]; then
        exit \$l_ret
    fi
}
 
# This will verify required ports are listening
verify_ports ()
{
    l_ret=0
    for check_port in \$service_ports; do
        ctdb_check_tcp_ports \$check_port || {
            l_ret=1
        }
    done
 
    if [ \$l_ret -eq 1 ]; then
        exit \$l_ret
    fi
}
 
loadconfig
case "\$1" in
    monitor)
        verify_supporting_services
        verify_ports    
        update_tickles 2049
    ;;
 
    *)
	ctdb_standard_event_handler "\$@"
    ;;
esac
 
exit 0
EOF
chmod 755 /etc/ctdb/events.d/60.glusternfs

# Add SELinux support for monitoring script for GlusterFS-based NFS
# Note: taken from https://xrsa.net/2015/04/25/ctdb-glusterfs-nfs-event-monitor-script/
# TODO: remove when included upstream and/or switching to NFS-Ganesha
mkdir -p /etc/selinux/local
cat << EOF > /etc/selinux/local/myglusternfsctdb.te
 
module myglusternfsctdb 5.0;
 
require {
        type portmap_port_t;
        type nfs_port_t;
        class tcp_socket name_bind;
        class netlink_tcpdiag_socket {create setopt bind getattr};
	type rpcd_unit_file_t;
	type systemd_unit_file_t;
	type ctdbd_t;
	class service status;
}
 
#============= ctdbd_t ==============
allow ctdbd_t rpcd_unit_file_t:service status;
allow ctdbd_t systemd_unit_file_t:service status;
allow ctdbd_t nfs_port_t:tcp_socket name_bind;
allow ctdbd_t portmap_port_t:tcp_socket name_bind;
allow ctdbd_t self:netlink_tcpdiag_socket {create setopt bind getattr};
EOF
chmod 644 /etc/selinux/local/myglusternfsctdb.te

pushd /etc/selinux/local
checkmodule -M -m -o myglusternfsctdb.mod myglusternfsctdb.te
semodule_package -o myglusternfsctdb.pp -m myglusternfsctdb.mod
semodule -i myglusternfsctdb.pp
popd

# Force NFS client to NFSv3 to avoid even trying with unsupported v4
# TODO: remove when disabling GlusterFS internal NFS and switching to NFS-Ganesha
sed -i -e 's/^#*\s*Defaultvers=.*$/Defaultvers=3/' /etc/nfsmount.conf

# Disable NFS client file locking to work a round a conflict with GlusterFS internal NFS
# TODO: remove when disabling GlusterFS internal NFS and switching to NFS-Ganesha
cat << EOF >> /etc/nfsmount.conf

Lock=False

EOF
systemctl mask nfs-lock

# Disable kernel-based NFS server
systemctl mask nfs.target

# Note: a mount systemd unit for CTDB shared lock area created in pre section above and copied in third post section below
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
Description=Set apart RT bandwidth for storage uses in cgroup hierarchy
Before=ctdb.service multi-user.target

[Service]
ExecStart=/usr/bin/bash -c '/usr/bin/echo 10000 > /sys/fs/cgroup/cpu/storage.slice/cpu.rt_runtime_us'

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

# Note: Samba main configuration file created in pre section above and copied in third post section below
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

# Add SELinux support for Samba access to FUSE-mounte GlusterFS-based shared lock area
# TODO: remove when included upstream
setsebool samba_share_fusefs on
mkdir -p /etc/selinux/local
cat << EOF > /etc/selinux/local/myglustersmb.te

module myglustersmb 1.0;

require {
	type fusefs_t;
	type smbd_t;
	class sock_file create;
}

#============= smbd_t ==============

allow smbd_t fusefs_t:sock_file create;
EOF
chmod 644 /etc/selinux/local/myglustersmb.te

pushd /etc/selinux/local
checkmodule -M -m -o myglustersmb.mod myglustersmb.te
semodule_package -o myglustersmb.pp -m myglustersmb.mod
semodule -i myglustersmb.pp
popd

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

# TODO: Lower Gluster-block log level
#sed -i -e 's/^#*\s*GB_LOG_LEVEL=.*$/GB_LOG_LEVEL=WARNING/' /etc/sysconfig/gluster-blockd

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

# Enable OVN
# Note: OVN to be configured later on together with Engine-based part
firewall-offline-cmd --add-service=ovn-host-firewall-service
systemctl enable ovn-controller

# TODO: Debug - enable verbose logging in firewalld - maybe disable for production use?
firewall-offline-cmd --set-log-denied=all

# Configure Ansible
sed -i -e 's/^#*\s*pipelining\s*=.*$/pipelining = True/' /etc/ansible/ansible.cfg

# TODO: Configure Bareos fd with direct access to all GlusterFS volumes
# TODO: Configure Bareos sd with direct access to a dedicated GlusterFS backup volume
# Device Type = gfapi
# Archive Device = gluster://localhost/BACKUP
# TODO: Configure Bareos sd with direct access to an external USB/eSATA drive

# TODO: Enable Bareos when configuration is completed
systemctl disable bareos-fd
systemctl disable bareos-sd

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

# Conditionally enable either IPMI or LMsensors monitoring
# TODO: configure IPMI options
# TODO: find a way to ignore partial IPMI implementations (e.g. those needing a [missing] add-on card)
if dmidecode -s system-manufacturer | egrep -q -v "(Microsoft|VMware|innotek|Parallels|Red.*Hat|oVirt|Xen)" ; then
	if dmidecode --type 38 | grep -q 'IPMI' ; then
		systemctl enable ipmi
		systemctl enable ipmievd
		systemctl start ipmi
		systemctl start ipmievd
	else
		systemctl enable lm_sensors
		yes yes | sensors-detect
		systemctl start lm_sensors
	fi
fi

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

# Post-installation script (run with bash from installation image after the second post section)
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

# TODO: perform NetworkManager workaround configuration on interfaces as detected in pre section above - remove when fixed upstream
for file in /tmp/hvp-networkmanager-conf/ifcfg-* ; do
	cfg_file_name=$(basename ${file})
	sed -i -e '/^DEFROUTE=/d' -e '/^MTU=/d' /mnt/sysimage/etc/sysconfig/network-scripts/${cfg_file_name}
	cat ${file} >> /mnt/sysimage/etc/sysconfig/network-scripts/${cfg_file_name}
done

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
%end

# Post-installation script (run with bash from chroot after the third post section)
%post --erroronfail

# Initialize imgbased layout
# Note: the following must be executed inside the last post section
imgbase layout --init

%end
