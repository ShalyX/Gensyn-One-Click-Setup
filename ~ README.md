## Gensyn One-Click RL Swarm Node Setup

Simplify your Gensyn Testnet experience.
This utility script automates the full setup for the Gensyn RL Swarm node, eliminating 10+ manual commands for dependency installation, virtual environment setup, and session management.

---

## ✅ Features

* **One-Click Dependencies:** Installs all required packages (Python 3.10+, Git, Yarn, Node.js).
* **Isolated Environment:** Creates and activates a Python virtual environment (`.venv`).
* **Screen Session Management:** Automatically starts your node in a **`screen`** session named `gensyn` for reliable background operation.
* **Local Tunnel Setup:** Provides clear instructions for the required `localtunnel` for browser login and authentication.

---

## 💻 Prerequisites

* **OS:** Ubuntu 22.04+ or WSL 2.
* **Hardware:** Recommended **24 GB RAM** minimum and a modern **CUDA-enabled GPU** (e.g., RTX 3090, A100).
* **Accounts:** A **Hugging Face Account** (you will need a Write-access token).

## ⚡ Quick Start

Execute the following commands in your terminal:

```bash
# 1. Download the script
git clone [YOUR_GITHUB_REPO_URL]
cd [YOUR_REPO_NAME]

# 2. Make the script executable
chmod +x setup_gensyn_node.sh

# 3. Run the installer
./setup_gensyn_node.sh
