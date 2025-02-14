# KUFRL Software-Stack Upgrade

This repository provides two methods for upgrading the KUFRL software stack on a Jetson Nano. The primary objective is to enable the Jetson Nano to communicate with other Jetson Nano devices via Mavlink messages.

## Installation Methods

We offer two installation methods:

1. **Direct Ubuntu 20.04 Installation (Recommended):**

   - Install Ubuntu 20.04 directly on the Jetson Nano.
   - Manually install ROS 2 and all required packages.
   - Suitable for deployment.

2. **Docker-based Installation:**

   - Uses Docker containers to create a virtualized Ubuntu 20.04 environment.
   - ROS 2 and required packages are installed inside the container.
   - Suitable for testing and development, especially when running both drone and GCS applications on the same machine.

---

## Method 1: Installing ROS 2 on Ubuntu 20.04 (Recommended)

1. Ensure your Jetson Nano has Ubuntu 20.04 installed.
2. Run the installation script:
   ```bash
   ./install-all-on-ubuntu-20.04.sh
   ```
   This script will:
   - Install ROS 2.
   - Install all required Python packages listed in `requirements.txt`.
   - Add any additional dependencies you specify.
3. After installation, a test ROS program will run to verify the setup. This is a simple "Hello World" ROS node and can be terminated once verification is complete.

---

## Method 2: Installing ROS 2 using Docker

### Step 1: Install Docker

Run the following script to install Docker:

```bash
./install-docker.sh
```

After installation, test your setup:

```bash
./test-docker-installation.sh
```

### Step 2: Build and Run ROS Docker Container

1. Navigate to the directory containing the `Dockerfile`.
2. Build the Docker image:
   ```bash
   docker build -t ros-foxy .
   ```
3. Run the container:
   ```bash
   docker run --rm -it ros-foxy
   ```

This will create an isolated ROS 2 environment within Docker, useful for testing and development.

---

## Mavlink Communication Between Jetson Nano Devices

This setup enables Jetson Nano devices to communicate via Mavlink messages. Mavlink is a lightweight messaging protocol designed for communication between UAV components. The following steps outline how to enable Mavlink communication:

### Step 1: Install Mavlink

Ensure Mavlink is installed using the following command:

```bash
pip install pymavlink
```

### Step 2: Configure Mavlink Communication

1. Identify the network interface and IP addresses of the Jetson Nano devices.
2. Configure Mavlink on each device to send and receive messages over a UDP or serial connection.
3. Run the Mavlink communication script provided in the repository:
   ```bash
   python mavlink_communication.py
   ```

This script facilitates message exchange between Jetson Nano devices, allowing for distributed computing and coordination in drone applications.

---

## Troubleshooting

### Docker Issues

- Ensure Docker is installed correctly by running:
  ```bash
  docker --version
  ```
- If encountering permission issues, run:
  ```bash
  sudo usermod -aG docker $USER
  ```
  Then restart your system.

### Mavlink Issues

- Verify that `pymavlink` is installed:
  ```bash
  python -m pip show pymavlink
  ```
- Ensure network connectivity between devices.
- Check firewall settings to allow UDP traffic.

---

## Contribution

Feel free to submit issues or pull requests if you encounter bugs or have improvements. Contributions are welcome!

