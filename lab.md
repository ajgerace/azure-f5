## F5 Architectures in Azure 

Setup 3 typical F5 deployment configurations with-in the Azure cloud.
We will utilize two application servers throughout this lab.


### Lab Topology

** Insert Lab diagram here **


#### Agenda

  * Getting Started
    * Setup Ansible Vault variable file (utilizes vi command)
       ` ansible-vault edit group_vars/all/vault.sample.yaml `

    * Edit each of the entries below:
    	Variable | Value 
    	-------- | ----- 
     	azure\_client\_id |  
     	azure\_secret |   
     	azure\_subscription\_id | 
    	azure\_tenant\_id | 
    	azure\_user | 
    	azure\_user\_pass | 



  	* Save your changes to group_vars/all/vault.yml

  * Connecting to the lab environment

  * Module 1 -  Configuring the initial lab environment

  * Module 2 -  Deploying a standalone BIG-IP via ARM (Azure Resource Manager) template using Azure Portal

  * Module 3 -  Deploying a standalone BIG-IP via Ansible using ARM template 

  * Module 4 -  Deploying a H/A Cluster BIG-IP via Ansible using ARM template

  * Module 5 -  Deploying a Autoscale WAF BIG-IP via Ansible using ARM template 

