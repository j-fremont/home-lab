#!/bin/bash

sudo apt update
sudo apt install -y default-jre

# Download the Nexus Repository Manager package via the wget command.
wget -qO - https://download.sonatype.com/nexus/3/nexus-3.83.0-08-linux-x86_64.tar.gz | tar -xzvf - -C /opt

# Change the ownership of both directories to the user and group 'nexus' via the chown command.
sudo adduser nexus --gecos "First Last,RoomNumber,WorkPhone,HomePhone" --home /opt/nexus-3.83.0-08 --shell /bin/bash --disabled-password
sudo chown -R nexus:nexus /opt/nexus-3.83.0-08 /opt/sonatype-work

# With this configuration, you will be running the Nexus application as the system user 'nexus'.
echo 'run_as_user="nexus"' > /opt/nexus-3.83.0-08/bin/nexus.rc

# Running Nexus as SystemD Service.
sudo cat > /etc/systemd/system/nexus.service <<EOF
[Unit]
Description=nexus service
After=network.target

[Service]
Type=forking
LimitNOFILE=65536
ExecStart=/opt/nexus-3.83.0-08/bin/nexus start
ExecStop=/opt/nexus-3.83.0-08/bin/nexus stop
User=nexus
Restart=on-abort

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reload
sudo systemctl enable nexus.service
sudo systemctl start nexus.service
