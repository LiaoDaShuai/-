package com.sve.util;

import com.sve.toll.model.Formula;

public class FormulaPage {
	//���������������ݼƷ��㷨
	public double Chaobiaoerji(double num,double num1, double num2, double num3, double num4) {
		if(num<=num1){
			return num1*num2;
		}else{
			return num*num3;			
		}
	}
	//���������������ݼƷ��㷨
	public double Chaobiaosanji(double num,double num1, double num2, double num3, double num4,double num5) {
		if(num<=num1){
			return num*num2;
		}else if(num>num1&&num<=num3){
			return num1*num2+(num-num1)*num4;
		}else{
			return num1*num2+(num3-num1)*num4+(num-num3)*num5;
		}
	}
	//���������������ݼƷ��㷨
	public double Chesanji(double num,double num1, double num2, double num3, double num4,double num5){
		if(num<=num1){
			return num2;
		}else if(num>num1&&num<=num3){
			return num4;
		}else{
			return num5;
		}
	}
	//¥������������ݼƷ�(���ⶥ)
	public double Loucengerjibf(double num,double num1, double num2, double num3, double num4) {
		if(num<num1){
			return num2;
		}else{
			return num3+(num-num1)*num4;
		}
	}
	//¥������������ݼƷ�(�ⶥ)
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
	//¥�������������ļ����ݼƷ��㷨,num����¥�������mianji�����ݽ������
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
	//��¥��������������弶���ݼƷ�,num����¥�������chaobiao����������
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
	//��¥�������������弶���ݼƷ� num¥�������mianji�������
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
	//ѡ�����Ҫ�Ĺ�ʽ
	//count��������other������Щ��ʽ��Ҫ�õ��������㣬һ�㹫ʽֻ�õ�count,�ɴ�0��������
	public  double gongshiSelect(double count,double other,Formula formula) {
		if(formula.getFormulanum()==1){//�����������������ݼƷ� ,count��������
			return Chaobiaoerji(count,formula.getNum1(),formula.getNum2(),formula.getNum3(),formula.getNum4());
		}else if(formula.getFormulanum()==2){//�����������������ݼƷ�,count��������
			return Chaobiaosanji(count,formula.getNum1(),formula.getNum2(),formula.getNum3(),formula.getNum4(),formula.getNum5());
		}else if(formula.getFormulanum()==3){//�����������������ݼƷѣ�count��������
			return Chesanji(count,formula.getNum1(),formula.getNum2(),formula.getNum3(),formula.getNum4(),formula.getNum5());
		}else if(formula.getFormulanum()==4){//��¥��������������շѣ����ⶥ����count¥�����
			return Loucengerjibf(count,formula.getNum1(),formula.getNum2(),formula.getNum3(),formula.getNum4());
		}else if(formula.getFormulanum()==5){//��¥������������ݼƷѣ��ⶥ����count¥�����
			return Loucengersanjif(count,formula.getNum1(),formula.getNum2(),formula.getNum3(),formula.getNum4(),formula.getNum5());
		}else if(formula.getFormulanum()==6){//��¥�������������ļ����ݼƷѣ�count¥�������other���ݽ������
			return Loucengjiansi(count,other,formula.getNum1(),formula.getNum2(),formula.getNum3(),formula.getNum4(),formula.getNum5(),formula.getNum6(),formula.getNum7());
		}else if(formula.getFormulanum()==7){//��¥��������������弶���ݼƷѣ�count¥�������other��������
			return Loucengjianchaowu(count,other,formula.getNum1(),formula.getNum2(),formula.getNum3(),formula.getNum4(),formula.getNum5(),formula.getNum6(),formula.getNum7(),formula.getNum8(),formula.getNum9());
		}else{//��¥�������������弶���ݼƷ�,count¥�������other���ݽ������
			return Loucengjianwu(count,other,formula.getNum1(),formula.getNum2(),formula.getNum3(),formula.getNum4(),formula.getNum5(),formula.getNum6(),formula.getNum7(),formula.getNum8(),formula.getNum9());
		}
	}
}
