package com.sve.toll.model;

import java.io.Serializable;

import org.directwebremoting.annotations.DataTransferObject;

@DataTransferObject
public class Formula implements Serializable{
    private Integer formulaid;

    private Integer formulanum;

    private String formulaname;

    private Long num1;

    private Long num2;

    private Long num3;

    private Long num4;

    private Long num5;

    private Long num6;

    private Long num7;

    private Long num8;

    private Long num9;
    
    private String remark;
    
    private String keyword;

    public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public Integer getFormulaid() {
        return formulaid;
    }

    public void setFormulaid(Integer formulaid) {
        this.formulaid = formulaid;
    }

    public Integer getFormulanum() {
        return formulanum;
    }

    public void setFormulanum(Integer formulanum) {
        this.formulanum = formulanum;
    }

    public String getFormulaname() {
        return formulaname;
    }

    public void setFormulaname(String formulaname) {
        this.formulaname = formulaname == null ? null : formulaname.trim();
    }

    public Long getNum1() {
        return num1;
    }

    public void setNum1(Long num1) {
        this.num1 = num1;
    }

    public Long getNum2() {
        return num2;
    }

    public void setNum2(Long num2) {
        this.num2 = num2;
    }

    public Long getNum3() {
        return num3;
    }

    public void setNum3(Long num3) {
        this.num3 = num3;
    }

    public Long getNum4() {
        return num4;
    }

    public void setNum4(Long num4) {
        this.num4 = num4;
    }

    public Long getNum5() {
        return num5;
    }

    public void setNum5(Long num5) {
        this.num5 = num5;
    }

    public Long getNum6() {
        return num6;
    }

    public void setNum6(Long num6) {
        this.num6 = num6;
    }

    public Long getNum7() {
        return num7;
    }

    public void setNum7(Long num7) {
        this.num7 = num7;
    }

    public Long getNum8() {
        return num8;
    }

    public void setNum8(Long num8) {
        this.num8 = num8;
    }

    public Long getNum9() {
        return num9;
    }

    public void setNum9(Long num9) {
        this.num9 = num9;
    }

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
    
}