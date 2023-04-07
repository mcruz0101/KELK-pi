# Kismet Pi Setup

This Ansible project is designed to automate the setup and configuration of Kismet on Raspberry Pi devices, including the installation and configuration of required packages, the creation of necessary scripts, and the configuration of GPS for cell hat and external puck Pis. Additionally, it includes tasks to archive Kismet data, fetch it, and delete the data folder contents after fetching.

## Playbook Overview

1. Purge old Kismet packages
2. Update and upgrade packages
3. Install required packages
4. Import Kismet GPG key
5. Add Kismet repository
6. Update apt cache and install Kismet
7. Clone python-kismet-metagpsd repository
8. Install requirements from python-kismet-metagpsd
9. Create enable_gps.py script
10. Create multi-source.sh script
11. Add enable_gps.py script to crontab
12. Configure gpsd for cell_hat Pis
13. Configure gpsd for external puck
14. Add Kismet capture scripts to crontab
15. Modify kismet.conf
16. Create kismet directory and set permissions
17. Modify kismet_logging.conf
18. Update log_types in kismet_logging.conf
19. Create, enable, and start metagpsd service
20. Reboot Raspberry Pi devices
21. Check cgps output for latitude and longitude
22. Archive Kismet data and fetch it

## Inventory

```
[cell_hat_pis]
krpi02 ansible_host=192.168.191.233 sensor_name=Node-02
krpi05 ansible_host=192.168.191.102 sensor_name=Node-05

[external_puck_pis]
krpi01 ansible_host=192.168.191.96 sensor_name=Node-01
krpi03 ansible_host=192.168.191.27 sensor_name=Node-03
krpi04 ansible_host=192.168.191.104 sensor_name=Node-04

[krpi_hosts:children]
cell_hat_pis
external_puck_pis

[krpi_hosts:vars]
kismet_connect=192.168.191.218:3501
metagps_connect=192.168.191.218:2501
api_key=KISMET_API_KEY
kismet_data_path=/home/pi/kismet_data
```

## Usage

1. Update the Ansible inventory file with the correct IP addresses and sensor names for your Raspberry Pi devices.
2. Ensure your Ansible control node has SSH access to the Raspberry Pi devices.
3. Run the Ansible playbook:
   
   ```
   ansible-playbook krpi_setup.yml
   ```

## Notes

- The inventory file contains the following variables: \`kismet_connect\`, \`metagps_connect\`, \`api_key\`, and \`kismet_data_path\`. Update these as needed for your environment.
- The inventory file includes two groups of Pis: \`cell_hat_pis\` and \`external_puck_pis\`. Update these groups based on your specific hardware setup.
