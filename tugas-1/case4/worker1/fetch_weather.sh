#!/bin/sh

apk update && apk add curl jq mysql-client

echo "Weather Fetch Worker started"

while true; do  
    json=$(curl -s "https://api.open-meteo.com/v1/forecast?latitude=-6.2&longitude=106.8&current_weather=true")

    temp=$(echo $json | jq '.current_weather.temperature')
    wind=$(echo $json | jq '.current_weather.windspeed')

    mysql -h mysql4 -uweatheruser -pweather123 weatherdb \
        -e "INSERT INTO measurements (temperature, windspeed) VALUES ($temp, $wind);"

    echo "Saved temperature=$temp windspeed=$wind"
    sleep 10
done
