# Note: the following are the parameters suggested for testing the HVP development branch

nolocalvirt="true"

orthodox_mode="false"
ovirt_nightly_mode="true"
use_vdo="false"

# TODO: disable Gluster-block for the time being
#gluster_block_size[0]="200"
#gluster_block_size[1]="300"
#gluster_block_size[2]="450"
unset gluster_block_size
declare -a gluster_block_size

ovirt_version="4.2"

hvp_repo_baseurl['hvp-rhv-rebuild']='https://dangerous.ovirt.life/hvp-repos-development/el$releasever/rhv-rebuild/'
hvp_repo_gpgkey['hvp-rhv-rebuild']='https://dangerous.ovirt.life/hvp-repos-development/RPM-GPG-KEY-hvp'
hvp_repo_baseurl['hvp-rhgs-rebuild']='https://dangerous.ovirt.life/hvp-repos-development/el$releasever/rhgs-rebuild/'
hvp_repo_gpgkey['hvp-rhgs-rebuild']='https://dangerous.ovirt.life/hvp-repos-development/RPM-GPG-KEY-hvp'
hvp_repo_baseurl['hvp-openvswitch-rebuild']='https://dangerous.ovirt.life/hvp-repos-development/el$releasever/openvswitch-rebuild/'
hvp_repo_gpgkey['hvp-openvswitch-rebuild']='https://dangerous.ovirt.life/hvp-repos-development/RPM-GPG-KEY-hvp'
hvp_repo_baseurl['hvp-bareos-rebuild']='https://dangerous.ovirt.life/hvp-repos-development/el$releasever/bareos-rebuild/'
hvp_repo_gpgkey['hvp-bareos-rebuild']='https://dangerous.ovirt.life/hvp-repos-development/RPM-GPG-KEY-hvp'
hvp_repo_baseurl['hvp-fedora-rebuild']='https://dangerous.ovirt.life/hvp-repos-development/el$releasever/fedora-rebuild/'
hvp_repo_gpgkey['hvp-fedora-rebuild']='https://dangerous.ovirt.life/hvp-repos-development/RPM-GPG-KEY-hvp'
hvp_repo_baseurl['hvp-rhsat-rebuild']='https://dangerous.ovirt.life/hvp-repos-development/el$releasever/rhsat-rebuild/'
hvp_repo_gpgkey['hvp-rhsat-rebuild']='https://dangerous.ovirt.life/hvp-repos-development/RPM-GPG-KEY-hvp'
hvp_repo_baseurl['hvp-ansible-rebuild']='https://dangerous.ovirt.life/hvp-repos-development/el$releasever/ansible-rebuild/'
hvp_repo_gpgkey['hvp-ansible-rebuild']='https://dangerous.ovirt.life/hvp-repos-development/RPM-GPG-KEY-hvp'
hvp_repo_baseurl['hvp']='https://dangerous.ovirt.life/hvp-repos-development/el$releasever/hvp/'
hvp_repo_gpgkey['hvp']='https://dangerous.ovirt.life/hvp-repos-development/RPM-GPG-KEY-hvp'
hvp_repo_baseurl['hvp-samba-dc']='https://dangerous.ovirt.life/hvp-repos-development/el$releasever/samba-dc/'
hvp_repo_gpgkey['hvp-samba-dc']='https://dangerous.ovirt.life/hvp-repos-development/RPM-GPG-KEY-hvp'
