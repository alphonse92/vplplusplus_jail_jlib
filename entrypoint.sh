#!/bin/bash

## Create script to test vpl++ activities
rm -rf /usr/bin/vpl
echo "#!/bin/bash"  >> /usr/bin/vpl
echo "export ENV=${ENV}" >> /usr/bin/vpl
echo "export API_URL=${API_URL}" >> /usr/bin/vpl
echo "export API_TOKEN=${API_TOKEN}" >> /usr/bin/vpl
echo 'echo "Testing class."'   >> /usr/bin/vpl
echo 'echo ""' >> /usr/bin/vpl
echo 'javac -nowarn -encoding UTF-8 -cp "/usr/bin/VPLPlusPlus-jlib.jar" $1*.java  || export COMPILATION_ERROR=true'  >> /usr/bin/vpl
echo 'java -jar /usr/bin/VPLPlusPlus-jlib.jar -f $1' >> /usr/bin/vpl
echo 'echo ""' >> /usr/bin/vpl
echo 'echo "Test Script - Vpl ++ Jlib runner V.1.0.0"'  >> /usr/bin/vpl
echo 'echo "Ingeniería de Sistemas - UFPS"'  >> /usr/bin/vpl


#Create script to run the test, adding to the claspath the jlib to get no errors
rm -rf /usr/bin/vpl_run
echo "#!/bin/bash"  >> /usr/bin/vpl_run
echo 'echo "Running class."'   >> /usr/bin/vpl_run
echo 'echo ""'  >> /usr/bin/vpl_run
echo 'javac -nowarn -encoding UTF-8  -cp "/usr/bin/VPLPlusPlus-jlib.jar" $1*.java || export COMPILATION_ERROR=true' >> /usr/bin/vpl_run

echo 'if test -f "main.class"; then' >> /usr/bin/vpl_run
echo '    java -cp . main' >> /usr/bin/vpl_run
echo 'else' >> /usr/bin/vpl_run
echo '    echo "Main class not found"' >> /usr/bin/vpl_run
echo 'fi' >> /usr/bin/vpl_run

echo 'echo ""'  >> /usr/bin/vpl_run
echo 'echo "End of class execution."'  >> /usr/bin/vpl_run
echo 'echo "Did you not see the output? Make sure there is a main class."'  >> /usr/bin/vpl_run
echo 'echo "Run Script - Vpl ++ Jlib runner V.1.0.0"'  >> /usr/bin/vpl_run
echo 'echo "Ingeniería de Sistemas - UFPS"'  >> /usr/bin/vpl_run

chmod +x /usr/bin/vpl
chmod +x /usr/bin/vpl_run
/etc/vpl/entrypoint.sh