#!/bin/bash
awstats="/var/www/apps/awstats"
awstats_data="/var/www/apps/application/shared/awstats_data"

cd /etc/nginx/logs/
mv access.log.9.tgz access.log.10.tgz
mv access.log.8.tgz access.log.9.tgz
mv access.log.7.tgz access.log.8.tgz
mv access.log.6.tgz access.log.7.tgz
mv access.log.5.tgz access.log.6.tgz
mv access.log.4.tgz access.log.5.tgz
mv access.log.3.tgz access.log.4.tgz
mv access.log.2.tgz access.log.3.tgz

tar -zcvf access.log.2.tgz access.log.1
mv access.log access.log.1
/etc/init.d/nginx stop
sleep 3
/etc/init.d/nginx start


$awstats/tools/awstats_buildstaticpages.pl -update -config=application -dir=$awstats_data -awstatsprog=$awstats/wwwroot/cgi-bin/awstats.pl
