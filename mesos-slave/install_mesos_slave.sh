# Setup
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv E56151BF
DISTRO=$(lsb_release -is | tr '[:upper:]' '[:lower:]')
CODENAME=$(lsb_release -cs)

# Add the repository
echo "deb http://repos.mesosphere.com/${DISTRO} ${CODENAME} main" | \
  sudo tee /etc/apt/sources.list.d/mesosphere.list
sudo apt-get -y update

# Install mesos
sudo apt-get -y install mesos

# Disable unnecessary services
sudo service zookeeper stop
sudo sh -c "echo manual > /etc/init/zookeeper.override"
sudo service mesos-master stop
sudo sh -c "echo manual > /etc/init/mesos-master.override"
