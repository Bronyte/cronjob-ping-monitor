#!/bin/bash

# ---------- CONFIGURATION ----------
LOG_FILE="/var/log/ping_check.log"
DATE=$(date '+%Y-%m-%d %H:%M:%S')
ALERT_EMAIL="your@email.com"   # <-- Replace with your email

# ---------- TARGETS ----------

# Replace the target IPs with your own.

TARGETS=(
  "8.8.8.8"          # Google DNS
  "192.168.0.1"      # Gateway
  "192.168.1.100"    # Placeholder IP 1
  "192.168.1.101"    # Placeholder IP 2
  "192.168.1.102"    # Placeholder IP 3
)



# ---------- PING CHECK ----------
for ip in "${TARGETS[@]}"; do
    if ping -c 1 -W 2 "$ip" > /dev/null 2>&1; then
        echo "$DATE - SUCCESS: $ip is reachable" >> "$LOG_FILE"
    else
        echo "$DATE - FAILURE: $ip is NOT reachable" >> "$LOG_FILE"
        echo -e "Subject: Ping Alert - $ip Down\n\n$DATE - $ip is not reachable" | sendmail "$ALERT_EMAIL"
    fi
done
