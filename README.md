# F5 Architectures in Microsoft Azure Cloud

## Pre-Prerequisites

Visit https://github.com/ajgerace/azure-f5 for the lab instructions

1. During the Hands-On part of the Azure Lab Event you will be assigned a username from the list below:

|Student Name |E-Mail/Service Principal |Application ID |Link to Jump host| 
|--------|:--------:|:-------:|:-------|
|f5student1 |f5student1@f5custlabs.onmicrosoft.com |F5 Azure Lab Day##F5 Azure Lab BP#2##ea97be85-800e-4e69-95b5-99574080fe30##1550856898462|https://access.ravellosystems.com/simple/#/PBi9Qkht0EcLxiTwzX0vDljgNAKuJEb2CYmkQbb4Eaxabevefv5IZWPFHGdm4fy4/apps/3125675729087|
|f5student10|f5student10@f5custlabs.onmicrosoft.com|F5 Azure Lab Day##F5 Azure Lab BP#2##85f4ef52-1232-4c83-ba89-30a2f564ac6e##1550856898493|https://access.ravellosystems.com/simple/#/FnUhqNNB6vQBgx8xbYeVfFi28xQsrHFMHRThbXnlxkPM0HiQSGbpcULj2p11KYLL/apps/3125675663531|
|f5student11|f5student11@f5custlabs.onmicrosoft.com|F5 Azure Lab Day##F5 Azure Lab BP#2##b9363913-7bbf-41ff-b333-3f4bce6ff91f##1550856898486|https://access.ravellosystems.com/simple/#/99xMKZMhw8H2h32imiOtpj0teGso7rrmP18Hf7mX5E8o2tZETyxjkUyXwZVLSYE2/apps/3125675729090|
|f5student12|f5student12@f5custlabs.onmicrosoft.com|F5 Azure Lab Day##F5 Azure Lab BP#2##c645e04f-9e07-4902-a31e-771b4a9b56a6##1550856898496|https://access.ravellosystems.com/simple/#/MUixc0zS3nsc20rF1bx4VQCkxil44i8iZThtaXiDQ8sVoFvbk9VmgTcWcm1rGoP9/apps/3125675663527|
|f5student13|f5student13@f5custlabs.onmicrosoft.com|F5 Azure Lab Day##F5 Azure Lab BP#2##f9037051-efd0-47b9-8b05-175765e72b52##1550856898448|https://access.ravellosystems.com/simple/#/Mv6UMDSzKjvdZEiVE0Nf1unIYdgPQIKqIKu3z9YUCsNzc1oGNR5O2TnrGQkRiZlr/apps/3125675663518|
|f5student14|f5student14@f5custlabs.onmicrosoft.com|F5 Azure Lab Day##F5 Azure Lab BP#2##2ead4019-336a-4c5f-ad89-6834b42117f8##1550856898498|https://access.ravellosystems.com/simple/#/qz7TCSMo1cbdtddr9mEfxR47sjtIxLWPPLl17E4vU6yhEI68z2YRjd7aj4c9ED4l/apps/3125675663535|
|f5student15|f5student15@f5custlabs.onmicrosoft.com|F5 Azure Lab Day##F5 Azure Lab BP#2##4561429e-d3f3-411a-908d-8d4ab2d2f8e0##1550856898497|https://access.ravellosystems.com/simple/#/TtYD8RJJ1AzKTMzjZXG9rlXYM6bxT6DQI1EEY4Wd3QIJGaJhZadaPGRjhwxxgJwY/apps/3125675729086|
|f5student16|f5student16@f5custlabs.onmicrosoft.com|F5 Azure Lab Day##F5 Azure Lab BP#2##7bcaa932-22ea-498b-b197-1760b8dad401##1550856898492|https://access.ravellosystems.com/simple/#/z5FqriFl0808pxHWrnxEaRqppxBoRnSbrwAATACN0eASRfQDMInDOoizAOeSbiUt/apps/3125675729094|
|f5student17|f5student17@f5custlabs.onmicrosoft.com|F5 Azure Lab Day##F5 Azure Lab BP#2##f53a47a5-9fff-42c2-bceb-04945038009b##1550856898487|https://access.ravellosystems.com/simple/#/YLww8uEaGL4sm9bV7WQVq5Be6IOXwbTNmhbQhWhcvy6YL92NXKm3UaGdrxOIvdTy/apps/3125675729081|
|f5student18|f5student18@f5custlabs.onmicrosoft.com|F5 Azure Lab Day##F5 Azure Lab BP#2##b17740fe-4090-4148-9cc0-8999b45e0e43##1550856898496|https://access.ravellosystems.com/simple/#/2Zdp9ePrfgNYaWDG8QN08zwVjKq8VgB5npwKS7UW9Xzq9HkvKOLe36UqSqx4alHD/apps/3125675729098|
|f5student19|f5student19@f5custlabs.onmicrosoft.com|F5 Azure Lab Day##F5 Azure Lab BP#2##93661254-f24d-49b3-aefd-55a611a9bcfa##1550856898456|https://access.ravellosystems.com/simple/#/eUH3os8N5TIC34pJCghvvgg8NVfr9LUMDYIxODK7moioru8PTplTZ5AsvUQ0U9UH/apps/3125675663521|
|f5student2 |f5student2@f5custlabs.onmicrosoft.com |F5 Azure Lab Day##F5 Azure Lab BP#2##8a1d2ab9-94fc-4bc3-81b1-6618f6af26c2##1550856898435|https://access.ravellosystems.com/simple/#/bQmVheJg7v2hpvlMfN9CcjThqjgS5bcwWVV1RxwISkLAtsz0CAGZAVhSoa4jK122/apps/3125675663516|
|f5student20|f5student20@f5custlabs.onmicrosoft.com|F5 Azure Lab Day##F5 Azure Lab BP#2##4f2f84d2-2efc-4e95-a043-ed076a736c01##1550856898481|https://access.ravellosystems.com/simple/#/VrbRcg3JTnr0PplMppoB0Fjc2ZEki7M0T7hTnoulv2A3j34DE36lGGDfpHFQKJI5/apps/3125675729088|
|f5student21|f5student21@f5custlabs.onmicrosoft.com|F5 Azure Lab Day##F5 Azure Lab BP#2##7fa9bb69-7361-4bb9-950a-597c8dc4c2d9##1550856898492|https://access.ravellosystems.com/simple/#/OSn3QDIIcJS8ngPYkzFbDmHxswYg1jHdGJGjaYLeKYahaDzjrTM04jQkDXkr9CBU/apps/3125675729092|
|f5student22|f5student22@f5custlabs.onmicrosoft.com|F5 Azure Lab Day##F5 Azure Lab BP#2##233955b9-f7d7-43a6-ab8e-9406cab33237##1550856898461|https://access.ravellosystems.com/simple/#/oFQ7p4O9nmg1ghwldhpvpXNqpUIsfRvEk4p5TrTjH53IlehoM4vEWrjlyR9WeFTS/apps/3125675729083|
|f5student23|f5student23@f5custlabs.onmicrosoft.com|F5 Azure Lab Day##F5 Azure Lab BP#2##1e1a6980-a105-4c03-bcdd-94dcca097089##1550856898469|https://access.ravellosystems.com/simple/#/wt53KWBTuF4jaufJGyina0aRaoN1lbFy2gSbVhZTm7p6G99CdbiSclgaXj58ha7v/apps/3125675729095|
|f5student24|f5student24@f5custlabs.onmicrosoft.com|F5 Azure Lab Day##F5 Azure Lab BP#2##f86ea299-56a1-4c51-b239-bbb81b48e1ee##1550856898481|https://access.ravellosystems.com/simple/#/DQcXlYQCBwKGdjiDtT3CApMWOxSFKUjInDrKjCHyZZpTN6cAHNKrayf15wjQtc0d/apps/3125675729093|
|f5student25|f5student25@f5custlabs.onmicrosoft.com|F5 Azure Lab Day##F5 Azure Lab BP#2##0ace0b55-c1bc-45dc-a5a8-d0ba1fae25b6##1550856898479|https://access.ravellosystems.com/simple/#/kxA9wTzOYCHMJdHSJIjKZ7OGJMeo6VBKRyOqTfSFoTa0zaCyDOVysl9eKQ143d26/apps/3125675663530|
|f5student26|f5student26@f5custlabs.onmicrosoft.com|F5 Azure Lab Day##F5 Azure Lab BP#2##1f529440-8d34-4796-8a38-c1d6e2a24b10##1550856898459|https://access.ravellosystems.com/simple/#/YwhQEUM0Cv8fPRAk9nCPn0CkAGQTabTSeepe4KiTyljHeg6K8DyRO1d17A3Yuh3T/apps/3125675729096|
|f5student27|f5student27@f5custlabs.onmicrosoft.com|F5 Azure Lab Day##F5 Azure Lab BP#2##2877d341-ed04-4d78-9b14-1677d6040d60##1550856898443|https://access.ravellosystems.com/simple/#/6qGNF3MIXmfqw4SbwiJJ7OWGxEsYyXMFqTnJUQ5jEtHp958xAfrUytJRNbAhKGX9/apps/3125675663523|
|f5student28|f5student28@f5custlabs.onmicrosoft.com|F5 Azure Lab Day##F5 Azure Lab BP#2##6a66502e-ba86-4ad0-9650-0d06c52ffad6##1550856898481|https://access.ravellosystems.com/simple/#/qymuBUf0o4ts1n8vMUjdnPF0nCflCfhcyq96SWt5dfo571njutQb5zdCHDO28U0o/apps/3125675663526|
|f5student29|f5student29@f5custlabs.onmicrosoft.com|F5 Azure Lab Day##F5 Azure Lab BP#2##70a11193-8a87-4997-8cf8-8c24add1b430##1550856898480|https://access.ravellosystems.com/simple/#/4A8Dx0xqHdRaiNr7oCXCkcPAaQfTtHZxASdbDWpbkjgTvauuqURgPEpoZm7eQO48/apps/3125675729097|
|f5student3 |f5student3@f5custlabs.onmicrosoft.com |F5 Azure Lab Day##F5 Azure Lab BP#2##7fbcfa52-d4c8-45cf-9e40-142f31c3f9b1##1550856898428|https://access.ravellosystems.com/simple/#/0W3DOcP6mWzV5vAUVzmtk15CIMQLBGAZ8pqImJp1CyFqb0Q95bcTn2JiGFIk1WCQ/apps/3125675729085|
|f5student30|f5student30@f5custlabs.onmicrosoft.com|F5 Azure Lab Day##F5 Azure Lab BP#2##8e290023-c0a9-41d8-b635-843600afd193##1550856898461|https://access.ravellosystems.com/simple/#/r1XIr84ZC2B9FZAXKq0OHOEW8BatfBP4Z8LZ76eGUrtAR94bZR2Dgki71JUdw4jC/apps/3125675663520|
|f5student31|f5student31@f5custlabs.onmicrosoft.com|F5 Azure Lab Day##F5 Azure Lab BP#2##7407d318-b05f-438e-9e14-c332a09f013a##1550856898468|https://access.ravellosystems.com/simple/#/a3Sxxg2LrHzA2ovr6FsrF6195LrRv6O6t4EQtUiu2aSSmXrQ1Rkr4ZYTIQqy7As2/apps/3125675663519|
|f5student32|f5student32@f5custlabs.onmicrosoft.com|F5 Azure Lab Day##F5 Azure Lab BP#2##27f5156c-ec8e-4576-af28-548e246a7df2##1550856898501|https://access.ravellosystems.com/simple/#/x95pYrVFvz7XwwaWMMiflXQste7CmWFyLn8XmDejJySMp9TDZ5UUpljkDZrG7cXf/apps/3125675729091|
|f5student33|f5student33@f5custlabs.onmicrosoft.com|F5 Azure Lab Day##F5 Azure Lab BP#2##bd4b695d-4d24-4ff3-82a1-2cb429d160a1##1550856898480|https://access.ravellosystems.com/simple/#/QXok7q1idvkV5hCnjhb48FfSu9I5Tja4yA6ItHLXblE2Cscr7SkGbc2ODrziKZ15/apps/3125675663517|
|f5student34|f5student34@f5custlabs.onmicrosoft.com|F5 Azure Lab Day##F5 Azure Lab BP#2##13d801da-1d22-4f95-bf56-670482f87008##1550856898480|https://access.ravellosystems.com/simple/#/Yh0gEzYf2t8Y3j8PKdob93LXZeNjJ8S5Wvt5rYjTUFb4RdHccUgLs0Cg2x9jDjfZ/apps/3125675663528|
|f5student35|f5student35@f5custlabs.onmicrosoft.com|F5 Azure Lab Day##F5 Azure Lab BP#2##b0135327-8f2f-41de-a82c-7330ddaa7780##1550856898474|https://access.ravellosystems.com/simple/#/dXnL39kWdiqabTZU30Hpj70RNagebIMPRtwpWoVL4oIsWLlwlBXC5fKgvKjXwevn/apps/3125675663524|
|f5student36|f5student36@f5custlabs.onmicrosoft.com|F5 Azure Lab Day##F5 Azure Lab BP#2##3083a27b-4ea5-42bf-a29f-c9c3925f43f0##1550856898439|https://access.ravellosystems.com/simple/#/n8h6qD0KHMR5TyvJzOqs9NECoaqrvTRPSGP3UOpZ7anEdad8YMmXD8obFqdLgLLu/apps/3125675729082|
|f5student37|f5student37@f5custlabs.onmicrosoft.com|F5 Azure Lab Day##F5 Azure Lab BP#2##3ede0cfa-839c-4d1a-b8cc-ab6a04fa3eae##1550856898489|https://access.ravellosystems.com/simple/#/MRDoPXTKXfNTUd6qJDEO104L60OJrqZh5e0irtqNlCpykFBfzI6csRQsy6v9GkPs/apps/3125675663525|
|f5student38|f5student38@f5custlabs.onmicrosoft.com|F5 Azure Lab Day##F5 Azure Lab BP#2##0ed63cf6-518d-4a97-be6b-8e8052a4b0fe##1550856898493|https://access.ravellosystems.com/simple/#/XC8r3m9dXLrYHCO87ILUf4Otb6goBcfWH4TwTxdmQtaP9ZJmOWfT70CLpzcWXyAs/apps/3125675663534|
|f5student39|f5student39@f5custlabs.onmicrosoft.com|F5 Azure Lab Day##F5 Azure Lab BP#2##a26db530-7567-43a5-aa00-75af60560e10##1550856898479|https://access.ravellosystems.com/simple/#/SK8On7lftFU7sHNnht1aNqfEuDGXGpxkZDi87DG5G8VQQphmsf5xThHI5kggDGyt/apps/3125675729089|
|f5student4 |f5student4@f5custlabs.onmicrosoft.com |F5 Azure Lab Day##F5 Azure Lab BP#2##836f18b6-1195-478f-9731-54f118d67097##1550856898419|https://access.ravellosystems.com/simple/#/OtgMx2XwzsOlC4tFaN3JASx1WmDRu72yXDzMjWmFXugDutpxTH3FnBPTdkvpQeni/apps/3125675663515|
|f5student40|f5student40@f5custlabs.onmicrosoft.com|F5 Azure Lab Day##F5 Azure Lab BP#2##bd63378c-07b8-4234-8a24-d7223522efc6##1550856898536|https://access.ravellosystems.com/simple/#/D7HEqYPDvBVPN43YLaxzKz5dehnSDqDShgWJB4GNJSwEJ8dvY1Vln4JLthMBJdWO/apps/3125675663536|
|f5student5 |f5student5@f5custlabs.onmicrosoft.com |F5 Azure Lab Day##F5 Azure Lab BP#2##37560efc-814e-44d5-a12d-1a619cfa98c7##1550856898447|https://access.ravellosystems.com/simple/#/b7TKtaEyn1r7acmJe9yoY8op6HUx4MIJh2okgNkkOUjHCMDJXh3tp2ClPtATzmSQ/apps/3125675729084|
|f5student6 |f5student6@f5custlabs.onmicrosoft.com |F5 Azure Lab Day##F5 Azure Lab BP#2##eb67cbea-35e4-4fa0-90ce-c650713237cc##1550856898488|https://access.ravellosystems.com/simple/#/B9J0FCrLhx8j1L1nndyowoiO0OohHfMf7CRE19onQ5rBb4KV02gyOYVaouHuUpyO/apps/3125675663532|
|f5student7 |f5student7@f5custlabs.onmicrosoft.com |F5 Azure Lab Day##F5 Azure Lab BP#2##f9bb15d0-3f3a-4fbd-a58c-91462551a0a5##1550856898447|https://access.ravellosystems.com/simple/#/89EIxmd9cLVUq8pjtsWXZyagePbyfsBO9y9OQ75q2KpUXhzx278GGHbqLvW4NCaE/apps/3125675663522|
|f5student8 |f5student8@f5custlabs.onmicrosoft.com |F5 Azure Lab Day##F5 Azure Lab BP#2##807689d4-db05-4e83-ad25-1bf1b07838a0##1550856898504|https://access.ravellosystems.com/simple/#/qXRkuoGKVyW9Y1ptbyRWqSK6SD38OJeA4aqBOa6YGVYNArU6xq6zNDUZvga5f6uL/apps/3125675663533|
|f5student9 |f5student9@f5custlabs.onmicrosoft.com |F5 Azure Lab Day##F5 Azure Lab BP#2##92a7ba4b-9f29-4c24-9ee4-0c748c2d8a0b##1550856898486|https://access.ravellosystems.com/simple/#/IHiaufhpicSerVOxgvT6RlHPMSrJO1kIJzznjnXW74DX7OQJtV5KTBdBR5uo1fXD/apps/3125675663529|

2. Once assigned, click on the link or copy it to your favorite browser
3. In the App Screen - Click on "Play" icon to start Jump Host
4. Connect to your Jump Host via RDP, use provided username and password
5. Start "Terminal" and proceed to the next section

## Prerequisites

1. Run Docker container

  `docker run -it --rm ajgerace/f5automation`

3. Clone this github repository into container

  `git clone https://github.com/ajgerace/azure-f5`
  `cd azure-f5`

4. Create environment variables utilizing the student ID and password provided by the instructor

  ` export AZURE_USERNAME=f5studentX@domain.onmicrosoft.com `

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
