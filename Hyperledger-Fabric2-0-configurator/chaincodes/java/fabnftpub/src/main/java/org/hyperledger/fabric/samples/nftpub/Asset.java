/*
 * SPDX-License-Identifier: Apache-2.0
 */

package org.hyperledger.fabric.samples.nftpub;

import org.hyperledger.fabric.contract.annotation.DataType;
import org.hyperledger.fabric.contract.annotation.Property;

import com.owlike.genson.annotation.JsonProperty;

@DataType()
public class Asset {

    @Property()
    private int itemId;

    @Property()
    private String color;

    @Property()
    private int size;

    @Property()
    private String owner;

    public int getItemId() {
        return itemId;
    }

    public String getColor() {
        return color;
    }

    public int getSize() {
        return size;
    }

    public String getOwner() {
        return owner;
    }


    public Asset(@JsonProperty("itemId") final int itemId, @JsonProperty("color") final String color,
                 @JsonProperty("size") final int size, @JsonProperty("owner") final String owner) {
        this.itemId = itemId;
        this.color = color;
        this.size = size;
        this.owner = owner;
    }

    public void setItemId(int itemId) {
        this.itemId = itemId;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public void setOwner(String owner) {
        this.owner = owner;
    }
}
