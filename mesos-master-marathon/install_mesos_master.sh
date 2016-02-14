# Setup
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv E56151BF
DISTRO=$(lsb_release -is | tr '[:upper:]' '[:lower:]')
CODENAME=$(lsb_release -cs)

# Add the repository
echo "deb http://repos.mesosphere.com/${DISTRO} ${CODENAME} main" | \
  sudo tee /etc/apt/sources.list.d/mesosphere.list

sudo apt-add-repository ppa:webupd8team/java

# Update the packages.
sudo apt-get update

# Install the latest OpenJDK.
sudo apt-get install -y oracle-java8-installer

# Install a few utility tools.
sudo apt-get install -y tar wget git

# Install autotools (Only necessary if building from git repository).
sudo apt-get install -y autoconf libtool

# Install other Mesos dependencies.
sudo apt-get -y install build-essential python-dev python-boto libcurl4-nss-dev libsasl2-dev libsasl2-modules maven libapr1-dev libsvn-dev

# Install mesos, maration with its dependencies like zookeeper.
sudo apt-get -y install mesos marathon

# Disable unnecessary services.
sudo service mesos-slave stop
sudo sh -c "echo manual > /etc/init/mesos-slave.override"
