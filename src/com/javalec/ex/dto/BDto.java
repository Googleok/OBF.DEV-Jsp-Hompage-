package com.javalec.ex.dto;

import java.sql.Timestamp;

public class BDto {

	String bId;
	String bPasswd;
	String bName;
	String bEmail;
	String bAddress;
	String bJumin;
	String bBirth;
	String []bInterest;
	String bIntroduce;
	String bTitle;
	String bContent;
	Timestamp bDate;
	int bHit;
	int bGroup;
	int bStep;
	int bIndent;
	
	public BDto() {
		// TODO Auto-generated constructor stub
	}
	
	public BDto(String bId, String bName, String bTitle, String bContent, Timestamp bDate, int bHit, int bGroup, int bStep, int bIndent) {
		// TODO Auto-generated constructor stub
		this.bId = bId;
		this.bName = bName;
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.bDate = bDate;
		this.bHit = bHit;
		this.bGroup = bGroup;
		this.bStep = bStep;
		this.bIndent = bIndent;
	}

	public BDto(String bId, String bPasswd, String bName, String bEmail, String bAddress, String bJumin, String bBirth,
			String[] bInterest, String bIntroduce) {
		this.bId = bId;
		this.bPasswd = bPasswd;
		this.bName = bName;
		this.bEmail = bEmail;
		this.bAddress = bAddress;
		this.bJumin = bJumin;
		this.bBirth = bBirth;
		this.bInterest = bInterest;
		this.bIntroduce = bIntroduce;
	}

	public String getbPasswd() {
		return bPasswd;
	}

	public void setbPasswd(String bPasswd) {
		this.bPasswd = bPasswd;
	}

	public String getbEmail() {
		return bEmail;
	}

	public void setbEmail(String bEmail) {
		this.bEmail = bEmail;
	}

	public String getbAddress() {
		return bAddress;
	}

	public void setbAddress(String bAddress) {
		this.bAddress = bAddress;
	}

	public String getbJumin() {
		return bJumin;
	}

	public void setbJumin(String bJumin) {
		this.bJumin = bJumin;
	}

	public String getbBirth() {
		return bBirth;
	}

	public void setbBirth(String bBirth) {
		this.bBirth = bBirth;
	}

	public String[] getbInterest() {
		return bInterest;
	}

	public void setbInterest(String[] bInterest) {
		this.bInterest = bInterest;
	}

	public String getbIntroduce() {
		return bIntroduce;
	}

	public void setbIntroduce(String bIntroduce) {
		this.bIntroduce = bIntroduce;
	}

	public String getbId() {
		return bId;
	}

	public void setbId(String bId) {
		this.bId = bId;
	}

	public String getbName() {
		return bName;
	}

	public void setbName(String bName) {
		this.bName = bName;
	}

	public String getbTitle() {
		return bTitle;
	}

	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}

	public String getbContent() {
		return bContent;
	}

	public void setbContent(String bContent) {
		this.bContent = bContent;
	}

	public Timestamp getbDate() {
		return bDate;
	}

	public void setbDate(Timestamp bDate) {
		this.bDate = bDate;
	}

	public int getbHit() {
		return bHit;
	}

	public void setbHit(int bHit) {
		this.bHit = bHit;
	}

	public int getbGroup() {
		return bGroup;
	}

	public void setbGroup(int bGroup) {
		this.bGroup = bGroup;
	}

	public int getbStep() {
		return bStep;
	}

	public void setbStep(int bStep) {
		this.bStep = bStep;
	}

	public int getbIndent() {
		return bIndent;
	}

	public void setbIndent(int bIndent) {
		this.bIndent = bIndent;
	}
	
}
