package com.mvp.model;

import java.util.Date;

public class MemberVO {
	
	private String userId;
	
	private String upw;
	
	private Date ubirth;
	
	private int ugrade;

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUpw() {
		return upw;
	}

	public void setUpw(String upw) {
		this.upw = upw;
	}

	public Date getUbirth() {
		return ubirth;
	}

	public void setUbirth(Date ubirth) {
		this.ubirth = ubirth;
	}

	public int getUgrade() {
		return ugrade;
	}

	public void setUgrade(int ugrade) {
		this.ugrade = ugrade;
	}

	@Override
	public String toString() {
		return "MemberVO [userId=" + userId + ", upw=" + upw + ", ubirth=" + ubirth + ", ugrade=" + ugrade + "]";
	}
	
	
}
