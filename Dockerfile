FROM centos:7

RUN yum install -y openssh-server
RUN mkdir /var/run/sshd
RUN sed 's@qsession\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

COPY init.sh /init.sh
RUN chmod +x /init.sh
EXPOSE 22

CMD ["bash", "/init.sh" ]