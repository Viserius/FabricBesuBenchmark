node ../../caliper/packages/caliper-cli/caliper.js bind --caliper-bind-sut besu:latest
node ../../caliper/packages/caliper-cli/caliper.js launch manager --caliper-workspace ./ --caliper-networkconfig networks/besuexample.json --caliper-benchconfig benchmarks/besuexample.yaml