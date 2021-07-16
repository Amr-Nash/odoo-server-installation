#!/bin/bash

cONFFILE="odoo-instalation.conf"

get_delem () {
  awk -F ' *= *' -v var=$1 '$1==var && $1 !~ /^ *; *.*/{value=$2} END{print value}' $cONFFILE
}

oDOO_VERSION=`get_delem "odoo-version"`
oDOO_USER=`get_delem "odoo-system-user"`



echo $oDOO_VERSION " " $oDOO_USER

