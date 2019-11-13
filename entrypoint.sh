#!/bin/bash
echo "#!/bin/bash"  >> /usr/bin/vpl
echo "export ENV=${ENV}" >>/usr/bin/vpl
echo "export API_URL=${API_URL}" >>/usr/bin/vpl
echo "export API_TOKEN=${API_TOKEN}" >>/usr/bin/vpl
echo 'javac -cp "/usr/bin/VPLPlusPlus-jlib.jar" $1*.java' >> /usr/bin/vpl
echo 'java -jar /usr/bin/VPLPlusPlus-jlib.jar -f $1' >> /usr/bin/vpl
chmod +x /usr/bin/vpl
/etc/vpl/entrypoint.sh