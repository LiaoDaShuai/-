package com.sve.util;

import com.github.pagehelper.PageInfo;

//分页导航条
public class PageInfo2 {
	private int startPage=1;
	private int endPage=5;
	private int size;
	private int selectnum[];
	
	public PageInfo2(PageInfo page,int pageNum){
		if(this.endPage>page.getLastPage()){
			this.endPage=page.getLastPage();
		}else{
			this.startPage=pageNum-2;
			this.endPage=pageNum+2;
			if(this.startPage<1){
				startPage=1;
				endPage=5;
			}
			if(this.endPage>page.getLastPage()){
				this.endPage= page.getLastPage();
				this.startPage=(page.getLastPage()-4);
			}
		}//算出总页数，并把值重定义在lastpage里
		if(page.getTotal()%page.getPageSize()==0){
			page.setLastPage((int)page.getTotal()/page.getPageSize());
		}else{
			page.setLastPage((int)page.getTotal()/page.getPageSize()+1);
		}
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getSize() {
		return size;
	}
	public void setSize(int size) {
		this.size = size;
	}
	public int[] getSelectnum() {
		return selectnum;
	}
	public void setSelectnum(int[] selectnum) {
		this.selectnum = selectnum;
	}
	
}
