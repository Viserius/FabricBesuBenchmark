NO_ORDERERS="2"
NO_ORGANIZATIONS="5"
NO_PEERS="1"
DOMAIN="example.com"
CONSORTIUM_NAME="WebConsortium"
ORDERERS="-o localhost:7050 --tls --ordererTLSHostnameOverride orderer1.example.com --cafile=./crypto-config/ordererOrganizations/example.com/orderers/orderer1.example.com/msp/tlscacerts/tlsca.example.com-cert.pem"
PEER_CON_PARAMS="--peerAddresses localhost:7051 --tlsRootCertFiles /mnt/c/Users/soelm/Desktop/Repositories/FabricBesuBenchmark/Hyperledger-Fabric2-0-configurator/crypto-config/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt --peerAddresses localhost:8051 --tlsRootCertFiles /mnt/c/Users/soelm/Desktop/Repositories/FabricBesuBenchmark/Hyperledger-Fabric2-0-configurator/crypto-config/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt --peerAddresses localhost:9051 --tlsRootCertFiles /mnt/c/Users/soelm/Desktop/Repositories/FabricBesuBenchmark/Hyperledger-Fabric2-0-configurator/crypto-config/peerOrganizations/org3.example.com/peers/peer0.org3.example.com/tls/ca.crt --peerAddresses localhost:10051 --tlsRootCertFiles /mnt/c/Users/soelm/Desktop/Repositories/FabricBesuBenchmark/Hyperledger-Fabric2-0-configurator/crypto-config/peerOrganizations/org4.example.com/peers/peer0.org4.example.com/tls/ca.crt --peerAddresses localhost:11051 --tlsRootCertFiles /mnt/c/Users/soelm/Desktop/Repositories/FabricBesuBenchmark/Hyperledger-Fabric2-0-configurator/crypto-config/peerOrganizations/org5.example.com/peers/peer0.org5.example.com/tls/ca.crt "
CORE_PEER_LOCALMSPID=Org1MSP
CORE_PEER_TLS_ENABLED=true
CORE_PEER_TLS_ROOTCERT_FILE=./crypto-config/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt
CORE_PEER_MSPCONFIGPATH=./crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp
export CORE_PEER_ADDRESS=localhost:7051
BASEPATH=$PWD/crypto-config
changeOrg(){
  org=$2
  peer=$1
  export baseport=$(( 7051+1000*(($NO_PEERS*($org -1))+$peer) ))
  export CORE_PEER_LOCALMSPID=Org${org}MSP
  export CORE_PEER_TLS_ENABLED=true
  export CORE_PEER_TLS_ROOTCERT_FILE=$BASEPATH/peerOrganizations/org${org}.${DOMAIN}/peers/peer0.org${org}.${DOMAIN}/tls/ca.crt
  export CORE_PEER_MSPCONFIGPATH=$BASEPATH/peerOrganizations/org${org}.${DOMAIN}/users/Admin@org${org}.${DOMAIN}/msp
  export CORE_PEER_ADDRESS=localhost:${baseport}
}
