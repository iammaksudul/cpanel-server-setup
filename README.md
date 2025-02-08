# cpanel-server-setup
This script automates the setup and optimization of a cPanel-based server for shared hosting environments. It installs and configures Apache, MariaDB, PHP, Pure-FTPd, ClamAV, and CSF firewall, while also configuring SSL and performance optimizations, providing a fast, secure, and easy server deployment for web hosting.
Here's a **README.md** template for your GitHub repository:

---

# cPanel Server Setup Script for Dedicated Servers

This script automates the installation and configuration of a **cPanel-based server** optimized for shared hosting environments. It installs and configures essential software such as **Apache**, **MariaDB**, **PHP**, **Pure-FTPd**, **ClamAV**, **CSF firewall**, and **AutoSSL** for securing domains. It's designed for server administrators looking to deploy a cPanel server with optimized settings quickly.

## Features

- **cPanel/WHM Installation**: Installs and configures cPanel/WHM for managing hosting accounts.
- **Web Server Setup**: Installs and optimizes **Apache** with **mod_deflate** and **mod_brotli** for compression.
- **Database Setup**: Installs **MariaDB** and optimizes MySQL performance settings.
- **PHP Setup**: Installs the latest version of **PHP** compatible with cPanel, and configures **PHP-FPM** for better performance.
- **FTP Setup**: Installs **Pure-FTPd** for file transfer capabilities.
- **Security Setup**: Installs **ClamAV** for malware scanning and configures **CSF Firewall** for server security.
- **SSL Configuration**: Automatically installs SSL certificates using **AutoSSL** in cPanel.
- **Optimizations**: Includes performance optimizations for web and database servers.
  
## Prerequisites

Before running the script, ensure your server meets the following requirements:

- A **fresh CentOS 7** or higher server.
- Root access to the server.
- A valid **cPanel license**.
- Basic knowledge of Linux server administration.

## Installation

### 1. Clone this repository or download the script:

```bash
git clone https://github.com/yourusername/cpanel-server-setup.git
cd cpanel-server-setup
```

### 2. Make the script executable:

```bash
chmod +x setup-cpanel-server.sh
```

### 3. Run the script as root:

```bash
./setup-cpanel-server.sh
```

This will begin the installation of **cPanel**, configure **Apache**, **MariaDB**, **PHP**, and other essential software, and perform optimizations for your server's performance and security.

## Configuration After Installation

### 1. Log into **WHM**:

After the script completes, log into **WHM** by visiting `https://your-server-ip:2087`. Use your **root credentials** to complete any additional configurations.

### 2. Configure AutoSSL:

- Go to **WHM > SSL/TLS > Manage AutoSSL**.
- Ensure **AutoSSL** is enabled to automatically secure all hosted domains.

### 3. Verify Services:

After the script has finished, check the status of installed services:

- **Apache**:
  ```bash
  systemctl status httpd
  ```

- **MariaDB**:
  ```bash
  systemctl status mariadb
  ```

- **CSF Firewall**:
  ```bash
  csf -l
  ```

### 4. Customize PHP and MySQL Settings (Optional):

You can modify the configurations based on your needs:

- **MySQL**: Edit `my.cnf` for optimized settings.
- **Apache**: Edit `/etc/httpd/conf/httpd.conf` for additional performance tweaks.

## Troubleshooting

- **Apache Won't Start**: Check Apache's error log:
  ```bash
  tail -f /var/log/httpd/error_log
  ```

- **MySQL Fails to Start**: Verify the `my.cnf` configuration and restart MySQL:
  ```bash
  systemctl restart mariadb
  ```

- **Firewall Blocking Legit Traffic**: Check CSF rules:
  ```bash
  csf -l
  ```

## Customization

Feel free to modify the script according to your needs:

- **Modify PHP Versions**: Adjust the script to install specific PHP versions if necessary.
- **Backup Solutions**: You can add backup tools like **R1Soft** or **JetBackup** to the script for automated backups.

## License

This script is open-source and available under the **MIT License**. You are free to use, modify, and distribute it.




