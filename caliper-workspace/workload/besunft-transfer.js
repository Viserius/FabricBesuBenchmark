/*
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
* http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

'use strict';

const { WorkloadModuleBase } = require('@hyperledger/caliper-core');
const Web3 = require('web3');

/**
 * Workload module for initializing the SUT with various accounts.
 */
class SimpleOpenWorkload extends WorkloadModuleBase {

    constructor() {
        super();
        this.contract = {};
    }

    async initializeWorkloadModule(workerIndex, totalWorkers, roundIndex, roundArguments, sutAdapter, sutContext) {
        await super.initializeWorkloadModule(workerIndex, totalWorkers, roundIndex, roundArguments, sutAdapter, sutContext);
        this.numberOfWarmupTxs = this.roundArguments.numberOfWarmupTxs;
        this.isWarmup = this.roundArguments.isWarmup;
        this.numberOfAssets = this.roundArguments.numberOfAssets;

        this.assetsPerWorker = this.numberOfAssets / totalWorkers;
        this.assetIdxStart = this.assetsPerWorker * workerIndex;
        this.txIdx = 0;
        this.web3 = new Web3(sutContext.url);
    }

    _privKey() {
        let txToHex = (this._assetIdx()+1).toString(16);
        let zerosToPad = 64 - txToHex.length;
        return "0x" + "0".repeat(zerosToPad) + txToHex;
    }

    _privKeyToPubKey(privateKey) {
        return this.web3.eth.accounts.privateKeyToAccount(privateKey).address;
    }

    _assetIdx() {
        return this.assetIdxStart + (this.txIdx % this.assetsPerWorker);
    }

    _nonce() {
        if(this.isWarmup === 1) {
            return 1 + Math.floor(this.txIdx / this.assetsPerWorker);
        } else {
            return 1 + Math.floor(this.numberOfWarmupTxs / this.numberOfAssets) + Math.floor(this.txIdx / this.assetsPerWorker);
        }
    }

    _generateWorkload() {
        let privateKey = this._privKey();
        let publicKey = this._privKeyToPubKey(privateKey);

        let args = {
            contract: this.roundArguments.contract,
            verb: 'transferFrom',
            args: [publicKey, publicKey, this._assetIdx()],
            readOnly: false,
            sender: {privateKey: this._privKey(), nonce: this._nonce()}
        }

        if (this.sutContext.privacy) {
            args.privacy = this.sutContext.privacy['group'];
            args.privacy['id'] = 'group';
        }

        this.txIdx++;

        return args;
    }

    async submitTransaction() {
        let args = this._generateWorkload();
        await this.sutAdapter.sendRequests(args);
    }
}

/**
 * Create a new instance of the workload module.
 * @return {WorkloadModuleInterface}
 */
function createWorkloadModule() {
    return new SimpleOpenWorkload();
}

module.exports.createWorkloadModule = createWorkloadModule;