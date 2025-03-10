# Tomcat10-1-33-installation_script

This script has been tested on **AlmaLinux 9.5** and is compatible with the latest versions of **Rocky Linux** and **Red Hat**.  
It installs **Java 11** and **Tomcat 10.1.33**.
The version of Tomcat is the latest and this version of Java ensures backward compatibility with legacy systems while also offering several of the latest Java features. A key feature of this script is the integration of Tomcat management directly with systemd, eliminating the need for manual execution of start and stop scripts. You can easily manage Tomcat using systemctl commands, with the service name being tomcat.
Feel free to adapt the script for other purposes or scenarios.

## How to Use

1. **Clone or Download the Repository**  
   Download the script to your system or clone the repository:
   ```bash
   dnf update -y
   
   dnf install git
   
   git clone https://github.com/eugeniogiusti/tomcat10_1_33_installation_script.git
   
   cd tomcat10_1_33_installation_script


2. Grant Execution Permissions
Give the script executable permissions:
   ```bash
   chmod +x install_tomcat.sh


4. Run the Script &
Switch to the root user if you don't want to enter the password during the process:
   ```bash
   sudo su
   ./install_tomcat.sh


6. Configure Firewall Rule if you don't have it:
   ```bash
   firewall-cmd --zone=public --add-port=8080/tcp --permanent
   firewall-cmd --reload
  

8. Verify the Firewall Configuration
Ensure the rule has been applied:
   ```bash
   firewall-cmd --list-all

   
10. Test Tomcat
Open your browser and navigate to:
http://your_local_ip:8080/

![image](https://github.com/user-attachments/assets/25843573-a6b8-438e-842b-ed828e7ea267)


