# Container image that runs your code
FROM ubuntu:20.04

COPY wkhtmltox_0.12.6-1.focal_amd64.deb /wkhtmltox_0.12.6-1.focal_amd64.deb
COPY pandoc-2.10.1-1-amd64.deb /pandoc-2.10.1-1-amd64.deb
COPY generate.sh /generate.sh
RUN chmod a+x /generate.sh

RUN apt-get update
RUN apt-get install -y git
RUN apt-get install -y /wkhtmltox_0.12.6-1.focal_amd64.deb
RUN apt-get install -y /pandoc-2.10.1-1-amd64.deb

#ENTRYPOINT ["/usr/bin/pandoc"]

