
FROM debian

RUN apt update && apt install -y openssh-server

RUN echo "root:debian" | chpasswd

RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

RUN printf  "%s\n" \
"#!/bin/bash" \
"set -e" \
"whoami" \
"echo" \
"echo 'starting ssh'" \
"service ssh start" \
"echo" \
"echo" \
"/bin/bash" \
 > 'start-up.sh'
 
CMD ["bash","start-up.sh"]