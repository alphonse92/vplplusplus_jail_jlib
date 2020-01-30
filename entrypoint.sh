#!/bin/bash
## Set the environment variables to the env var file name
echo "#!/bin/bash " >> /usr/bin/vplplusplus_environment
echo "export ENV=${ENV}" >> /usr/bin/vplplusplus_environment
echo "export API_URL=${API_URL}" >> /usr/bin/vplplusplus_environment
echo "export API_TOKEN=${API_TOKEN}" >> /usr/bin/vplplusplus_environment
## Call the original entrypoint
/etc/vpl/entrypoint.sh