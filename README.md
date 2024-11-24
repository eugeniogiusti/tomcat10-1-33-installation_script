# tomcat10_1_33_installation_script
Automatic installation and configuration of Tomcat 10.1.33 with Java 11 // Red hat distros compatible
# Java 11 and Tomcat 10.1.33 Installation Script

This script has been tested on **AlmaLinux 9.5** and is compatible with the latest versions of **Rocky Linux** and **Red Hat**.  
It installs **Java 11** and **Tomcat 10.1.33**. Feel free to adapt the script for other purposes or scenarios.

## How to Use

1. **Clone or Download the Repository**  
   Download the script to your system or clone the repository:
   ```bash git clone https://github.com/eugeniogiusti/tomcat10_1_33_installation_script.git
cd tomcat10_1_33_installation_script.git


2. Grant Execution Permissions
Give the script executable permissions:
chmod +x install_tomcat.sh


3. Run the Script
Switch to the root user if you don't want to enter the password during the process:
sudo su
./install_tomcat.sh


4. Configure Firewall Rule if you don't have it
firewall-cmd --zone=public --add-port=8080/tcp --permanent
firewall-cmd --reload
  

5. Verify the Firewall Configuration
Ensure the rule has been applied:
firewall-cmd --list-all
   
6. Test Tomcat
Open your browser and navigate to:

http://your_ip:8080/

Enjoy your installation!
