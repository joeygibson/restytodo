FROM library/alpine:latest

EXPOSE 8080

# COPY restytodo /opt/bin/restytodo

ENTRYPOINT ["/opt/project/restytodo"]
