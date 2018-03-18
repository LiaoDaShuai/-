package com.sve.lifeservice.model;

import org.directwebremoting.annotations.DataTransferObject;

@DataTransferObject
public class AnnDis {
    private Integer adsAnnid;

    private int[] adsDids;
    
    private Integer adsDid;

	public Integer getAdsAnnid() {
		return adsAnnid;
	}

	public void setAdsAnnid(Integer adsAnnid) {
		this.adsAnnid = adsAnnid;
	}

	public int[] getAdsDids() {
		return adsDids;
	}

	public void setAdsDids(int[] adsDids) {
		this.adsDids = adsDids;
	}

	public Integer getAdsDid() {
		return adsDid;
	}

	public void setAdsDid(Integer adsDid) {
		this.adsDid = adsDid;
	}


}