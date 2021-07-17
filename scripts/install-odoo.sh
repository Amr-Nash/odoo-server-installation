#!/bin/bash

cONFFILE="odoo-instalation.conf"
oS_RELEASE=`lsb_release -a 2>/dev/null|grep Codename|cut --only-delimited -f2`

get_delem () {
  awk -F ' *= *' -v var=$1 '$1==var && $1 !~ /^ *; *.*/{value=$2} END{print value}' $cONFFILE
}

oDOO_VERSION=`get_delem "odoo-version"`
oDOO_USER=`get_delem "odoo-system-user"`

# sudo apt update && sudo apt -y upgrade
# echo $?

# sudo apt install git python3-pip build-essential wget python3-dev python3-venv python3-wheel libxslt-dev libzip-dev libldap2-dev libsasl2-dev python3-setuptools node-less virtualenv
# echo $?

# sudo apt-get install libtiff5-dev libjpeg8-dev libopenjp2-7-dev zlib1g-dev libfreetype6-dev liblcms2-dev libwebp-dev tcl8.6-dev tk8.6-dev python3-tk libharfbuzz-dev libfribidi-dev libxcb1-dev
# echo $?

# sudo useradd -m -d /$oDOO_USER -U -r -s /bin/bash $oDOO_USER
# echo $?

# sudo apt install libpq-dev postgresql-client postgresql-client-common python3-psycopg2 postgresql postgresql-contrib
# echo $?

# sudo su - postgres -c "createuser -s $oDOO_USER"
# echo $?

# wget "https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6-1/wkhtmltox_0.12.6-1."$oS_RELEASE"_amd64.deb" -P ~/
# echo $?

# sudo apt install ~/wkhtmltox_0.12.6-1.*.deb
# echo $?

# sudo su - $oDOO_USER
# echo $?

sudo -H -u otheruser bash -c 'git clone https://github.com/odoo/odoo --depth 1 --branch $oDOO_VERSION $oDOO_USER-server/' 
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

exit
echo $?




echo $oDOO_VERSION " " $oDOO_USER $oS_RELEASE

