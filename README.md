# Ping Monitor – Cron-based Host Availability Checker

A lightweight Bash script that pings multiple hosts (Google, localhost, and user-defined IPs) on a schedule using `cron`.  
It logs results and sends email alerts if any target becomes unreachable.

---

## ✨ Features
- Pings Google DNS (`8.8.8.8`), and custom IPs.
- Logs results with timestamps into `/var/log/ping_check.log`.
- Sends email alerts if a host is unreachable.
- Fully automated with a cron job.

---

## 📂 Project Structure
```
ping-monitor/
├── ping_check.sh   # Main script
└── README.md       # Documentation
```

---

## ⚙️ Installation & Setup

### 1. Clone this repository
```bash
git clone https://github.com/bronyte/cronjob-ping-monitor.git
cd cronjob-ping-monitor
```

### 2. Make the script executable
```bash
chmod +x ping_check.sh
```

### 3. Move the script to a safe location (optional)
```bash
sudo mv ping_check.sh /usr/local/bin/
```

### 4. Install mail utilities (for email alerts)
- Debian/Ubuntu:
  ```bash
  sudo apt-get install mailutils -y
  ```
- CentOS/RHEL:
  ```bash
  sudo yum install mailx -y
  ```

---

## 📋 Configuration

Open `ping_check.sh` and update the following:

```bash
ALERT_EMAIL="your@email.com"

#Targets can be modified to need

TARGETS=(
  "8.8.8.8"          # Google DNS 
  "192.168.1.100"    # Custom IP 1
  "192.168.1.101"    # Custom IP 2
  "192.168.1.102"    # Custom IP 3
  # Add more Custom IP as needed
)
```

Replace the placeholder IPs and email address with your own.

---

## ▶️ Usage

### Run manually
```bash
./ping_check.sh
```

### Setup a cron job
Open your crontab:
```bash
crontab -e
```

Add this line to run the script every 5 minutes:
```cron
*/5 * * * * /usr/local/bin/ping_check.sh
```

Save and exit. The script will now run automatically.

---

## 📊 Logs

Logs are stored at:
```
/var/log/ping_check.log
```

Example:
```
2025-09-03 12:00:00 - SUCCESS: 8.8.8.8 is reachable
2025-09-03 12:05:00 - FAILURE: 192.168.1.100 is NOT reachable
```

---

## 📧 Alerts

When a host fails, an email is sent:

**Subject:**  
`Ping Alert - 192.168.1.100 Down`

**Body:**  
```
2025-09-03 12:05:00 - 192.168.1.100 is not reachable
```

---

## 🛠️ Roadmap
- [ ] Prevent repeated spam alerts until host recovers  
- [ ] Add configurable log file path  
- [ ] Docker support  

---
