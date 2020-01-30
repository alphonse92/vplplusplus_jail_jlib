FROM alphonse92/vpl-jail-execution-java:latest
ARG JLIB_URL
WORKDIR /usr/bin/
COPY ./app/vpl .
COPY ./app/vpl_run .
RUN chmod +x vpl \
  && chmod +x vpl_run \
  && curl $JLIB_URL >> VPLPlusPlus-jlib.jar \
  && chmod +x VPLPlusPlus-jlib.jar 
WORKDIR /etc/vpl/
COPY ./entrypoint.sh ./entrypoint.jlib.sh
CMD ["/etc/vpl/entrypoint.jlib.sh"]
