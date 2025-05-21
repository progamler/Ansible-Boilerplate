#!/bin/bash

# Define roles here (space-separated)
ROLES="template common"

# Top-level files
touch production staging site.yml webservers.yml dbservers.yml

# group_vars and host_vars
mkdir -p group_vars host_vars
touch group_vars/group1.yml group_vars/group2.yml
touch host_vars/hostname1.yml host_vars/hostname2.yml

# Optional directories
mkdir -p library module_utils filter_plugins

# Roles and subdirectories
for role in $ROLES; do
    mkdir -p roles/$role/{tasks,handlers,templates,files,vars,defaults,meta,library,module_utils,lookup_plugins}
    
    # Create main.yml where applicable
    touch roles/$role/tasks/main.yml
    touch roles/$role/handlers/main.yml
    touch roles/$role/vars/main.yml
    touch roles/$role/defaults/main.yml
    touch roles/$role/meta/main.yml

    # Create example files/templates in 'common' role only
    if [ "$role" = "common" ]; then
        touch roles/$role/templates/ntp.conf.j2
        touch roles/$role/files/bar.txt roles/$role/files/foo.sh
    fi
done
