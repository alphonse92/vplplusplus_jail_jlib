FROM alphonse92/vpl-jail-execution-java:latest
ARG JLIB_URL
RUN cd /usr/bin/ \
  && curl $JLIB_URL >> VPLPlusPlus-jlib.jar \
  && chmod +x VPLPlusPlus-jlib.jar 
COPY ./entrypoint.sh ./entrypoint.jlib.sh
CMD ["/etc/vpl/entrypoint.jlib.sh"]
