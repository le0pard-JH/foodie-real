package com.spring.foodie.model;

public class MemberVO {
	private String no; // 회원아이디
	private String type; // 가입유형
	private String kakaoid; // 카카오 아이디
	private String name; // 회원명
	private String email; // 이메일 (AES-256 암호화/복호화 대상)
	private String pwd; // 연락처 (AES-256 암호화/복호화 대상)
	private String mobile; // 연락처 (AES-256 암호화/복호화 대상)
	private String registerday; // 가입일자
	private String status; // 회원탈퇴유무
	private String idle; // 휴먼유무

	/////////////////////////////////////////////////////////////////////

	public MemberVO() {
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getKakaoid() {
		return kakaoid;
	}

	public void setKakaoid(String kakaoid) {
		this.kakaoid = kakaoid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getRegisterday() {
		return registerday;
	}

	public void setRegisterday(String registerday) {
		this.registerday = registerday;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getIdle() {
		return idle;
	}

	public void setIdle(String idle) {
		this.idle = idle;
	}
	
	
	public MemberVO(String no, String type, String kakaoid, String name, String email, String pwd, String mobile,
			String registerday, String status, String idle) {
		this.no = no;
		this.type = type;
		this.kakaoid = kakaoid;
		this.name = name;
		this.email = email;
		this.pwd = pwd;
		this.mobile = mobile;
		this.registerday = registerday;
		this.status = status;
		this.idle = idle;
	}

	
}
