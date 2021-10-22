# This Dockerfile is optional and an alternative
# The purpose is it's lighter than ubuntu as it installs alpine with sshd
# Publicly available thanks to Daniel Guerra
FROM danielguerra/alpine-sshd

# Install sed
RUN apk add sed

# Disable password protection in sshd_config
RUN sed -i 's/#PermitEmptyPasswords no/PermitEmptyPasswords yes/' /etc/ssh/sshd_config
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/^UsePAM yes/UsePAM no/' /etc/ssh/sshd_config

# Set empty root password
RUN passwd -d root

# Keep alive
CMD ["/usr/sbin/sshd","-D"]

# Expose port 22
EXPOSE 22