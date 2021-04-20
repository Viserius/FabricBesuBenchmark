#!/bin/bash -u

# 3 or 5
export NETWORK_SIZE="3"
# ibft2 or clique
export BESU_CONS_ALGO="ibft2"
export IS_PRIVATE="true"
#export CONSOLE_OUTPUT="false"

if [ "${BESU_CONS_ALGO}" == "ibft2" ]
then
    export BESU_CONS_ALGO="ibft2${NETWORK_SIZE}"
fi

# Remove old network configs
docker rm -f $(docker ps -a -q)
docker volume rm $(docker volume ls -q)
rm ./.quorumDevQuickstart.lock
cd; cd -
# Start new network
if [ "${IS_PRIVATE}" == "false" ]
then
    docker-compose -f docker-compose-public.yml up --detach
    if [ "${NETWORK_SIZE}" == "5" ]
    then
        cd; cd -
        docker-compose -f docker-compose-public-four.yml up --detach
        cd; cd -
        docker-compose -f docker-compose-public-five.yml up --detach
    fi
    if [ "${NETWORK_SIZE}" == "4" ]
    then
        cd; cd -
        docker-compose -f docker-compose-public-four.yml up --detach
    fi
    cd /mnt/c/Users/soelm/Desktop/Repositories/FabricBesuBenchmark/caliper-workspace/
    ./runbesunftpub.sh  | grep 'Submitted:'
fi
cd; cd -
if [ "${IS_PRIVATE}" == "true" ]
then
    if [ "${NETWORK_SIZE}" == "3" ]
    then
        docker-compose -f docker-compose-private.yml up --detach
        cd /mnt/c/Users/soelm/Desktop/Repositories/FabricBesuBenchmark/caliper-workspace/
        ./runbesunftpriv3.sh | grep 'Submitted:'
    else
        export ORION_OTHER_NODES=",http://member4orion:8080/,http://member5orion:8080/"
        docker-compose -f docker-compose-private.yml up --detach
        cd; cd -
        docker-compose -f docker-compose-private-five.yml up --detach
        cd /mnt/c/Users/soelm/Desktop/Repositories/FabricBesuBenchmark/caliper-workspace/
        ./runbesunftpriv5.sh | grep 'Submitted:'
    fi
fi

printf '\7'

cd /mnt/c/Users/soelm/Desktop/Repositories/FabricBesuBenchmark/besu
docker-compose -f docker-compose-public.yml down
docker-compose -f docker-compose-public-five.yml down
docker-compose -f docker-compose-private.yml down
docker-compose -f docker-compose-private-five.yml down