awk -F"[,]" '{print "INSERT INTO `uninvitedActivity` (`activityDate`, `ipAddress`, `server`) VALUES ('\''"$1"'\'', '\''"$2"'\'', '\''"$3"'\'');"}' 20230928_DBImportReady.csv > ImportSQLCommands.sql

while IFS= read -r line;
do
   mariadb -u <_user_> --password=<_password_> -h <_Host IP Address_> <_Database Name_> -e "$line";
done < ImportSQLCommands.sql
