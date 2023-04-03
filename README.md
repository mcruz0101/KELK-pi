# Kismet Pi Setup

This Ansible playbook automates the setup and configuration of Kismet on Raspberry Pi devices. It installs the necessary packages, configures the GPS and Kismet services, and sets up the Metagpsd service.

## Features

- Purges old Kismet packages and installs the latest version of Kismet
- Configures Kismet to capture wireless network data and logs
- Sets up a GPS device for geolocation data
- Automatically starts Kismet and GPS on boot

## Prerequisites

- A Raspberry Pi with a compatible wireless adapter
- Raspbian or another Debian-based OS installed
- Ansible installed on the control machine
- SSH access to the Raspberry Pi

## Usage

1. Clone this repository to your control machine:

```bash
git clone https://github.com/cwilliams001/krpi_setup.git
cd kismet-pi-setup
```
2. Update the hosts.ini file with the details of your Raspberry Pi devices, such as the SSH IP addresses, sensor names, and Kismet and Metagps connection details.

3. Run the Ansible playbook:
    
    ```bash
    ansible-playbook -i inventory.ini krpi_setup.yml -u kpi
    ```
4. The playbook will install and configure Kismet, GPS, and Metagpsd services on the Raspberry Pi devices. After the playbook is completed, the devices will be rebooted.

