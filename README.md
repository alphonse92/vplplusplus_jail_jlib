# Jail with JLib

This microservice installs [VPL ++ JLib](https://github.com/alphonse92/vplplusplus_jlib/) in the [VPL jail](https://github.com/alphonse92/vplplusplus_jail/) microservice.

# Build the image:

## Arguments:

1. JLIB_URL: Url where is stored the Vpl Jlib software

# Run

**You need to run the container with privilegies and ALL capabilities**

`docker run -p 8888:8888 -e JAIL_PORT=8888  -e JAIL_SECURE_PORT=4433 --cap-add=ALL --privileged=true alphonse92/vpl-jail-execution-vpl-jlib-runner `

## Environment variables

1. ENV: environment set the development environment. By **default** is 'development`.  The development environment will output all iformation. The production environment only will show the percentage of tests that was passed.
2. API_URL: the url of VPL api
3. API_TOKEN:  client JWT token for Vpl Jlib, see the administrator guide for the VPL api.
4. JAIL_PORT: Jail port
5. JAIL_SECURE_PORT: jail secure port

**example**

```yaml
ENV: production
API_URL: http://api:1337/api/v1/project/test/case/summary/
API_TOKEN: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI1ZGM3M2Q4NmUxOTY2NGFkY2U2ZmI1ZTgiLCJpZCI6LTE1NzMzMzg1MDIzNTEsInVzZXJuYW1lIjoiYXBwIiwidHlwZSI6ImFwaV9jbGllbnQiLCJpYXQiOjE1NzMzMzg1MDJ9.Liim08kZkPPlT-v5yKW9-ywvWpCSmyBMns7i8vFbIIg
JAIL_PORT: 80
JAIL_SECURE_PORT: 443
```