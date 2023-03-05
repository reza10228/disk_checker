#!/bin/bash
## Prepared by Sysadmin Reza Shoghi

Today=`date +%Y-%m-%d`
Day=`date +%Y-%m-%d\ %H:%M:%S`
#Time=`date +%H:%M:%S`
sizefree_root=`df -hi / | awk '{ print $5 }' | sed -n '2 p' | cut -d % -f 1`
sizefree_home=`df -hi /home | awk '{ print $5 }' | sed -n '2 p' | cut -d % -f 1`
sizefree_var=`df -hi /var | awk '{ print $5 }' | sed -n '2 p' | cut -d % -f 1`
sizefree_tmp=`df -hi /tmp | awk '{ print $5 }' | sed -n '2 p' | cut -d % -f 1`

echo "****      "$Today"        ****" >> /home/devops/disk_checker/check-inode.log
### Check Disk root ####

if [ $sizefree_root -gt 75 ];
then
	curl -d @/home/devops/disk_checker/Iroot.json -X POST -H "Content-Type: application/json"  http://ippanel.com/api/select
	curl -d @/home/devops/disk_checker/Irootj.json -X POST -H "Content-Type: application/json"  http://ippanel.com/api/select
fi
echo "$Day Inode Usage / is  $sizefree_root%" >>  /home/devops/disk_checker/check-inode.log 


### Check Disk home ####

if [ $sizefree_home -gt 93 ];
then
        curl -d @/home/devops/disk_checker/Ihome.json -X POST -H "Content-Type: application/json"  http://ippanel.com/api/select
	curl -d @/home/devops/disk_checker/Ihomej.json -X POST -H "Content-Type: application/json"  http://ippanel.com/api/select
fi
echo "$Day Inode Usage /home is  $sizefree_home%" >> /home/devops/disk_checker/check-inode.log

### Check Disk var  ####

if [ $sizefree_var -gt 93 ];
then
        curl -d @/home/devops/disk_checker/Ivar.json -X POST -H "Content-Type: application/json"  http://ippanel.com/api/select
	curl -d @/home/devops/disk_checker/Ivarj.json -X POST -H "Content-Type: application/json"  http://ippanel.com/api/select
fi
echo "$Day Inode Usage  /var is  $sizefree_var%" >> /home/devops/disk_checker/check-inode.log


### Check Disk /tmp  ####

if [ $sizefree_tmp -gt 93 ];
then
	curl -d @/home/devops/disk_checker/Itmp.json -X POST -H "Content-Type: application/json"  http://ippanel.com/api/select
	curl -d @/home/devops/disk_checker/Itmpj.json -X POST -H "Content-Type: application/json"  http://ippanel.com/api/select
fi
echo "$Day Inode Usage  /tmp is  $sizefree_tmp%" >> /home/devops/disk_checker/check-inode.log

### check free disk  -- provide by Reza shoghi ##### 
