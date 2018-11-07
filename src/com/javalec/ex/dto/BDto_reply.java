package com.javalec.ex.dto;

import java.sql.Timestamp;

public class BDto_reply {

	
	String name;
	String reply;
	String id;
	Timestamp bDate;
	
	
	public BDto_reply(String name, String reply, String id, Timestamp bDate) {
		super();
		this.name = name;
		this.reply = reply;
		this.id = id;
		this.bDate = bDate;
	}

	public Timestamp getbDate() {
		return bDate;
	}
	public void setbDate(Timestamp bDate) {
		this.bDate = bDate;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	
}
