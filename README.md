# F5 Architectures in Microsoft Azure Cloud

## Prerequesites
    1. Build Ansible/Azure Docker container
      **  docker build -t agility2018 . **
    2. Run the built container
       ** docker run --rm -it agility2018 **
    2.1 You can utilize a -v option if you'd like to pass a local subdirectory into the container. Example:
       ** docker run --rm -it -v /user/someuser/subdir:/home/ansible/subdir **
    3. Clone the github repository
       ** git clone https://github.com/ajgerace/azure-f5 **
    4. Setup Ansible Vault variable file (utilizes vi command)
       ** ansible-vault edit group_vars/all/vault.sample.yaml **
    4.1. Edit each of the entries
    | Variable | Value |
    --------------------
    | azure_client_id| | 
    | azure_secret| | 
    | azure_subscription_id| |
    | azure_tenant_id| |
    | azure_user| |
    | azure_user_pass | |

    4.2. Save changes
    4.2.1. Write changes to group_vars/all/vault.yml
    4.3. Encrypt variable file
         ** ansible-vault encrypt group_vars/all/vault.yml **
         You will be prompted for a passphrase
    5.  Run ansible playbook 
        **ansible-playbook f5agililty.yml -e deploy_state=present --tags="rg,2nic,app" ** 
        This example will create resource group, a standalone 2 NIC BIG-IP and create application servers.

## Lab Outline
* Demonstrate F5 typical deployments in Azure Cloud. Each  deployment will utlize a single resource group and two Ubuntu application servers (Bodgeit or something similar).

    1. Single NIC configuration - Azure Portal

    2. NIC deployment - Ansible playbook

    3. Active/Passive 3 NIC deployment - Ansible playbook

    4. Autoscale deployment - Ansible playbook


For each deployment the student will stand-up the BIG-IP devices and create application delivery configurations to verify the BIG-IP deployment.  (We can have them create virtual servers, add WAF policy, utilize Service discovery iApp).


Once the student completes a given lab they will delete the resource group and proceed to the next lab.

