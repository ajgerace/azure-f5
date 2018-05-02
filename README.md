# F5 Architectures in Microsoft Azure Cloud

## Prerequisites
1. Build Docker container
   `docker build -t agility2018 . `
2. Run the container
  `docker run -it --rm agility2018 `
3. Clone the github repository 
  `git clone https://github.com/ajgerace/azure-f5`
4. Create environment variables utilizing the student ID and password provided by the instructor
  ` export AZURE_USERNAME=studentX@domain.onmicrosoft.com `
  ` export AZURE_PW=XXXXX ` 
5. Run bash script to create the Azure Service Principal and Secret
  ` ./spCreate.sh `
6. Edit the group_vars/all/vault.yml file 

 6.1. Paste the azure variables created in step 5 in and save the file

 6.2. Encrypt the vault.yml file
  ` ansible-vault encrypt group_vars/all/vault.yml ` 


## Lab Outline
* Demonstrate F5 typical deployments in Azure Cloud. Each  deployment will utlize a single resource group and two Ubuntu application servers (Bodgeit or something similar).

    1. Single NIC configuration - Azure Portal

    2. NIC deployment - Ansible playbook

    3. Active/Passive 3 NIC deployment - Ansible playbook

    4. Autoscale deployment - Ansible playbook


For each deployment the student will stand-up the BIG-IP devices and create application delivery configurations to verify the BIG-IP deployment.  (We can have them create virtual servers, add WAF policy, utilize Service discovery iApp).


Once the student completes a given lab they will delete the resource group and proceed to the next lab.

