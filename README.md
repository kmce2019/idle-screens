# Idle Screens

Idle Screens is a **self-hosted dashboard for tablets, kiosks, and wall displays**.

It is designed for:

- Android tablets
- Digital signage
- Office dashboards
- School announcements
- Home lab status screens
- Raspberry Pi displays

The system displays configurable content such as:

- Weather
- Quote of the day
- Announcements
- Server status
- Custom integrations
- API-driven widgets

---

# Features

• Self-hosted  
• Tablet friendly  
• Full-screen dashboard  
• Modular widget system  
• Weather API support  
• Quote of the day  
• Optional integrations  
• Easy server installation  
• Runs on Raspberry Pi, Ubuntu, or Debian  

---

# Example Use Cases

- School announcement displays
- IT status dashboards
- NOC wall screens
- Home Assistant wall tablets
- Sports scoreboard dashboards
- Office breakroom info screens

---

# Requirements

Linux server running:

- Ubuntu
- Debian
- Raspberry Pi OS

Minimum specs:

1 CPU
512MB RAM
1GB disk


---

# Quick Install

Clone the repository:

git clone https://github.com/YOURUSERNAME/idle-screens.git

cd idle-screens


Run installer:

chmod +x install.sh
./install.sh

After installation the dashboard will be available at:
http://SERVER-IP:3000


---

# Service Management

Check status

sudo systemctl status idle-screens

Restart service

sudo systemctl restart idle-screens


Stop service

sudo systemctl stop idle-screens


---

# Updating

Pull the latest version:

cd /opt/idle-screens
git pull
sudo systemctl restart idle-screens


---

# Tablet Setup (Recommended)

For Android tablets use:

**Fully Kiosk Browser**

Settings:


Start URL:
http://SERVER-IP:3000


Enable:

- Fullscreen mode
- Hide navigation bar
- Auto start on boot
- Screen always on

This turns the tablet into a dedicated display.

---

# Folder Structure

idle-screens
│
├── install.sh
├── README.md
├── server.js
├── web/
├── settings/
└── integrations/


---

# Planned Features

- Plugin system
- Announcement CMS
- Multi-screen signage support
- School bell schedule widget
- Grafana / Prometheus integrations
- Calendar support

---

# License

MIT



