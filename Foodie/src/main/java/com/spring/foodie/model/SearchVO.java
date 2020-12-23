package com.spring.foodie.model;

public class SearchVO {

   private String code;        // 가게코드
   private String type;        // 타입
   private String open_status; // 영업유무
   private String hygine;      // 판매종류
   private String name;        // 점포명
   private String call;        // 점포 전화번호
   private String postcode;    // 점포 우편번호
   private String address;     // 점포 주소
   private String rownum;      // 
   
   public SearchVO() {}
   
   public SearchVO(String code, String type, String open_status, String hygine, String name, String call,
         String postcode, String address, String rownum) {
      this.code = code;
      this.type = type;
      this.open_status = open_status;
      this.hygine = hygine;
      this.name = name;
      this.call = call;
      this.postcode = postcode;
      this.address = address;
      this.rownum=rownum;
   }
   
   public String getCode() {
      return code;
   }
   public void setCode(String code) {
      this.code = code;
   }
   public String getType() {
      return type;
   }
   public void setType(String type) {
      this.type = type;
   }
   public String getOpen_status() {
      return open_status;
   }
   public void setOpen_status(String open_status) {
      this.open_status = open_status;
   }
   public String getHygine() {
      return hygine;
   }
   public void setHygine(String hygine) {
      this.hygine = hygine;
   }
   public String getName() {
      return name;
   }
   public void setName(String name) {
      this.name = name;
   }
   public String getCall() {
      return call;
   }
   public void setCall(String call) {
      this.call = call;
   }
   public String getPostcode() {
      return postcode;
   }
   public void setPostcode(String postcode) {
      this.postcode = postcode;
   }
   public String getAddress() {
      return address;
   }
   public void setAddress(String address) {
      this.address = address;
   }

   public String getRownum() {
      return rownum;
   }

   public void setRownum(String rownum) {
      this.rownum = rownum;
   }
}

