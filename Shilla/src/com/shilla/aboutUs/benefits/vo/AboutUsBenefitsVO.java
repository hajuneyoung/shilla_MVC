package com.shilla.aboutUs.benefits.vo;

public class AboutUsBenefitsVO {

	private int benefits;
	private	String context;
	
	public AboutUsBenefitsVO() {
		// TODO Auto-generated constructor stub
	}

		
	public AboutUsBenefitsVO(int benefits, String context) {
		this.benefits = benefits;
		this.context = context;
	}



	public int getBenefits() {
		return benefits;
	}

	public void setBenefits(int benefits) {
		this.benefits = benefits;
	}

	public String getContext() {
		return context;
	}

	public void setContext(String context) {
		this.context = context;
	}
	
	

}
