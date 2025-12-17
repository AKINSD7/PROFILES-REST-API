# # -*- mode: ruby -*-
# # vi: set ft=ruby :

# # All Vagrant configuration is done below. The "2" in Vagrant.configure
# # configures the configuration version (we support older styles for
# # backwards compatibility). Please don't change it unless you know what
# # you're doing.
# Vagrant.configure("2") do |config|
#   # The most common configuration options are documented and commented below.
#   # For a complete reference, please see the online documentation at
#   # https://docs.vagrantup.com.

#   # Every Vagrant development environment requires a box. You can search for
#   # boxes at https://atlas.hashicorp.com/search.
#   config.vm.box = "ubuntu/xenial64"

#   config.vm.network "forwarded_port", host_ip: "127.0.0.1", guest: 8080, host: 8080

#   config.vm.provision "shell", inline: <<-SHELL
#     # Update and upgrade the server packages.
#     sudo apt-get update
#     sudo apt-get -y upgrade
#     # Set Ubuntu Language
#     sudo locale-gen en_GB.UTF-8
#     # Install Python, SQLite and pip
#     sudo apt-get install -y python3-dev sqlite python-pip
#     # Upgrade pip to the latest version.
#     sudo pip install --upgrade pip
#     # Install and configure python virtualenvwrapper.
#     sudo pip install virtualenvwrapper
#     if ! grep -q VIRTUALENV_ALREADY_ADDED /home/vagrant/.bashrc; then
#         echo "# VIRTUALENV_ALREADY_ADDED" >> /home/vagrant/.bashrc
#         echo "WORKON_HOME=~/.virtualenvs" >> /home/vagrant/.bashrc
#         echo "PROJECT_HOME=/vagrant" >> /home/vagrant/.bashrc
#         echo "source /usr/local/bin/virtualenvwrapper.sh" >> /home/vagrant/.bashrc
#     fi
#   SHELL

# end

# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  # Use a supported Ubuntu version
  config.vm.box = "ubuntu/focal64"   # Ubuntu 20.04 LTS

  # Port forwarding
  config.vm.network "forwarded_port",
    guest: 8080,
    host: 8081,
    host_ip: "127.0.0.1"

  # Provisioning
  config.vm.provision "shell", inline: <<-SHELL
    set -e

    echo "Updating system..."
    sudo apt-get update -y
    sudo apt-get upgrade -y

    echo "Setting locale..."
    sudo locale-gen en_GB.UTF-8
    sudo update-locale LANG=en_GB.UTF-8

    echo "Installing dependencies..."
    sudo apt-get install -y \
      python3 \
      python3-dev \
      python3-pip \
      python3-venv \
      sqlite3 \
      build-essential

    echo "Upgrading pip..."
    sudo python3 -m pip install --upgrade pip

    echo "Installing virtualenvwrapper..."
    sudo pip3 install virtualenvwrapper

    BASHRC="/home/vagrant/.bashrc"

    if ! grep -q VIRTUALENV_ALREADY_ADDED $BASHRC; then
      echo "" >> $BASHRC
      echo "# VIRTUALENV_ALREADY_ADDED" >> $BASHRC
      echo "export WORKON_HOME=~/.virtualenvs" >> $BASHRC
      echo "export PROJECT_HOME=/vagrant" >> $BASHRC
      echo "export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3" >> $BASHRC
      echo "source /usr/local/bin/virtualenvwrapper.sh" >> $BASHRC
    fi

    echo "Provisioning complete."
  SHELL

end
