#!/bin/bash

# Define variables
TOMCAT_VERSION="10.1.33"  # Update to the latest version if needed
INSTALL_DIR="/opt/tomcat"
USER="tomcat"
GROUP="tomcat"

# Update system and install dependencies
echo "Updating system and installing dependencies..."
sudo dnf update -y
sudo dnf install -y java-11-openjdk wget tar

# Create a system group and user for Tomcat
echo "Creating Tomcat user and group..."
sudo groupadd $GROUP
sudo useradd -r -g $GROUP -d $INSTALL_DIR -s /bin/false $USER

# Download and extract Tomcat
echo "Downloading and installing Tomcat..."
wget https://dlcdn.apache.org/tomcat/tomcat-10/v$TOMCAT_VERSION/bin/apache-tomcat-$TOMCAT_VERSION.tar.gz -P /tmp
sudo mkdir -p $INSTALL_DIR
sudo tar -xvzf /tmp/apache-tomcat-$TOMCAT_VERSION.tar.gz -C $INSTALL_DIR --strip-components=1
sudo rm -f /tmp/apache-tomcat-$TOMCAT_VERSION.tar.gz

# Set ownership and permissions
echo "Setting ownership and permissions..."
sudo chown -R $USER:$GROUP $INSTALL_DIR
sudo chmod -R 755 $INSTALL_DIR

# Create a systemd service file for Tomcat
echo "Creating systemd service file for Tomcat..."
cat <<EOF | sudo tee /etc/systemd/system/tomcat.service
[Unit]
Description=Apache Tomcat
After=network.target

[Service]
Type=forking
User=$USER
Group=$GROUP
Environment=JAVA_HOME=/usr/lib/jvm/jre
Environment=CATALINA_PID=$INSTALL_DIR/temp/tomcat.pid
Environment=CATALINA_HOME=$INSTALL_DIR
Environment=CATALINA_BASE=$INSTALL_DIR
ExecStart=$INSTALL_DIR/bin/startup.sh
ExecStop=$INSTALL_DIR/bin/shutdown.sh
Restart=always

[Install]
WantedBy=multi-user.target
EOF

# Reload systemd and start Tomcat
echo "Reloading systemd and starting Tomcat..."
sudo systemctl daemon-reload
sudo systemctl enable tomcat
sudo systemctl start tomcat

# Verify Tomcat status
echo "Checking Tomcat status..."
sudo systemctl status tomcat

echo "Tomcat installation and setup complete!"
echo "You can access Tomcat at http://<your_server_ip>:8080"