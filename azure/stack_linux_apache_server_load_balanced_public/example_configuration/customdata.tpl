#!/bin/bash
sudo apt-get update -y &&
sudo apt-get install -y \
apache2
sudo apt-get update -y &&
sudo ufw allow 'Apache'
# acquiring the ip address for access to the web server
#echo "this is the public IP address:" `curl -4 icanhazip.com`
# adding the needed permissions for creating and editing the index.html file
sudo chown -R $USER:$USER /var/www
# creating the html landing page
cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
<title>apache.web.server</title>
<meta charset="UTF-8">
</head>
<body>
<h1>This server was built automatically using Terraform</h1>
<h2>Hostname : $(hostname)</h2>
</body>
</html>
EOF