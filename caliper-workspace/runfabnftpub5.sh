node ../../caliper/packages/caliper-cli/caliper.js bind --caliper-bind-sut fabric:2.2
node ../../caliper/packages/caliper-cli/caliper.js launch manager --caliper-workspace ./ --caliper-networkconfig networks/fabnft5.yaml --caliper-benchconfig benchmarks/fabnft5pub.yaml --caliper-flow-only-test --caliper-fabric-gateway-enabled --caliper-fabric-gateway-localhost true