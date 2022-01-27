# ElabFTW BIBBOX application

This container can be installed as [BIBBOX APP](https://bibbox.readthedocs.io/en/latest/ "BIBBOX") or standalone.
 
After the installation follow these [instructions](INSTALL-APP.md)

## Hints
* approx. time with medium fast internet connection: **10 minutes**
* This is a modification of the offical ELabFTW (https://www.elabftw.net/) applictaion. It uses **HTTP** instead of ~~HTTPS~~. Please keep this in mind when using this app.
* Admin User: **set after instalations**
* MySQL password **set during installations**


## Install within BIBBOX

Within BIBBOX you can use the [BIBBOX](https://bibbox.readthedocs.io/en/latest/ "BIBBOX") to install a lot of software tools. After the installation you will find your application in the dashboard. You need to make some configuration before you can use the application **please follow these [instructions](INSTALL-APP.md)**.

### Install Environment Variables

 * DB_PASSWORD = MySQL password
 
The default values for the standalone installation are:

 * DB_PASSWORD = password

## Docker Images Used
 * [elabftw/elabimg:4.2.4](https://hub.docker.com/r/elabftw/elabimg), offical elabftw container 
 * [mysql:8.0](https://hub.docker.com/_/mysql), offical mysql container
 
## Standalone Installation

To install the app locally execute the commands:
* Clone the git repository: 
  * `https://github.com/bibbox/app-elabftw.git`
* Change the current directory to app-molgenis: 
  * `cd app-elabftw/` 
* Create the directories `data/mysql`, `data/web`:
  * `mkdir -p data/mysql` 
  * `mkdir -p data/web`
* Create the docker network `bibbox-default-network`: 
  * `docker network create bibbox-default-network`
* Run **docker-compose up** in the root folder of the project: 
  * `docker-compose up -d`
* **Alternatively** on a *Linux* system run the bash script `intsall.sh` after cloning and change the working directory to the git repository directory.
 

After the installation (might take a few minutes) you need to make some configuration follow these **[instructions](INSTALL-APP.md)**. Finally you can open **http://localhost:8080** in your browser to access ELabFTW.

## Mounted Volumes
* ./data/login.php
* ./data/init.inc.php
* ./data/web
* ./data/mysql
