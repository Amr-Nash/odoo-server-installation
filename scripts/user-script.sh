#!/bin/bash

cONFFILE="odoo-instalation.conf"
uSER_SCRIPT="user-script.sh"
oS_RELEASE=`lsb_release -a 2>/dev/null|grep Codename|cut --only-delimited -f2`

get_delem () {
  awk -F ' *= *' -v var=$1 '$1==var && $1 !~ /^ *; *.*/{value=$2} END{print value}' $cONFFILE
}

oDOO_VERSION=`get_delem "odoo-version"`
oDOO_USER=`get_delem "odoo-system-user"`


git clone https://github.com/odoo/odoo --depth 1 --branch $oDOO_VERSION $oDOO_USER-server/
echo $?

cd /$oDOO_USER/$oDOO_USER-server
echo $?

virtualenv -p python3 env
echo $?

source env/bin/activate
echo $?

pip install wheel && pip install -r requirements.txt
echo $?

deactivate
echo $?

mkdir /$oDOO_USER/$oDOO_USER-server/custom
echo $?