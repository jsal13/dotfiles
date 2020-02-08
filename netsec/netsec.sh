# Initialize programs for netsec use on UBUNTU.
# Assumes original setup is done.  
# Run with sudo.

sudo apt-get update
sudo apt-get install -y \
    debconf-utils \
    nmap

# Sets commands for wireshark, noninteractively installs it.
echo "wireshark-common wireshark-common/install-setuid boolean true" | sudo debconf-set-selections 
sudo DEBIAN_FRONTEND=noninteractive apt-get -y install wireshark
