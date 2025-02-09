# cPanel Server Setup Script for Dedicated Servers

This script automates the installation and configuration of a **cPanel-based server** optimized for shared hosting environments. It simplifies the setup process for web hosting servers by installing essential software such as **cPanel & WHM**, **Apache**, **MariaDB**, **PHP**, **Pure-FTPd**, **ClamAV**, **CSF firewall**, **AutoSSL**, and applies performance and security optimizations. The script is ideal for administrators who want a fast, secure, and easy cPanel server deployment for web hosting.

## Key Features

This script installs and configures the following essential components:

- **cPanel/WHM Installation**: Installs cPanel/WHM on a CentOS server, enabling easy server management and hosting account setup.
- **Web Server Setup**: Installs **Apache** and configures it for optimized performance, with **mod_deflate** and **mod_brotli** for improved content compression.
- **Database Server Setup**: Installs **MariaDB**, configures it for high performance, and ensures MySQL optimization.
- **PHP Setup**: Installs the latest **PHP 7.4**, compatible with cPanel, and configures **PHP-FPM** for better performance and resource usage.
- **FTP Setup**: Installs and configures **Pure-FTPd** for file transfer capabilities.
- **Security Setup**: Installs **ClamAV** for malware scanning and configures **CSF Firewall** (ConfigServer Security & Firewall) to protect the server from attacks.
- **SSL Setup**: Automatically installs SSL certificates using **AutoSSL** for all hosted domains.
- **Performance Optimizations**: Includes various Apache, PHP, and MySQL optimizations for better server performance.
- **Additional Installations**: Installs Brotli compression and various useful tools for optimal server operation.

## Prerequisites

Before running the script, make sure your server meets the following requirements:

- **Fresh CentOS 7 or higher** server.
- **Root access** to the server.
- A valid **cPanel license**.
- Basic knowledge of **Linux server administration**.

## Installation Steps

### 1. Clone this repository or download the script:

To get started, clone the repository or download the script to your server.

```bash
git clone https://github.com/iammaksudul/cpanel-server-setup.git
cd cpanel-server-setup
```

### 2. Make the script executable:

After downloading the script, you need to make it executable by running the following command:

```bash
chmod +x setup-cpanel-server.sh
```

### 3. Run the script as root:

Now, you can run the script with root privileges. This will start the installation and configuration process.

```bash
sudo ./setup-cpanel-server.sh
```

### 4. Wait for the installation to complete:

The script will download and install the required packages, configure your server, and apply performance and security optimizations. It may take some time to complete the entire process, depending on your server's resources.

---

## Post-Installation Configuration

Once the script completes, you'll need to perform a few additional configurations:

### 1. Log into **WHM**:

- Open your browser and navigate to `https://your-server-ip:2087` to access the **WebHost Manager (WHM)**.
- Log in with your **root credentials**.

### 2. Configure AutoSSL:

To secure your domains with SSL certificates, enable **AutoSSL**:

- Go to **WHM > SSL/TLS > Manage AutoSSL**.
- Ensure **AutoSSL** is enabled to automatically issue and renew SSL certificates for your hosted domains.

### 3. Check the status of installed services:

After the installation, you can check the status of the key services to make sure everything is running as expected:

- **Apache (Web Server)**:
  ```bash
  systemctl status httpd
  ```

- **MariaDB (Database Server)**:
  ```bash
  systemctl status mariadb
  ```

- **CSF Firewall**:
  ```bash
  csf -l
  ```

---

## Detailed Explanation of the Script

Here’s a detailed breakdown of the actions performed by the script:

1. **System Update**:
   - The script starts by updating the server to ensure that all packages are up-to-date and the latest security patches are applied.

2. **Install cPanel & WHM**:
   - The script installs the **latest version of cPanel** (including WebHost Manager or WHM). This step automates the download and installation process using cPanel's installer.

3. **Install Apache Web Server**:
   - Apache is installed as the web server. The script also enables optimization settings for **Keep-Alive** and **Timeout** for better performance.

4. **Install MariaDB Database Server**:
   - **MariaDB** (an open-source MySQL-compatible database server) is installed to manage databases for your hosted websites. The script configures **MySQL optimizations** for better speed and performance.

5. **Install PHP (compatible with cPanel)**:
   - PHP (version 7.4) is installed along with **PHP-FPM** (FastCGI Process Manager). PHP-FPM improves the performance of PHP scripts and is especially useful in shared hosting environments.

6. **Install Pure-FTPd for File Transfers**:
   - **Pure-FTPd** is installed for secure FTP functionality. It allows users to upload and download files from the server via FTP.

7. **Install ClamAV for Malware Scanning**:
   - **ClamAV** is installed to scan for malware and potential threats on the server, ensuring that hosted websites and files are secure.

8. **Install and Configure CSF Firewall**:
   - **ConfigServer Security & Firewall (CSF)** is installed to provide essential server security. The firewall protects the server from unwanted attacks and ensures secure operations.

9. **Apache Optimization**:
   - Apache’s **Keep-Alive** feature is enabled, reducing the latency for repeat HTTP requests and improving performance.

10. **Enable Content Compression**:
    - **mod_deflate** is enabled to compress content on the server. This speeds up page load times by reducing the size of data being transferred to users.
    - **Brotli** compression is installed for further performance improvements.

11. **SSL Configuration with AutoSSL**:
    - **AutoSSL** is configured to automatically install SSL certificates for hosted domains, enabling HTTPS and improving security.

12. **Restart Services**:
    - The script restarts **Apache** and **MariaDB** to apply all the changes and configurations.

13. **Clean Up**:
    - After installation, unnecessary packages and dependencies are removed, keeping the system clean and efficient.

---

## Troubleshooting

If you encounter any issues, here are some common troubleshooting tips:

- **Apache Won't Start**: Check the Apache error log to identify the issue:
  ```bash
  tail -f /var/log/httpd/error_log
  ```

- **MySQL Fails to Start**: Verify the `my.cnf` configuration file and restart MySQL:
  ```bash
  systemctl restart mariadb
  ```

- **Firewall Blocking Legitimate Traffic**: If legitimate traffic is blocked by CSF, you can view the firewall rules:
  ```bash
  csf -l
  ```

- **Check Service Status**: Always ensure that Apache, MySQL, and CSF are running:
  ```bash
  systemctl status httpd
  systemctl status mariadb
  csf -l
  ```

---

## Customization Options

The script is flexible and can be customized to fit your needs:

- **PHP Versions**: If you need a different PHP version, modify the script to install the required PHP version and configure PHP-FPM accordingly.
- **Backup Tools**: Integrate backup solutions such as **R1Soft** or **JetBackup** for automated backups.
- **Additional Software**: Feel free to add any additional software (e.g., **nginx** or **Redis**) that might be required for your specific use case.

---

## License

This script is open-source and available under the **MIT License**. You are free to use, modify, and distribute it.
