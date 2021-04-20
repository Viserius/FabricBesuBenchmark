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

/**
 * Workload module for initializing the SUT with various accounts.
 */
class SimpleOpenWorkload extends WorkloadModuleBase {

    constructor() {
        super();
    }

    async initializeWorkloadModule(workerIndex, totalWorkers, roundIndex, roundArguments, sutAdapter, sutContext) {
        await super.initializeWorkloadModule(workerIndex, totalWorkers, roundIndex, roundArguments, sutAdapter, sutContext);
        this.numberOfAssets = this.roundArguments.numberOfAssets;
        this.numOfOrgs = this.roundArguments.numOfOrgs;
        this.isPrivate = this.roundArguments.isPrivate;

        this.assetsPerWorker = this.numberOfAssets / totalWorkers;
        this.assetIdxStart = this.assetsPerWorker * workerIndex;
        this.txIdx = 0;
    }

    _assetIdx() {
        return this.assetIdxStart + (this.txIdx % this.assetsPerWorker);
    }

    _organizationId() {
        return 1 + (this._assetIdx() % this.numOfOrgs);
    }

    _organizationMSP() {
        return 'Org' + this._organizationId() + 'MSP';
    }

    _generateWorkload() {
        let args = {
            contractId: 'fabnft',
            contractFunction: 'TransferFrom',
            invokerIdentity: 'User' + this._organizationId(),
            invokerMspId: 'Org' + this._organizationId() + 'MSP',
            readOnly: false
        }

        if(this.isPrivate === 0) {
            args.contractArguments = [this._organizationMSP(), this._organizationMSP(), this._assetIdx().toString()];
        } else if(this.isPrivate === 1) {
            args.contractArguments = [];
            args.transientMap = {
                itemId: this._assetIdx().toString(),
                from: this._organizationMSP(),
                to: this._organizationMSP()
            }
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