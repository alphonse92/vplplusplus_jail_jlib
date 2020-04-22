#!/bin/bash
## Set the environment variables to the env var file name
echo "#!/bin/bash " >> /usr/bin/vplplusplus_environment
echo "export ENV=${ENV}" >> /usr/bin/vplplusplus_environment
echo "export API_URL=${API_URL}" >> /usr/bin/vplplusplus_environment
echo "export API_TOKEN=${API_TOKEN}" >> /usr/bin/vplplusplus_environment

if [ -z "${CACERT}" ]; then
    echo 'cacert file not found'
else
    if [ -f "${CACERT}" ]; then
        echo "cacert file was found, setting cacert";
        cp $CACERT /usr/local/share/ca-certificates
        update-ca-certificates
    fi;
fi;

if [ -z "${HOST_FILE}" ]; then
    echo 'Host file not found'
else
    if [ -f "${HOST_FILE}" ]; then
        echo "Host file found, adding to the prissioners process";
        cat $HOST_FILE >> /jail/etc/hosts
    fi;
fi;

## Call the original entrypoint
/etc/vpl/entrypoint.sh