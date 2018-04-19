#!/bin/sh

# Create a databank for craftcms
if ! grep -qs '/dev/sda1 /www' /proc/mounts; then
  # Volume is mounted.
  if ! [ "$(ls -A /www)" ]; then
    echo "Downloading latest craft cms version..."
    composer create-project craftcms/craft /www && chown -R www:www /www
    echo "Craft CMS is ready for installation!"
    echo "I recommend that you install craft through the command line rather than through the web, the installation on the web may fail after a minute because of mysql's default timeout settings (depending on your mysql setup)."
  fi

  # Start nginx
  ./usr/sbin/nginx
  status=$?
  if [ $status -ne 0 ]; then
    echo "Failed to start nginx: $status"
    exit $status
  fi

  # Start php7-fpm
  ./usr/sbin/php-fpm7
  status=$?
  if [ $status -ne 0 ]; then
    echo "Failed to start php7-fpm: $status"
    exit $status
  fi

else
  # Volume isn't mounted.
  echo "Mount the volume /www to get started! If you mount this volume to an empty folder the latest Craft CMS version will be downloaded there automatically."
fi

# Keeping script running
while true
do
    sleep 60
done