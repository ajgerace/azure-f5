Azure Lab Day - Setup Instructions

1. Ravello - Jump Host Setup
  - using F5 ID credentials create training class in Ravello
  - you can use this blue print: "F5 Azure Lab BP#3-IL"
  - Add Students via csv spreadsheet and export Application list
  - Ravello (Jumphost) Application List has to be converted to MD format published to students.
  this web page gives good results: http://convertcsv.com/csv-to-markdown.htm
    * We publish applications list on the front page of this repository (README.md)


2. Azure Subscription Preparation
  * Obtain administrative credentials for Azure subscription, that can be either admin@domain or F5 ID with specific credentials to create users and/or assign roles

  * Next step performed on your management machine (can be a jumphost from step 1 or any flavor of Mac/Linux)
  * Run:

    `git clone https://github.com/ajgerace/azure-f5`  
    `cd azure-f5/labsetup`

  * Create desired number of users for Azure lab:

    `./userCreate_SP.sh X SecurePassword Prefix`
     1. Where "*X*" is number of Users
     2. *SecurePassword* is password for user accounts that meets Azure complexity requirements
     3. *Prefix* is username prefix for example "*f5student*" - sequential user number will automatically be attached to username

     * This script will generate:
      - UserID's for lab
      - Service Principle Names to execute lab
      - Collect all needed subscription information and create vault.yml file in the local directory

  * "vault.yml" file needs to be uploaded to shared dropbox folder and then later shared with students
  * when sharing dropbox link with students ensure the links is suitable for download 
