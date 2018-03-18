package com.sve.auto.model;

import java.util.Date;
import java.util.List;

public class Menu {
    private Integer menuId;

    private String menuName;

    private Integer menuOrder;

    private String menuIcon;

    private Date menuCreateAt;

    private List<Permission> permlist;
    
    public List<Permission> getPermlist() {
		return permlist;
	}

	public void setPermlist(List<Permission> permlist) {
		this.permlist = permlist;
	}

	public Integer getMenuId() {
        return menuId;
    }

    public void setMenuId(Integer menuId) {
        this.menuId = menuId;
    }

    public String getMenuName() {
        return menuName;
    }

    public void setMenuName(String menuName) {
        this.menuName = menuName == null ? null : menuName.trim();
    }

    public Integer getMenuOrder() {
        return menuOrder;
    }

    public void setMenuOrder(Integer menuOrder) {
        this.menuOrder = menuOrder;
    }

    public String getMenuIcon() {
        return menuIcon;
    }

    public void setMenuIcon(String menuIcon) {
        this.menuIcon = menuIcon == null ? null : menuIcon.trim();
    }

    public Date getMenuCreateAt() {
        return menuCreateAt;
    }

    public void setMenuCreateAt(Date menuCreateAt) {
        this.menuCreateAt = menuCreateAt;
    }
}