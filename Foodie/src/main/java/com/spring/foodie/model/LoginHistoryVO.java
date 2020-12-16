package com.spring.foodie.model;



public class LoginHistoryVO {

	private String fk_email;  // 사용자 ID
	private String logindate;  // 로그인한 날짜 및 시간
	private String clientip;   // 로그인한 클라이언트 IP주소
	
	public String getFk_email() {
		return fk_email;
	}
	public void setFk_email(String fk_email) {
		this.fk_email = fk_email;
	}
	public String getLogindate() {
		return logindate;
	}
	public void setLogindate(String logindate) {
		this.logindate = logindate;
	}
	public String getClientip() {
		return clientip;
	}
	public void setClientip(String clientip) {
		this.clientip = clientip;
	}
	
	
	
}
