#!/bin/bash 
## Block WHM root access from non-whitelisted IPs 
## Version: 20160503   
PID_FILE=/var/tmp/whm_watch.pid 
WATCH_FILE=/usr/local/cpanel/logs/access_log 
WHITE_LIST=/root/scripts/whm_watch_whitelist 
LOG_FILE=/root/scripts/whm_watch_log
for CUR_PID in `cat $PID_FILE 2> /dev/null`;
         do
         if grep $0 /proc/$CUR_PID/cmdline &> /dev/null
         then
         if [[ "$1" == "kill" ]]
                 then
                 pkill -TERM -P $CUR_PID
                 exit 0
                 fi
         echo "WHM Watch is already running... (PID $CUR_PID)"
         exit 1
         fi
 done
echo "WHM Watch started (PID $$)"
echo $$ > $PID_FILE tail -f $WATCH_FILE | grep --line-buffered -E ' - root ' | grep --line-buffered -Po "^[0-9\.]*" | grep --line-buffered -vf $WHITE_LIST | xargs -r -i -n 1 csf -d {} "do not delete - Suspicious WHM root access" &>> $LOG_FILE
