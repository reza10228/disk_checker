#!/bin/bash
## Prepared by Sysadmin Reza Shoghi
Today=`date +%Y-%m-%d`
Day=`date +%Y-%m-%d\ %H:%M:%S`
#Time=`date +%H:%M:%S`
sizefree_root=`df -h / | awk '{ print $5 }' | sed -n '2 p' | cut -d % -f 1`
sizefree_var=`df -h /var | awk '{ print $5 }' | sed -n '2 p' | cut -d % -f 1`
sizefree_home=`df -h /home | awk '{ print $5 }' | sed -n '2 p' | cut -d % -f 1`
sizefree_tmp=`df -h /tmp | awk '{ print $5 }' | sed -n '2 p' | cut -d % -f 1`


echo "****	"$Today"	****" >> /home/devops/disk_checker/check-disk.log
### Check Disk root ####

echo "$Day Disk Usage / is  $sizefree_root%" >> /home/devops/disk_checker/check-disk.log 

if [ $sizefree_root -gt 60 ];
then
	curl -d @/home/devops/disk_checker/root.json -X POST -H "Content-Type: application/json"  http://ippanel.com/api/select
	curl -d @/home/devops/disk_checker/rootj.json -X POST -H "Content-Type: application/json"  http://ippanel.com/api/select
fi

### Check Disk /Var ###

echo "$Day Disk Usage /var is  $sizefree_var%" >> /home/devops/disk_checker/check-disk.log

if [ $sizefree_var -gt 60 ];
then
	curl -d @/home/devops/disk_checker/var.json -X POST -H "Content-Type: application/json"  http://ippanel.com/api/select
	curl -d @/home/devops/disk_checker/varj.json -X POST -H "Content-Type: application/json"  http://ippanel.com/api/select
	
fi

### Check Disk /home ###

echo "$Day Disk Usage /home is  $sizefree_home%" >> /home/devops/disk_checker/check-disk.log


if [ $sizefree_home -gt 95 ];
then
	curl -d @/home/devops/disk_checker/home.json -X POST -H "Content-Type: application/json"  http://ippanel.com/api/select
	curl -d @/home/devops/disk_checker/homej.json -X POST -H "Content-Type: application/json"  http://ippanel.com/api/select
	
fi

### Check Disk /tmp ###

echo "$Day Disk Usage /tmp is  $sizefree_tmp%" >> /home/devops/disk_checker/check-disk.log


if [ $sizefree_tmp -gt 95 ];

then
	curl -d @/home/devops/disk_checker/tmp.json -X POST -H "Content-Type: application/json"  http://ippanel.com/api/select
	curl -d @/home/devops/disk_checker/tmpj.json -X POST -H "Content-Type: application/json"  http://ippanel.com/api/select
	
fi
### check free disk  -- by Reza shoghi ##### 
