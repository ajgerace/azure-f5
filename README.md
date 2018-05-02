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

   6.1. Paste the azure variables created in step 5 in and save the file


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

   6.3. Encrypt the vault.yml file

  ` ansible-vault encrypt group_vars/all/vault.yml `

  6.4. View the encrypted vault.yml file
  ` less group_vars/all/vault.yml `

  ` ansible-vault view group_vars/all/vault.yml `



## Lab Outline
* Demonstrate F5 typical deployments in Azure Cloud. Each  deployment will utilizing a single resource group and two Ubuntu application servers (Bodgeit or something similar).

    1. Single NIC configuration - Azure Portal

    2. 2 NIC deployment - Ansible playbook
       2.1. Run Ansible playbook with deploy_state=present to create deployment

         `ansible-playbook f5agility.yml -e deploy_state=present `

       2.1.1. Access virtual server, did you get the home page?

       2.2. Run the ansible playbook with deploy_state=absent to destroy deployment

         `ansible-playbook f5agility.yml -e deploy_state=absent`


    3. Active/Passive 3 NIC deployment - Ansible playbook

    4. Autoscale deployment - Ansible playbook


For each deployment the student will stand-up the BIG-IP devices and create application delivery configurations to verify the BIG-IP deployment.  (We can have them create virtual servers, add WAF policy, utilize Service discovery iApp).


Once the student completes a given lab they will delete the resource group and proceed to the next lab.
