# craftcms-dev-env
This Craft CMS environment is extremely lightweight as it’s build on Alpine Linux. Since it’s build with ease of use in mind rather than security or scalability this Docker environment should only be used for development purposes. This container contains MariaDB.

## How to start:
Launch the container with a mounted volume (link with local folder). An easy way to do this is by using Kitematic. If you already had an Craft installation in that folder you're ready to go.

If you selected an empty folder, Docker will automatically start downloading the latest craft cms version in that folder. When it's done you should run `/www/craft setup` in the container's bash to finish the installation. 

You can also install Craft though the browser but you will have to enter the database credentials in your .env file first.

## Default local mysql credentials
| User          | Password      | Database  |
| ------------- |:-------------:| ---------:|
| `root`        | *none*        | `craftcms`|
