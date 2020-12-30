package com.spring.foodie.model;


//===== #82. 댓글용 VO 생성하기
//      먼저 오라클에서 tbl_comment 테이블을 생성한다.
//      또한 tbl_board 테이블에 commentCount 컬럼을 추가한다. =====


public class CommentVO {

	private String seq;          // 댓글번호
	private String fk_email;     // 사용자ID
	private String name;         // 성명
	private String content;      // 댓글내용
	private String spoint;       // 별점
	private String regDate;      // 작성일자
	private String store_id;     // 가게번호
	private String status;       // 가게상태 
	private String cntcomments;  // 대댓글 수
	private String likecnt;      // 좋아요 숫자
	private String parentSeq;    // 부모 댓글번호
	private String depthno;      // 대댓글 계층
	private String groupno;      // 그룹번호
	
	
	public CommentVO() { }
	
	
	public CommentVO(String seq, String fk_email, String name, String content, String spoint, String regDate,
			String store_id, String status, String cntcomments, String likecnt, String parentSeq, String depthno,
			String groupno) {
		this.seq = seq;
		this.fk_email = fk_email;
		this.name = name;
		this.content = content;
		this.spoint = spoint;
		this.regDate = regDate;
		this.store_id = store_id;
		this.status = status;
		this.cntcomments = cntcomments;
		this.likecnt = likecnt;
		this.parentSeq = parentSeq;
		this.depthno = depthno;
		this.groupno = groupno;
	}


	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getFk_email() {
		return fk_email;
	}
	public void setFk_email(String fk_email) {
		this.fk_email = fk_email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getSpoint() {
		return spoint;
	}
	public void setSpoint(String spoint) {
		this.spoint = spoint;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getStore_id() {
		return store_id;
	}
	public void setStore_id(String store_id) {
		this.store_id = store_id;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getCntcomments() {
		return cntcomments;
	}
	public void setCntcomments(String cntcomments) {
		this.cntcomments = cntcomments;
	}
	public String getLikecnt() {
		return likecnt;
	}
	public void setLikecnt(String likecnt) {
		this.likecnt = likecnt;
	}
	public String getParentSeq() {
		return parentSeq;
	}
	public void setParentSeq(String parentSeq) {
		this.parentSeq = parentSeq;
	}
	public String getDepthno() {
		return depthno;
	}
	public void setDepthno(String depthno) {
		this.depthno = depthno;
	}
	public String getGroupno() {
		return groupno;
	}
	public void setGroupno(String groupno) {
		this.groupno = groupno;
	}
	
		
}
	
