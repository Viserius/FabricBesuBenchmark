/*
 * SPDX-License-Identifier: Apache-2.0
 */

package org.hyperledger.fabric.samples.nftpub;

import org.hyperledger.fabric.contract.Context;
import org.hyperledger.fabric.contract.ContractInterface;
import org.hyperledger.fabric.contract.annotation.Contact;
import org.hyperledger.fabric.contract.annotation.Contract;
import org.hyperledger.fabric.contract.annotation.Default;
import org.hyperledger.fabric.contract.annotation.Info;
import org.hyperledger.fabric.contract.annotation.License;
import org.hyperledger.fabric.contract.annotation.Transaction;
import org.hyperledger.fabric.shim.ChaincodeException;
import org.hyperledger.fabric.shim.ChaincodeStub;

import com.owlike.genson.Genson;

@Contract(
        name = "nftpub",
        info = @Info(
                title = "Asset Transfer",
                description = "The hyperlegendary asset transfer",
                version = "0.0.1-SNAPSHOT",
                license = @License(
                        name = "Apache 2.0 License",
                        url = "http://www.apache.org/licenses/LICENSE-2.0.html"),
                contact = @Contact(
                        email = "a.transfer@example.com",
                        name = "Adrian Transfer",
                        url = "https://hyperledger.example.com")))
@Default
public final class NftPub implements ContractInterface {

    private final Genson genson = new Genson();

    /**
     * Creates a new asset on the ledger.
     *
     * @param ctx the transaction context
     * @param itemId the ID of the new asset
     * @param owner the owner of the new asset
     * @param color the color of the new asset
     * @param size the size for the new asset
     * @return the created asset
     */
    @Transaction(intent = Transaction.TYPE.SUBMIT)
    public Asset CreateAsset(final Context ctx, final int itemId, final String owner, final String color,
                             final int size) {
        ChaincodeStub stub = ctx.getStub();

        Asset asset = new Asset(itemId, color, size, owner);
        String assetJSON = genson.serialize(asset);
        stub.putStringState(Integer.toString(itemId), assetJSON);

        return asset;
    }

    /**
     * TransferFrom transfers the ownership of a non-fungible token
     * from one owner to another owner
     *
     * @param {Context} ctx the transaction context
     * @param {String} from The current owner of the non-fungible token
     * @param {String} to The new owner
     * @param {String} tokenId the non-fungible token to transfer
     * @returns {Boolean} Return whether the transfer was successful or not
     */
    @Transaction(intent = Transaction.TYPE.SUBMIT)
    public boolean TransferFrom(final Context ctx, final String from, final String to, final int tokenId) {
        String submittingOrg = ctx.getClientIdentity().getMSPID();
        ChaincodeStub stub = ctx.getStub();

        Asset nft = this.ReadAsset(ctx, tokenId);

        // Check if the sender is the current owner, an authorized operator,
        // or the approved client for this non-fungible token.
        String owner = nft.getOwner();

        // Check if `from` is the current owner
        if (!owner.equalsIgnoreCase(from)) {
            throw new ChaincodeException("The from (" + from + ") is not the current owner (" + owner + ").");
        }

        // Check if submitter matches the from
        if(!submittingOrg.equalsIgnoreCase(from)) {
            throw new ChaincodeException(submittingOrg + " tried to transfer asset (" + tokenId + ") which it does " +
                    "not own. Owner is: " + owner);
        }

        // Overwrite a non-fungible token to assign a new owner.
        nft.setOwner(to);
        String assetJSON = genson.serialize(nft);
        stub.putStringState(Integer.toString(tokenId), assetJSON);

        return true;
    }

    /**
     * Retrieves an asset with the specified ID from the ledger.
     *
     * @param ctx the transaction context
     * @param assetID the ID of the asset
     * @return the asset found on the ledger if there was one
     */
    @Transaction(intent = Transaction.TYPE.EVALUATE)
    public Asset ReadAsset(final Context ctx, final int assetID) {
        ChaincodeStub stub = ctx.getStub();
        String assetJSON = stub.getStringState(Integer.toString(assetID));

        if (assetJSON == null || assetJSON.isEmpty()) {
            String errorMessage = String.format("Asset %s does not exist", assetID);
            System.out.println(errorMessage);
            throw new ChaincodeException(errorMessage);
        }

        return genson.deserialize(assetJSON, Asset.class);
    }
}
