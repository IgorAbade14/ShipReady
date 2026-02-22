# 🚢 SerraStack v1.0

SerraStack is a high-performance deployment pipeline for local environments. It automates the lifecycle of Docker containers, ensuring that your web application is built, cleaned, and validated with a single command.

## 🚀 Features
* **Automated Build & Deploy:** One-click script to transform source code into a running Nginx container.
* **Smart Cleanup:** Automatically detects and removes conflicting containers to ensure a clean state.
* **Integrated Healthcheck:** Uses `curl` to verify the application's health (HTTP 200 OK) before finishing.
* **Visual Telemetry:** ANSI color-coded terminal output for instant status recognition.
* **Error Resilience:** Implements `set -e` logic to halt execution if any critical step fails.

## 📂 Project Structure
* `scripts/serrastack.sh`: The main script containing the automation and healthcheck logic.
* `config/Dockerfile`: The blueprint using an optimized Nginx-Alpine configuration.
* `app/`: Directory where the source code (HTML/CSS/JS) is stored.

## 🛠️ Requirements
* **OS:** Linux Mint / Ubuntu / Debian.
* **Dependencies:** `Docker Engine`, `bash`, `curl`.

## 📖 How to Use
1. Clone this repository:
   ```bash
   git clone [[https://github.com/IgorAbade14/SerraStack.git](https://github.com/IgorAbade14/SerraStack.git)]```

2. Give execution permission to the script with Bash:

* username/home: ~/SerraStack$
* username/home: ~/SerraStack$ chmod +x scripts/.serrastack.sh 

And run the script!

* username/home: ~/SerraStack$ ./scripts/serrastack.sh

## 🧠 Learning Journey
* This project was developed as part of my DevOps learning path. It covers:
* Infrastructure as Code (IaC) using Dockerfile.
* Shell Scripting Mastery (Exit codes, variables, and signaling).
* Idempotency in automation scripts.
* Automated Service Validation (Healthchecks).

## 👨‍💻  Developed by
 `[https://github.com/IgorAbade14]`