# Kickstart repository

This repository contains the kickstart files used for Heretic oVirt Project infrastructure machines:

heresiarch.ks - the kickstart file for the installer machine (install this machine *first*)

heretic-ngn.ks - the kickstart file for the oVirt NGN machines (you will find this kickstart file automatically copied inside the installer machine in the proper location)

heretic-host.ks - the kickstart file for the oVirt Host machines (you will find this kickstart file automatically copied inside the installer machine in the proper location)

Each kickstart file has a corresponding sample hvp_parameters_&ast;.sh configuration parameters file (consisting of comments and variable definitions in GNU/Bash syntax) to overcome Linux kernel commandline length limitations.

A custom hvp_parameters-development.sh can be placed alongside other kickstart files as hvp_parameters.sh to make all installations transparently use the development repositories (which may contain experimental/unstable packages).

Currently there is a rough organization of automation strategies (Kickstart vs Ansible).

Inside kickstart files, important points are in comments beginning with "# Note: " while current bugs/workarounds/missing_features are in comments beginning with "# TODO: "

