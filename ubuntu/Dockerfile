FROM ubuntu:20.04

# Install sshd and ping package
RUN apt-get update
RUN apt-get install -y openssh-server

# Disable password protection in sshd_config
RUN sed -i 's/#PermitEmptyPasswords no/PermitEmptyPasswords yes/' /etc/ssh/sshd_config
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/^UsePAM yes/UsePAM no/' /etc/ssh/sshd_config

# Set empty root password
RUN passwd -d root

# Start service and keep alive
ENTRYPOINT service ssh restart && tail -f /dev/null

# Expose port 22
EXPOSE 22