package com.project;

public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String S="12/01/2016";
		String S1 = S.substring(0,2);
		String S2 = S.substring(3,5);
		S=S2+"/"+S1+S.substring(5);
		System.out.println(S);

	}

}
