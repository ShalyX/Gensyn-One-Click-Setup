## Gensyn One-Click RL Swarm Node Setup

Simplify your Gensyn Testnet experience.
This utility script automates the full setup for the Gensyn RL Swarm node, eliminating 10+ manual commands for dependency installation, virtual environment setup, and session management.

---

## ✅ Features

* **One-Click Dependencies:** Installs all required packages (`Python` `3.10+`, `Git`, `Yarn`, `Node.js`).
* **Isolated Environment:** Creates and activates a Python virtual environment (`.venv`).
* **Screen Session Management:** Automatically starts your node in a **`screen`** session named `gensyn` for reliable background operation.
* **Local Tunnel Setup:** Provides clear instructions for the required `localtunnel` for browser login and authentication.

---

## 💻 Prerequisites

* **OS:** Ubuntu 22.04+ or WSL 2.
* **Hardware:** CPU & GPU supported 
                - Recommended **24GB RAM** minimum and a modern **CUDA-enabled GPU** (e.g., RTX 3090, A100).
                - CPU-only: `arm64` , `amd64` or `x86 CPU` with minimum **32GB RAM**
* **Accounts:** A **Hugging Face Account** (you will need a Write-access token).

## ⚡ Quick Start

* Execute the following commands in your terminal:

```bash
# 1. Download the script
git clone https://github.com/ShalyX/Gensyn-One-Click-Setup
cd Gensyn-One-Click-Setup

# 2. Make the script executable
chmod +x setup_gensyn_node.sh

# 3. Run the installer
./setup_gensyn_node.sh```

(The script will take several minutes to complete the full setup.)




🟢 Running & Authentication
* Follow Prompts: After setup, the script will prompt you to resume the tunnel screen. Do this in a new terminal window to get your public URL.

```bash
screen -r lt_tunnel```

* Now use this command to get the password of this website
```bash
curl https://loca.lt/mytunnelpassword```

* Authenticate: Visit the public URL in your browser and complete the Gensyn login.
* Sign In using email address and then paste OTP

* Check Status: Return to your original terminal. Once authenticated, your node will begin processing tasks in the background.
* Respond to questions asked appropriately
* `Would you like to push models you train in the RL swarm to the Hugging Face Hub? [y/N]` : Write N
When you will see interface like this, you can detach from this screen session

* To re-attach to your node's logs, use:

Bash
```bash
screen -r gensyn ```
Press Ctrl + A then D to detach safely.
