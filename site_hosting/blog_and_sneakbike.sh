sudo apt-get update && sudo apt-get -y upgrade
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common

# Set up ufw.
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow ssh
sudo ufw allow http
sudo ufw allow https
sudo ufw enable


# Do the install
adduser james
# put in a password like 'x' or something ezpz.
usermod -aG sudo james


# Get ghost and docker repos.
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"

# Install all packages.
sudo apt-get install -y docker-ce gcc git g++ mysql-server nodejs nginx

sudo groupadd docker
sudo usermod -aG docker $USER
sudo usermod -aG docker james

# Configure mysql and Ghost.  Change password, obv.
sudo mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';"

sudo npm install ghost-cli@latest -g

su - james
sudo mkdir -p /var/www/ghost && sudo chown james:james /var/www/ghost && sudo chmod 775 /var/www/ghost && cd /var/www/ghost && ghost install


# REBOOT HERE
reboot

# Set up Sneakbike
mkdir -p ~/repos && cd ~/repos && git clone https://github.com/jsal13/sneakbike.git 
sudo snap install --classic certbot

echo "alias refresh_sb=\"docker stop \$( docker ps | awk 'NR>1 { print \$1}') && docker rm $(docker ps -a -q) && git pull origin master &&  docker build -t sneakbike . &&  docker run -d -p 8000:8080 sneakbike\"" >> ~/.bash_profile && source ~/.bash_profile


# SSL Stuff
sudo certbot certonly --nginx -d sneakbikemysteryrace.com -d www.sneakbikemysteryrace.com

# The /etc/nginx/sites-enabled/default should be as follows:

# server {
#     server_name sneakbikemysteryrace.com www.sneakbikemysteryrace.com;
    
#     location / {
#         proxy_pass  http://localhost:8000;
#     }

#     listen [::]:443 ssl ipv6only=on;
#     listen 443 ssl;
#     ssl_certificate /etc/letsencrypt/live/sneakbikemysteryrace.com/fullchain.pem;
#     ssl_certificate_key /etc/letsencrypt/live/sneakbikemysteryrace.com/privkey.pem;
#     include /etc/letsencrypt/options-ssl-nginx.conf;
#     ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem

# }

# server {
#     if ($host = www.sneakbikemysteryrace.com) {
#         return 301 https://$host$request_uri;
#     }

#     if ($host = sneakbikemysteryrace.com) {
#         return 301 https://$host$request_uri;
#     }

#     listen  80;
#     listen  [::]:80 default_server;
#     server_name sneakbikemysteryrace.com www.sneakbikemysteryrace.com;
#         return 404;

# }


