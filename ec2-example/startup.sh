#!/bin/bash
touch objects_in_s3.txt
aws s3api list-objects --bucket 1s-test-images --query 'Contents[].Key' > objects_in_s3.txt
aws s3api get-objects --bucket 1s-test-images --key "wl42/dogs/set1/dog5.jpeg" dog5.jpeg
unzip dog5.zip
mv dog5.jpeg /var/www/html/

yum -y update
yum install -y httpd24 php56 mysql55-server php56-mysqlnd
service httpd start
chkconfig httpd on
groupadd www
usermod -a -G www ec2-user
chown -R root:www /var/www
chmod 2775 /var/www
echo "<?php phpinfo(); ?>" > /var/www/html/phpinfo.php

find /var/www -type d -exec chmod 2775 {} +
find /var/www -type f -exec chmod 0664 {} +