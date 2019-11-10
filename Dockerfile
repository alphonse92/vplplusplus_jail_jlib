FROM alphonse92/vpl-jail-execution-java:latest
ARG JLIB_URL
RUN cd /usr/bin/ \
  && curl $JLIB_URL >> VPLPlusPlus-jlib.jar \
  && echo "#!/bin/bash" >> vpl \
  && echo "java -jar /usr/bin/VPLPlusPlus-jlib.jar" >> vpl \
  && chmod +x VPLPlusPlus-jlib.jar \
  && chmod +x vpl 
CMD ["/etc/vpl/entrypoint.sh"]
