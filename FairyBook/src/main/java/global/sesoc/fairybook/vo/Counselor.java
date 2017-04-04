package global.sesoc.fairybook.vo;

import javax.servlet.http.HttpSession;

public class Counselor {
	
	private int hospId; 			//병원고유번호
	private	String region;    		//지역구분(시,도)
	private String country; 		//지역구분(시,군,구)
	private String hospital; 		//병원명
	private String doctor; 			//담당의사
	private String phoneNum; 		//전화번호
	private String email; 			//이메일
		
	public Counselor() {
		// TODO Auto-generated constructor stub
	}

	public Counselor(int hospId, String region, String country, String hospital, String doctor, String phoneNum, String email) {
		this.hospId = hospId;
		this.region = region;
		this.country = country;
		this.hospital = hospital;
		this.doctor = doctor;
		this.phoneNum = phoneNum;
		this.email = email;
	}

	public int getHospId() {
		return hospId;
	}

	public void setHospId(int hospId) {
		this.hospId = hospId;
	}

	public String getRegion() {
		return region;
	}

	public void setRegion(String region) {
		this.region = region;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getHospital() {
		return hospital;
	}

	public void setHospital(String hospital) {
		this.hospital = hospital;
	}

	public String getDoctor() {
		return doctor;
	}

	public void setDoctor(String doctor) {
		this.doctor = doctor;
	}

	public String getPhoneNum() {
		return phoneNum;
	}

	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}

	public String getEmail() {
		
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "Counselor [hospId=" + hospId + ", region=" + region + ", country=" + country + ", hospital=" + hospital
				+ ", doctor=" + doctor + ", phoneNum=" + phoneNum + ", email=" + email + "]";
	}
	
	
	
}
