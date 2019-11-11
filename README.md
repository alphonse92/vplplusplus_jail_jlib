# vplplusplus_jail_jlib
Implementation of JLib in VPL plus plus jail


# Build the image:

## Arguments:

1. JLIB_URL: Url where is stored the Vpl Jlib software

# Run

**You need to run the container with privilegies and ALL capabilities**

`docker run -p 8888:8888 -e JAIL_PORT=8888  -e JAIL_SECURE_PORT=4433 --cap-add=ALL --privileged=true alphonse92/vpl-jail-execution-vpl-jlib-runner `

## Environment variables

1. ENV: environment set the development environment. By **default** is 'development`.  The development environment will output all iformation. The production environment only will show the percentage of tests that was passed.
2. MOODLE_USER_ID: moodle user id of the class that are being tested by Jlib.
3. API_URL: the url of VPL api
4. API_TOKEN:  client JWT token for Vpl Jlib, see the administrator guide for the VPL api.
5. JAIL_PORT: Jail port
6. JAIL_SECURE_PORT: jail secure port