# 🧹 Docker Full Removal Script for macOS

This repository/script provides a **complete and safe removal** of Docker and all its residual components from a macOS system.

It targets:

- Docker Desktop app
- Docker CLI binaries
- Docker background daemons
- Docker caches, configs, virtual machines
- Docker-related startup agents and login items
- Hidden artifacts causing warnings or system prompts

---

## 📄 File

- `remove-docker.sh` — Bash script to fully uninstall Docker from your Mac.

---

## 🚀 Usage

1. **Download** or **copy** the script to your local machine.

2. **Make it executable**:

    ```bash
    chmod +x remove-docker.sh
    ```

3. **Run the script**:

    ```bash
    ./remove-docker.sh
    ```

4. **Restart your Mac** after running to fully clear any lingering daemons or services.

---

## 🛡️ What This Script Removes

- Docker Desktop app
- Docker CLI tools (`docker`, `docker-compose`, etc.)
- Docker privileged helper tools and LaunchDaemons
- Docker containers, images, virtual disks
- Docker logs, preferences, caches, saved states
- Background services and login items
- Kubernetes artifacts installed by Docker Desktop

---

## 📋 Important Notes

- This script requires `sudo` access for some system file deletions.
- If you installed Docker via Homebrew or other methods, additional cleanup might be required.
- After rebooting, you can verify Docker has been removed by checking:

    ```bash
    launchctl list | grep -i docker
    ```

(There should be no results.)

---

## ⚠️ Warning

This script will **irreversibly delete** all Docker containers, volumes, and virtual machines from your system.  
Make sure to **backup anything important** before running.

---

## 🪪 License

This script is public domain.  
Use it, modify it, or redistribute it freely.

---

# ✅ Quick Summary

| Step | Command |
|:-----|:--------|
| Make script executable | `chmod +x remove-docker.sh` |
| Run the script | `./remove-docker.sh` |
| Reboot your Mac | (Manually after script runs) |
