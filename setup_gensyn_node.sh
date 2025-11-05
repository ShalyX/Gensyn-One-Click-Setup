#!/bin/bash

# --- Configuration ---
REPO_URL="https://github.com/gensyn-ai/rl-swarm.git"  # Official Gensyn repo (confirm this URL is correct before final deployment)
REPO_DIR="rl-swarm"
SCREEN_NAME="gensyn"

# Function to display messages
log_info() {
    echo -e "\n\033[34m[INFO]\033[0m $1"
}

log_success() {
    echo -e "\n\033[32m[SUCCESS]\033[0m $1"
}

log_error() {
    echo -e "\n\033[31m[ERROR]\033[0m $1"
    exit 1 # Exit on critical errors
}

# --- 1. System Update and Dependency Installation ---
log_info "1/5: Updating system packages and installing core dependencies (Python, Git, Screen, Yarn, Node.js)..."

# Install core packages (requires sudo)
sudo apt update
sudo apt install -y python3 python3-venv python3-pip curl screen git || log_error "Failed to install Python/core packages."

# Install Node.js and npm (required for localtunnel/Yarn)
# Check for NodeSource script download error
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash - || log_error "Failed to download NodeSource setup script."
sudo apt install -y nodejs || log_error "Failed to install Node.js."

# Install Yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo gpg --dearmor -o /usr/share/keyrings/yarn-keyring.gpg # Modern apt requires gpg dearmor
echo "deb [signed-by=/usr/share/keyrings/yarn-keyring.gpg] https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update
sudo apt install -y yarn || log_error "Failed to install Yarn."

log_success "Core dependencies installed successfully."


# --- 2. Clone Repository and Navigate ---
if [ -d "$REPO_DIR" ]; then
    log_info "Repository directory '$REPO_DIR' already exists. Deleting and re-cloning to ensure latest version..."
    rm -rf "$REPO_DIR"
fi

log_info "2/5: Cloning the Gensyn RL Swarm repository from $REPO_URL..."
git clone "$REPO_URL" || log_error "Failed to clone repository. Check URL and network connection."cd "$REPO_DIR" || log_error "Failed to enter cloned directory."
log_success "Repository cloned and entered."


# --- 3. Setup and Activate Virtual Environment ---
log_info "3/5: Setting up Python virtual environment (.venv)..."
python3 -m venv .venv || log_error "Failed to create virtual environment."
source .venv/bin/activate

log_info "Installing Python and Node/Yarn dependencies..."
# We'll try a common path used in this repository's structure
pip install -r web/requirements.txt || log_error "Failed to install Python requirements."
yarn install || log_error "Failed to install Yarn requirements."
log_success "Virtual environment and dependencies fully installed."


# --- 4. Start Node in Screen Session ---
log_info "4/5: Starting Gensyn node in background screen session (name: $SCREEN_NAME)..."

# Ensure any existing session is killed for a clean start
screen -S "$SCREEN_NAME" -X quit > /dev/null 2>&1

# Start the node and detach
# The 'exec bash' keeps the screen session alive after the script finishes
screen -dmS "$SCREEN_NAME" bash -c "source .venv/bin/activate; ./run_rl_swarm.sh; exec bash"

log_success "Node started successfully in a detached screen session. You can re-attach using 'screen -r $SCREEN_NAME'."


# --- 5. Authentication Instructions (The Final Step) ---
log_info "5/5: Node is running. FINAL STEP: Authentication/Login"
echo "----------------------------------------------------------------------"
echo -e "\n\033[33mACTION REQUIRED: Open a new, separate terminal tab NOW to set up the public login URL.\033[0m"
echo -e "\033[33m1. Install localtunnel globally:\033[0m"
echo -e "\033[33m   sudo npm install -g localtunnel\033[0m"
echo -e "\n\033[33m2. Get your public URL (Node runs on port 3000):\033[0m"
echo -e "\033[33m   lt --port 3000\033[0m"
echo "----------------------------------------------------------------------"
echo -e "\nVisit the URL provided by 'lt --port 3000' in your browser to complete login."

log_success "Setup complete! Now go log in!"
echo ""
