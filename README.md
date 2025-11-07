<img width="1910" height="947" alt="image" src="https://github.com/user-attachments/assets/466b2a15-6f14-4c2c-a58f-e27ce7a48ecc" />




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
  - Create account in [HuggingFace](https://huggingface.co/)
  - Create an Access Token with Write permissions here and save it

---

## ⚡ Quick Start

* Execute the following commands in your terminal:

```bash
# 1. Download the script
git clone https://github.com/ShalyX/Gensyn-One-Click-Setup
cd Gensyn-One-Click-Setup

# 2. Make the script executable
chmod +x setup_gensyn_node.sh

# 3. Run the installer
./setup_gensyn_node.sh
```

(The script will take several minutes to complete the full setup.)


---


## 🟢 Running & Authentication
* Follow Prompts: After setup, the script will prompt you to resume the tunnel screen. 

* Use this command to get the password of this website
```bash
curl https://loca.lt/mytunnelpassword
```

* Do this in a new terminal window to get your public website URL.
```bash
screen -r lt_tunnel
```



* Authenticate: Visit the public URL in your browser and complete the Gensyn login.
* Sign In using email address and then paste OTP

<img width="768" height="344" alt="image" src="https://github.com/user-attachments/assets/c8b60f08-915e-41a9-8eff-d8cb53e8ac8b" />

  
* Check Status: Return to your original terminal. Once authenticated, your node will begin processing tasks in the background.
* To re-attach to your node's logs, use:
```bash
screen -r gensyn
```

---

* Respond to questions asked appropriately
* `Would you like to push models you train in the RL swarm to the Hugging Face Hub? [y/N]` : Write Y and enter your access-token to join testnet OR press N to join without pushing models
* `Enter the name of the model you want to use in huggingface repo/name format, or press [Enter] to use the default model`: For default model, press Enter or choose one of these:
  - Gensyn/Qwen2.5-0.5B-Instruct
  - Qwen/Qwen3-0.6B
  - nvidia/AceInstruct-1.5B
  - dnotitia/Smoothie-Qwen3-1.7B
  - Gensyn/Qwen2.5-1.5B-Instruct
* `Would you like to participate in the AI Prediction Market? (Y/n)`
You would join the prediction market by pressing ENTER or answering Y 


---

* Press Ctrl + A then D to detach safely.
* To resume `screen`
```bash
screen -r gensyn
```
---

## Node Status

Once logged in, your node will begin training automatically.

You can verify that your peer has successfully connected by visiting the [Gensyn Testnet Dashboard](https://dashboard.gensyn.ai). Your peer should appear in the active swarm list, and you can monitor training progress in real time.

<img width="1398" height="973" alt="image" src="https://github.com/user-attachments/assets/3a20072a-9bea-4db4-961f-026309dc72e1" />

