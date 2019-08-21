#!/bin/bash

if [[ ! -d  /etc/ssh/host_keys ]]
then
    mkdir /etc/ssh/host_keys
fi

if [[ ! -d  /storage ]]
then
    mkdir /storage
fi

if [[ ! -e /etc/ssh/host_keys/ssh_host_ecdsa_key ]]
then
    ssh-keygen -f /etc/ssh/host_keys/ssh_host_ecdsa_key -N '' -t ecdsa -b 521
    ssh-keygen -f /etc/ssh/host_keys/ssh_host_rsa_key -N '' -t rsa
    ssh-keygen -f /etc/ssh/host_keys/ssh_host_ed25519_key -N '' -t ed25519

    ln -s /etc/ssh/host_keys/ssh_host_ecdsa_key /etc/ssh/ssh_host_ecdsa_key
    ln -s /etc/ssh/host_keys/ssh_host_rsa_key /etc/ssh/ssh_host_rsa_key
    ln -s /etc/ssh/host_keys/ssh_host_ed25519_key /etc/ssh/ssh_host_ed25519_key

fi

if [[ "x$USER" == "x" ]]
then
    export USER="user"
fi

if [[ "x$PASSWORD" == "x" ]]
then
    export PASSWORD="test"
fi

echo "Creating user $USER with password $PASSWORD"
adduser -m -u 1000 -U $USER
echo "$USER:$PASSWORD" | chpasswd

echo "Starting sshd deamon..."
/sbin/sshd -D