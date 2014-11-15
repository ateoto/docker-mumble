#!/bin/bash

if [[ ! -z $MURMUR_SERVER_PASS ]]; then
  echo "Setting Server Password ..."
  sed -i "s/serverpassword=/serverpassword=${MURMUR_SERVER_PASS}/" /mumble/murmur.ini
fi
if [[ ! -z $MURMUR_SUPER_USER_PASS ]]; then
  echo "Setting SuperUser Password ..."
  /mumble/murmur.x86 -ini /mumble/murmur.ini -supw ${MURMUR_SUPER_USER_PASS} 
fi

exec /mumble/murmur.x86 -fg -v
