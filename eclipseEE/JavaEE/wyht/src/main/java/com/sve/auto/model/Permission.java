package com.sve.auto.model;

import java.util.List;

public class Permission {
    private Integer permId;

    private String permName;

    private String permDescription;

    private String permUrl;

    private Integer permOrder;
    
    private Integer permIsshow;
    
    private String permCode;

    private Integer permMenuId;

    private Menu menu;
    
    public Menu getMenu() {
		return menu;
	}

	public void setMenu(Menu menu) {
		this.menu = menu;
	}

	public Integer getPermId() {
        return permId;
    }

    public void setPermId(Integer permId) {
        this.permId = permId;
    }

    public String getPermName() {
        return permName;
    }

    public void setPermName(String permName) {
        this.permName = permName == null ? null : permName.trim();
    }

    public String getPermDescription() {
        return permDescription;
    }

    public void setPermDescription(String permDescription) {
        this.permDescription = permDescription == null ? null : permDescription.trim();
    }

    public String getPermUrl() {
        return permUrl;
    }

    public void setPermUrl(String permUrl) {
        this.permUrl = permUrl == null ? null : permUrl.trim();
    }

    public String getPermCode() {
		return permCode;
	}

	public void setPermCode(String permCode) {
		this.permCode = permCode;
	}

	public Integer getPermOrder() {
		return permOrder;
	}

	public void setPermOrder(Integer permOrder) {
		this.permOrder = permOrder;
	}

	public Integer getPermIsshow() {
		return permIsshow;
	}

	public void setPermIsshow(Integer permIsshow) {
		this.permIsshow = permIsshow;
	}

	public Integer getPermMenuId() {
        return permMenuId;
    }

    public void setPermMenuId(Integer permMenuId) {
        this.permMenuId = permMenuId;
    }
}