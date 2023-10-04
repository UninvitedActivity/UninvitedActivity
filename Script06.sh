# Version 0.1
# Date: October 4th 2023

mariadb -u <_user_> --password=<_password_> -h <_Database Host IP Address_> <_Database Name_> -e "SELECT ipAddress from uninvitedActivity;" | grep -v ipAddress | awk -F"[ ,]" '{ print $1 }' | sort -uV > uninvitedActivity-Export.txt
