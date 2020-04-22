#!/bin/bash

./vpl-jail-system stop >> /dev/null
## Config the jail
echo "PORT=${JAIL_PORT}" >> /etc/vpl/vpl-jail-system.conf
echo "SECURE_PORT=${JAIL_SECURE_PORT}" >> /etc/vpl/vpl-jail-system.conf
## Config the vpl plus plus jail
echo "#!/bin/bash " >> /usr/bin/vplplusplus_environment
echo "export ENV=${ENV}" >> /usr/bin/vplplusplus_environment
echo "export API_URL=${API_URL}" >> /usr/bin/vplplusplus_environment
echo "export API_TOKEN=${API_TOKEN}" >> /usr/bin/vplplusplus_environment

## Install the jail in supervisor
printf "[supervisord]\nnodaemon=false\n[program:vpl]\ncommand=/etc/vpl/vpl-jail-system start" >> /etc/supervisor/supervisord.conf  
service supervisor start

## Install certificate if exist

if [ -z "${CACERT}" ]; then
    echo 'cacert file not found'
else
    if [ -f "${CACERT}" ]; then
        echo "cacert file was found, setting cacert";
        cp $CACERT /usr/local/share/ca-certificates
        update-ca-certificates
    fi;
fi;

## Install the custom hosts files for the process prissioners if exist

if [ -z "${HOST_FILE}" ]; then
    echo 'Host file not found'
else
    if [ -f "${HOST_FILE}" ]; then
        echo "Host file found, adding to the prissioners process";
        cat $HOST_FILE >> /jail/etc/hosts
        cat /jail/etc/hosts
    fi;
fi;

## Tail the logs
echo ""
echo "Vpl Jail is listening on ${JAIL_PORT} and secure on  ${JAIL_SECURE_PORT}"
echo ""
tail -f /var/log/supervisor/supervisord.log
