#!/bin/bash
echo "#!/bin/bash"  >> /usr/bin/vpl
echo "export ENV=${ENV}" >> /usr/bin/vpl
echo "export API_URL=${API_URL}" >> /usr/bin/vpl
echo "export API_TOKEN=${API_TOKEN}" >> /usr/bin/vpl
echo 'javac -cp "/usr/bin/VPLPlusPlus-jlib.jar" $1*.java' >> /usr/bin/vpl
echo 'java -jar /usr/bin/VPLPlusPlus-jlib.jar -f $1' >> /usr/bin/vpl
echo 'echo ""' >> /usr/bin/vpl
echo 'echo "Run Script - Vpl ++ Jlib runner V.1.0.0"'  >> /usr/bin/vpl
echo 'echo "Ingeniería de Sistemas - UFPS"'  >> /usr/bin/vpl
#Create script to run the test, adding to the claspath the jlib to get no errors
echo "#!/bin/bash"  >> /usr/bin/vpl_run
echo 'echo "Running class."'   >> /usr/bin/vpl_run
echo 'echo ""'  >> /usr/bin/vpl_run
echo 'javac -cp "/usr/bin/VPLPlusPlus-jlib.jar" $1*.java' >> /usr/bin/vpl_run
echo 'echo ""'  >> /usr/bin/vpl_run
echo 'echo "End of class execution."'  >> /usr/bin/vpl_run
echo 'echo "Did you not see the output? Make sure there is a main class."'  >> /usr/bin/vpl_run
echo 'echo "Run Script - Vpl ++ Jlib runner V.1.0.0"'  >> /usr/bin/vpl_run
echo 'echo "Ingeniería de Sistemas - UFPS"'  >> /usr/bin/vpl_run

chmod +x /usr/bin/vpl
chmod +x /usr/bin/vpl_run
/etc/vpl/entrypoint.sh