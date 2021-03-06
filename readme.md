# Laravel Docker Scaffold

### **Description**

This will create a dockerized stack for a Laravel/Lumen application, consisted of the following containers:
-  **app**, your PHP application container

        Nginx, PHP7.4 PHP7.4-fpm, Composer, NPM, Node.js v10.x
    
-  **mysql**, MySQL database container ([mysql](https://hub.docker.com/_/mysql/) official Docker image)

### **Setup instructions**

**Prerequisites:** 

* Depending on your OS, the appropriate version of Docker Community Edition has to be installed on your machine.  ([Download Docker Community Edition](https://hub.docker.com/search/?type=edition&offering=community))

**Installation Improved:**

1. Run this and skip to step 4.
```bash
cp .example.env .env
make install
```
1.1 Make .perms.sh executable
```bash
sudo chmod +x .perms.sh
```

**Installation steps:** 

1. Create a new directory in which your OS user has full read/write access and clone this repository inside.

2. Create two new textfiles named `db_root_password.txt` and `db_password.txt` and place your preferred database passwords inside:

    ```
    $ echo "myrootpass" > db_root_password.txt
    $ echo "myuserpass" > db_password.txt
    ```

3. Open a new terminal/CMD, navigate to this repository root (where `docker-compose.yml` exists) and execute the following command:

    ```
    $ docker-compose up -d
    ```

    This will download/build all the required images and start the stack containers. It usually takes a bit of time, so grab a cup of coffee.

4. After the whole stack is up, enter the app container and install the framework of your choice:

    **Laravel**

    ```
    $ docker exec -it app_$APP_NAME bash
    $ composer create-project --prefer-dist laravel/laravel .
    $ nano .env
    $ php artisan migrate --seed
    ```

5. That's it! Navigate to [http://localhost](http://localhost) to access the application.

**Default configuration values** 

The following values should be replaced in your Laravel `.env` file if you're willing to keep them as defaults:
    
```
DB_CONNECTION=mysql
DB_HOST=mysql
DB_PORT=3306
DB_DATABASE=db
DB_USERNAME=dbuser
DB_PASSWORD=pw
```
    
