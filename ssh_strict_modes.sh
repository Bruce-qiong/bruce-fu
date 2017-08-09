#!/bin/bash
#!/bin/bash
###########################################
# Output:
# At this time, it must exactly equal to "yes".
# Other output is non-compliant.
# USER        YYYY-MM-DD - ACTION
# bruce fu      20016-02-16 - Created
# mail   270064522@qq.com
############################################

ret=`awk '$1 == "StrictModes" {print $2}' /etc/ssh/sshd_config`
if [ "$ret" = "" ];then
	echo "NULL,The StrictModes is not configure,you can configure it like this:
echo \"StrictModes yes\" >> /etc/ssh/sshd_config
service sshd restart"
elif [ "$ret" != "" -a "$ret" != "yes" ];then
        echo "FALSE,The StrictModes is incorrect,you can alter it like this:
sed -i 's/^\(StrictModes[[:space:]]\).*/\1yes/g' /etc/ssh/sshd_config
service sshd restart"
else 
	echo "$ret"
fi
