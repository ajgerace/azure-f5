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

6. Create the group_vars/all/vault.yml file

   6.1. Copy the azure variables created in step 5


| Variable             | Value |
| --------------------:|------:|  
| azure_client_id      | abcd_xxxxx |
| azure_secret         | abcd_xxxxx      |
| azure_subscription_id| abcd_xxxxx      |
| azure_tenant_id      | abcd_xxxxx      |
| azure_user           | studentID      |
| azure_user_pass      | VerySecurePassword

   6.2. Create the vault password file. This file will hold the vault password so that you will not have to input the password on the commandline or be prompted for the password when running the playbook.  

  ` echo "@g!l!+y2018" > .vault-pass.txt`

   6.3. Create the encrypt the vault.yml file

  ` ansible-vault create group_vars/all/vault.yml `

   6.4. Paste the copied variables and save your changes.

   6.5. View the encrypted vault.yml file
  ` less group_vars/all/vault.yml `

  ` ansible-vault view group_vars/all/vault.yml `



## Lab Outline
* Demonstrate F5 typical deployments in Azure Cloud. Each  deployment will utilizing a single resource group and two Ubuntu application servers (Bodgeit or something similar).

    1. Single NIC configuration - Azure Portal

    2. 2 NIC deployment - Ansible playbook

       2.1. Run Ansible playbook with deploy_state=present to create deployment. A message is printed to the console with the  public IP addresses for BIG-IP management and the virtual server.

         `ansible-playbook -i notahost, f5agility.yml -e deploy_state=present `

       2.2. Access virtual server, did you get the home page?

       2.3. Run the ansible playbook with `deploy_state=absent` to destroy deployment

         `ansible-playbook f5agility.yml -e deploy_state=absent`


    3. Active/Passive 3 NIC deployment - Ansible playbook
       3.1. Edit group_vars/azure-f5.yml file to enable deployment of A/P BIG-IP cluster.

       3.1.1. Change the following variables


          | Variable             | Existing Value | New Value |
          | --------------------:|------:|-----:|
          | deployment | 2nic | ha |
          | extVipAddr1 | 10.0.10.246 | 10.0.10.10 |


       3.2. Re-run the Ansible playbook to create the new deployment. A message is displayed to console with the public IP addresses for the BIG-IP management interfaces as well as the virtual server.

           `ansible-playbook -i notahost, f5agility.yml -e deploy_state=present`  


       3.3. Run the ansible playbook with `deploy_state=absent` to destroy deployment

             `ansible-playbook f5agility.yml -e deploy_state=absent`


    4. Autoscale deployment - Ansible playbook
