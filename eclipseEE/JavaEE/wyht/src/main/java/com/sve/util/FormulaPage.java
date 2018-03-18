package com.sve.util;

import com.sve.toll.model.Formula;

public class FormulaPage {
	//抄表用量二级阶梯计费算法
	public double Chaobiaoerji(double num,double num1, double num2, double num3, double num4) {
		if(num<=num1){
			return num1*num2;
		}else{
			return num*num3;			
		}
	}
	//抄表用量三级阶梯计费算法
	public double Chaobiaosanji(double num,double num1, double num2, double num3, double num4,double num5) {
		if(num<=num1){
			return num*num2;
		}else if(num>num1&&num<=num3){
			return num1*num2+(num-num1)*num4;
		}else{
			return num1*num2+(num3-num1)*num4+(num-num3)*num5;
		}
	}
	//车辆排量三级阶梯计费算法
	public double Chesanji(double num,double num1, double num2, double num3, double num4,double num5){
		if(num<=num1){
			return num2;
		}else if(num>num1&&num<=num3){
			return num4;
		}else{
			return num5;
		}
	}
	//楼宇层数二级阶梯计费(不封顶)
	public double Loucengerjibf(double num,double num1, double num2, double num3, double num4) {
		if(num<num1){
			return num2;
		}else{
			return num3+(num-num1)*num4;
		}
	}
	//楼宇层数二级阶梯计费(封顶)
	public double Loucengersanjif(double num,double num1, double num2, double num3, double num4,double num5) {
		if(num<num1){
			return num2;
		}else{
			num=num2+(num-num1)*num3;
			if(num>num4){
				return num5;
			}else{
				return num;
			}
		}
	}
	//楼宇层数建筑面积四级阶梯计费算法,num代表楼宇层数，mianji代表房屋建筑面积
	public double Loucengjiansi(double num,double mianji,double num1, double num2, double num3, double num4,double num5,double num6,double num7) {
		if(num>=0&&num<=num1){
			return num2*mianji;
		}else if(num>num1&&num<num3){
			return num4*mianji;
		}else if(num>num3&&num<=num5){
			return num6*mianji;
		}else{
			return num7*mianji;
		}
	}
	//按楼宇层数抄表用量五级阶梯计费,num代表楼宇层数，chaobiao代表抄表用量
	public double Loucengjianchaowu(double num,double chaobiao,double num1, double num2, double num3, double num4,double num5,double num6,double num7,double num8,double num9) {
		if(num<=num1){
			return num2*chaobiao;
		}else if(num>num1&&num<=num3){
			return num4*chaobiao;
		}else if(num>num3&&num<=num5){
			return num6*chaobiao;
		}else if(num>num5&&num<=num7){
			return num8*chaobiao;
		}else{
			return num9*chaobiao;
		}
	}
	//按楼宇层数建筑面积五级阶梯计费 num楼宇层数，mianji建筑面积
	public double Loucengjianwu(double num,double mianji,double num1, double num2, double num3, double num4,double num5,double num6,double num7,double num8,double num9) {
		if(num<=num1){
			return num2*mianji;
		}else if(num>num1&&num<=num3){
			return num4*mianji;
		}else if(num>num3&&num<=num5){
			return num6*mianji;
		}else if(num>num5&&num<=num7){
			return num8*mianji;
		}else{
			return num9*mianji;
		}
	}
	//选择出你要的公式
	//count是总量，other代表有些公式需要用到的面积或层，一般公式只用到count,可传0进来即可
	public  double gongshiSelect(double count,double other,Formula formula) {
		if(formula.getFormulanum()==1){//按抄表用量二级阶梯计费 ,count抄表用量
			return Chaobiaoerji(count,formula.getNum1(),formula.getNum2(),formula.getNum3(),formula.getNum4());
		}else if(formula.getFormulanum()==2){//按抄表用量三级阶梯计费,count抄表用量
			return Chaobiaosanji(count,formula.getNum1(),formula.getNum2(),formula.getNum3(),formula.getNum4(),formula.getNum5());
		}else if(formula.getFormulanum()==3){//按车辆排量三级阶梯计费，count车辆排量
			return Chesanji(count,formula.getNum1(),formula.getNum2(),formula.getNum3(),formula.getNum4(),formula.getNum5());
		}else if(formula.getFormulanum()==4){//按楼宇层数二级阶梯收费（不封顶），count楼宇层数
			return Loucengerjibf(count,formula.getNum1(),formula.getNum2(),formula.getNum3(),formula.getNum4());
		}else if(formula.getFormulanum()==5){//按楼宇层数二级阶梯计费（封顶），count楼宇层数
			return Loucengersanjif(count,formula.getNum1(),formula.getNum2(),formula.getNum3(),formula.getNum4(),formula.getNum5());
		}else if(formula.getFormulanum()==6){//按楼宇层数建筑面积四级阶梯计费，count楼宇层数，other房屋建筑面积
			return Loucengjiansi(count,other,formula.getNum1(),formula.getNum2(),formula.getNum3(),formula.getNum4(),formula.getNum5(),formula.getNum6(),formula.getNum7());
		}else if(formula.getFormulanum()==7){//按楼宇层数抄表用量五级阶梯计费，count楼层层数，other抄表用量
			return Loucengjianchaowu(count,other,formula.getNum1(),formula.getNum2(),formula.getNum3(),formula.getNum4(),formula.getNum5(),formula.getNum6(),formula.getNum7(),formula.getNum8(),formula.getNum9());
		}else{//按楼宇层数建筑面积五级阶梯计费,count楼宇层数，other房屋建筑面积
			return Loucengjianwu(count,other,formula.getNum1(),formula.getNum2(),formula.getNum3(),formula.getNum4(),formula.getNum5(),formula.getNum6(),formula.getNum7(),formula.getNum8(),formula.getNum9());
		}
	}
}
