FROM ubuntu:18.04

WORKDIR /tmp

RUN apt-get update \
    && apt-get install git -y \
    && apt-get install python3-pip -y \
    && apt-get install python3-setuptools -y \
    && pip3 install https://github.com/Shynixn/sphinx_rtd_theme/releases/download/C1.0/sphinx_rtd_theme.zip \
    && pip3 install sphinx

COPY entrypoint.sh entrypoint.sh
RUN chmod +x entrypoint.sh

ENTRYPOINT ["/tmp/entrypoint.sh"]
#CMD ["sh","-c","/bin/bash"]
