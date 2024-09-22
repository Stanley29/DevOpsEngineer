#!/bin/bash

# Function to detect the Linux distribution
detect_distro() {
  if [ -f /etc/os-release ]; then
    . /etc/os-release
    DISTRO=$ID
  else
    echo "Unsupported distribution"
    exit 1
  fi
}

# Function to install packages on Ubuntu/Debian
install_ubuntu() {
  sudo apt-get update
  sudo apt-get install -y "$@"
}

# Function to install packages on Fedora
install_fedora() {
  sudo dnf update -y
  sudo dnf install -y "$@"
}

# Function to install packages on CentOS
install_centos() {
  sudo yum update -y
  sudo yum install -y "$@"
}

# Function to install packages based on detected distribution
install_packages() {
  case $DISTRO in
    ubuntu|debian)
      install_ubuntu "$@"
      ;;
    fedora)
      install_fedora "$@"
      ;;
    centos)
      install_centos "$@"
      ;;
    *)
      echo "Unsupported distribution"
      exit 1
      ;;
  esac
}

# Main script execution
main() {
  detect_distro

  # Default packages to install
  packages=(apache2 mariadb-server ufw docker.io)

  # Add any additional packages specified as arguments
  if [ "$#" -gt 0 ]; then
    packages+=("$@")
  fi

  # Install the packages
  install_packages "${packages[@]}"

  # Additional configuration can be added here
  echo "Configuration completed for $DISTRO"
}

# Run the main function
main "$@"