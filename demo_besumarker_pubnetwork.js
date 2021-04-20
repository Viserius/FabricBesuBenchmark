const run = async function() {
    var Web3 = require('web3');
    var Common = require('@ethereumjs/common').default;
    var Transaction = require('ethereumjs-tx').Transaction;

    private_key = "PRIVATE_KEY_HERE";

    // Show web3 where it needs to look for the Ethereum node
    web3 = new Web3(new Web3.providers.HttpProvider('https://ropsten.infura.io/v3/INFURA_API_KEY_HERE'));

    let params = {
        gas: 60000,
        gasPrice: 300,
        data: "0x1234", // As if this was the private transaction hash or payload
        to: "0x00000000D000300000000000000000000000007E",
        nonce: 1
    }

    // https://ethereum.stackexchange.com/questions/84414/error-invalid-sender-from-web3-eth-sendsignedtransaction
    var common = new Common({ chain: 'ropsten' })
    var bytes = [];
    var transaction = new Transaction (params, { "common": common });
    var private_key_bytes = private_key.substr (2); // remove the 0x
    for (var b = 0; b < private_key_bytes.length; b += 2)
    {
        var hex_byte = private_key_bytes.substr (b, 2);
        var int_byte = parseInt (hex_byte, 16);
        bytes.push (int_byte);
    }

    transaction.sign (Buffer.from (bytes));

    var verified = transaction.verifySignature (); // returns true
    console.log('----- Verified: ' + verified)
    var valid = transaction.validate (); // returns false
    console.log('----- Validated: ' + valid)

    var serialized_transaction = transaction.serialize ();
    web3.eth.sendSignedTransaction ("0x" + serialized_transaction.toString ("hex")).on ("receipt", console.log);





    // console.log("----- signing:")
    // signTx = await web3.eth.accounts.signTransaction(params, private_key);
    // console.log("----- signed result:");
    // console.log(signTx);
    // console.log("----- Sending:")
    // let rawTx = signTx.rawTransaction;
    // receipt = await web3.eth.sendSignedTransaction(rawTx);
    // console.log("----- Sent: " + receipt);
}

run();