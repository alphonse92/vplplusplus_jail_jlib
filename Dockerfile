FROM alphonse92/vpl-jail-execution-java:latest
ARG JLIB_URL
WORKDIR /tmp/jlib/
RUN curl $JLIB_URL >> /usr/bin/VPLPlusPlus-jlib.jar 
CMD ["./entrypoint.sh"]
