#!/bin/sh

_install () {
  apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

  cat > /etc/apt/sources.list.d/docker.list <<- EOF
	deb https://get.docker.com/ubuntu docker main
	deb https://apt.dockerproject.org/repo debian-jessie main 
EOF

  apt-get update -q
  apt-get install -y lxc-docker python-pip

  pip install -U docker-compose

  wget -q -O /usr/local/bin/docker-cleanup-volumes https://raw.githubusercontent.com/chadoe/docker-cleanup-volumes/master/docker-cleanup-volumes.sh
  chmod +x /usr/local/bin/docker-cleanup-volumes
}

_install
