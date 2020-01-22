#!/bin/bash

## Create Script to Test Vpl++ Activities

ENVAR_NAME_FILE=$(date +%s)

echo "#!/bin/bash " >> /usr/bin/$ENVAR_NAME_FILE
echo "export ENV=${ENV}" >> /usr/bin/$ENVAR_NAME_FILE
echo "export API_URL=${API_URL}" >> /usr/bin/$ENVAR_NAME_FILE
echo "export API_TOKEN=${API_TOKEN}" >> /usr/bin/$ENVAR_NAME_FILE

cat > /usr/bin/vpl <<EOF
#!/bin/bash 

echo "Running Vpl ++ Evaluate Script - Vpl ++ Jlib runner V.1.0.0"
echo "Ingeniería de Sistemas - UFPS"

## Writte the vpl_execution program
echo "#!/bin/bash" >> \$1/vpl_execution

## Set Variables
echo ". /usr/bin/$ENVAR_NAME_FILE" >> \$1/vpl_execution

## Set environment variables from moodle
echo ". vpl_environment.sh" >> \$1/vpl_execution

## Compiing the classes
echo "javac -nowarn -encoding UTF-8  -cp "/usr/bin/VPLPlusPlus-jlib.jar" \$1/*.java  || export COMPILATION_ERROR=true" >> \$1/vpl_execution

## Remove the java files 
echo "rm -rf \$1/*.java"  >> \$1/vpl_execution

## Execute the runner
export VPL_PLUS_PLUS_PROJECT_ID=$2
echo "java -jar /usr/bin/VPLPlusPlus-jlib.jar -f \$1" >> \$1/vpl_execution

## Make executable vpl_execution
chmod +x  \$1/vpl_execution
EOF
chmod +x /usr/bin/vpl


cat > /usr/bin/vpl_run <<EOF
#!/bin/bash 

echo "Running Vpl ++ Run Script - Vpl ++ Jlib runner V.1.0.0"
echo "Ingeniería de Sistemas - UFPS"

## Writte the vpl_execution program
echo "#!/bin/bash" >> \$1/vpl_execution

## Compiling the classes
echo "javac -nowarn -encoding UTF-8  -cp "/usr/bin/VPLPlusPlus-jlib.jar" \$1/*.java" >> \$1/vpl_execution

## Remove the java files 
echo "rm -rf \$1/*.java"  >> \$1/vpl_execution

## Execute the just java
echo 'if test -f "main.class"; then' >> \$1/vpl_execution
echo '    java main'>> \$1/vpl_execution
echo 'else' >> \$1/vpl_execution
echo '    echo "Main class not found (main.java)"' >> \$1/vpl_execution
echo 'fi' >> \$1/vpl_execution

## Make executable vpl_execution
chmod +x \$1/vpl_execution
EOF
chmod +x /usr/bin/vpl_run

/etc/vpl/entrypoint.sh