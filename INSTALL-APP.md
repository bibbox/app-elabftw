## ElabFTW Installation Instructions 

### Some Command Line Work
The installation migth take a while so be patient. The last message in the log should be something like this:

`[services.d] done.`

Once installed we have to do some command line work to initilize elabftw and make it comaptible with HTTP instead of HTTPS. 
Log into our bibbox server (e.g. via ssh) and execute the following commands:

* Import the database structure:
  * `docker exec -it <instance_name>-web bin/install start`
* Disable secrue cookies (Incompatible with HTTP):
  * `docker exec -it <instance_name>-web sed -i 's/session.cookie_secure = true/session.cookie_secure = false/' ../etc/php8/php.ini`
* Set the app url in database (including the http://):
  * `docker exec -it <instance_name>-mysql mysql -u elabftw --database="elabftw" --password="<password>" --execute='UPDATE config SET conf_value = "http://<instance_url>:80" WHERE conf_name = "url";'`

### Restart ElabFTW

Restart the app via the restart button in the BIBBOX dashboard:

![Screenshot01](assets/install-screen-01.png)


### Start ElabFTW

You will get to the login sceen:

![Screenshot01](assets/install-screen-02.png)

#### Register

The first user you register will automatically be the admin user:

![Screenshot01](assets/install-screen-03.png)


#### Make all further configuration steps within the ELabFTW app.

Now you can login with your new admin account.
Further information can be found here https://www.elabftw.net/ and https://doc.elabftw.net/.

![Screenshot04](assets/install-screen-04.png)

## After the installation
Have a nice ride with the Admins youngtimer.

![FINAL](assets/install-screen-final.jpg)
