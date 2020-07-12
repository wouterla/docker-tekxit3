#!/bin/bash
shopt -s extglob; set +H
#curl -so mc.zip ${SERVER_URL}
#unzip mc.zip -d /data-temp
#mv -v data-temp/*/* data/
cp -ar data-temp/*/!(server.properties|ops.json|banned-ips.json|banned-players.json|whitelist.json|usercache.json) /data/
jarfile=$(cd /data && ls|grep forge-*.jar)
cd /data
java -server "-XX:+UnlockExperimentalVMOptions" "-XX:+UseCGroupMemoryLimitForHeap" "-XshowSettings:vm" "-Dfml.queryResult=confirm" -jar $jarfile nogui
#"-Xmx${MAX_MEM}" "-Xms${INIT_MEM}" 
