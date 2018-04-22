# craftcms-dev-env
This Craft CMS environment is extremely lightweight as it’s build on Alpine Linux. Since it’s build with ease of use in mind rather than security or scalability this Docker environment should only be used for development purposes.

**Please note that MySQL or PostgreSQL isn’t included.** I decided against it since setting up a separate MySQL/PostgreSQL container is really easy and leaves you more control while keeping this Docker image lightweight.

## How to start:
Launch the container with a mounted volume (link with local folder). An easy way to do this is by using Kitematic. If you already had an Craft installation in that folder you're ready to go.

If you selected an empty folder, Docker will automatically start downloading the latest craft cms version in that folder. When it's done you should run `/www/craft setup` in the container's bash to finish the installation. 

I wouldn’t recommend using Craft’s web installer since MySQL’s default timeout settings will most likely cause the installation fail if these settings haven’t been changed.
