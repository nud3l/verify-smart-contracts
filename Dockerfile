# Use phusion/baseimage as base image. To make your builds reproducible, make
# sure you lock down to a specific version, not to `latest`!
# See https://github.com/phusion/baseimage-docker/blob/master/Changelog.md for
# a list of version numbers.
FROM phusion/baseimage:0.10.1

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# Install KEVM dependencies
RUN apt-get update -qq -y \
 && apt-get install make gcc maven openjdk-8-jdk flex opam pkg-config libmpfr-dev autoconf libtool pandoc zlib1g-dev -y \
 && apt-get install z3 libz3-dev -y \
 && apt-get install git -y

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Clone KEVM repo and build project
RUN git clone https://github.com/kframework/evm-semantics.git \
 && cd evm-semantics \
 && make deps \
 && make

# Test 
RUN cd evm-semantics \
 %% make test

# Enable SSH
RUN rm -f /etc/service/sshd/down

# Regenerate SSH host keys. baseimage-docker does not contain any, so you
# have to do that yourself. You may also comment out this instruction; the
# init system will auto-generate one during boot.
# RUN /etc/my_init.d/00_regen_ssh_host_keys.sh
RUN /usr/sbin/enable_insecure_key
