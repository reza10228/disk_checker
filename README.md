Add Three Line in to crontab

```
#Check free Disk  #### By Reza Shoghi
0 8,12,16,20 * * * /bin/bash /home/devops/disk_checker/check-free-disk.sh
0 8,12,16,20 * * * /bin/bash /home/devops/disk_checker/check-free-indode.sh
```
