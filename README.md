This repository contains the kickstart files used in the Heretic oVirt Project:

heresiarch.ks - the kickstart file for the installer machine (install this first)

heretic-ngn.ls - the kickstart file for the oVirt Node machines (you will find this automatically copied inside the installer machine)

Currently there is a rough organization of automation strategies (Kickstart vs Ansible) and source location (Ansible playbooks/etc are hardcoded inside heresiarch.ks instead of being taken from Github or a proper package).

inside kickstart files, important points are in comments beginning with "# Note: " while current bugs/workarounds/missing_features are in comments beginning with "# TODO: "

