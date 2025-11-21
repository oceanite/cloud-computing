#!/bin/sh

apk update && apk add mysql-client

REPORTDIR=/reports

echo "Daily Report Generator started"

while true; do
    timestamp=$(date '+%Y-%m-%d_%H-%M')
    file="$REPORTDIR/report_$timestamp.txt"

    mysql -h mysql4 -uweatheruser -pweather123 weatherdb \
        -e "SELECT AVG(temperature), AVG(windspeed) FROM measurements;" \
        > $file

    echo "Generated report: $file"
    sleep 30
done
