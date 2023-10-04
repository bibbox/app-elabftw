# elabftw BIBBOX application

This container can be installed as [BIBBOX APP](https://bibbox.readthedocs.io/en/latest/ "BIBBOX App Store") or standalone. 

After the docker installation follow these [instructions](INSTALL-APP.md).

## Hints

•	Approx. time with medium fast internet connection: 10 minutes
•	This is a modification of the offical ELabFTW (https://www.elabftw.net/) applictaion. It uses HTTP instead of HTTPs. Please keep this in mind when using this App.
•	Admin User: set after installations
•	MySQL password set during installations



## Standalone Installation 

Clone the github repository. If necessary change the ports in the environment file `.env` and the volume mounts in `docker-compose.yml`.

```
git clone https://github.com/bibbox/app-elabftw
cd app-elabftw
mkdir -p data/mysql
mkdir -p data/web
docker network create bibbox-default-network
docker-compose up -d
```

The main App can be opened and set up at:
```
http://localhost:8443
```

## Install within BIBBOX

Visit the BIBBOX page and find the App by its name in the store. Click on the symbol and select install. Then fill the parameters below and name your App, click install again.

## Docker Images used
  - [elabftw/elabimg](https://hub.docker.com/r/elabftw/elabimg) 
  - [mysql](https://hub.docker.com/r/mysql) 


 
## Install Environment Variables
  - DB_PASSWORD = MySQL Password, please change for production

  
The default values for the standalone installation are:
  - DB_PASSWORD = password

  
## Mounted Volumes
### elabftw/elabimg Container
  - *./data/web:/elabftw/uploads*
  - *./data/login.php:/elabftw/web/login.php*
  - *./data/init.inc.php:/elabftw/web/app/init.inc.php*
### mysql Container
  - *./data/mysql:/var/lib/mysql*

