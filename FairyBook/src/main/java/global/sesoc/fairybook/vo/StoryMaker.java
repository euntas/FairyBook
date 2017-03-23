package global.sesoc.fairybook.vo;

import java.util.Date;

/**
 * 유저의 정보 저장
 * 
 * @author 이은지(2017.03.20 - ver1)
 *
 */
public class StoryMaker {
	
	private String id;				// 아이디
	private String cnickName;		// 아이 닉네임 
	private String pnickName;		// 부모 닉네임 
	private String password1;		// 아동용 비밀번호
	private String password2;		// 부모용 비밀번호
	private String cName;			// 아이 이름
	private String pName;			// 부모 이름
	private Date cBirth;			// 아이 생일
	private String email;			// 이메일
	private String address;			// 주소
	private String phone;			// 전화번호
	private String originalProfile;	// 오리지날 프로필그림
	private String savedProfile;	// 저장된 프로필그림
	
	
	public StoryMaker() {
		// TODO Auto-generated constructor stub
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}

	public String getCnickName() {
		return cnickName;
	}


	public void setCnickName(String cnickName) {
		this.cnickName = cnickName;
	}


	public String getPnickName() {
		return pnickName;
	}


	public void setPnickName(String pnickName) {
		this.pnickName = pnickName;
	}


	public String getPassword1() {
		return password1;
	}


	public void setPassword1(String password) {
		this.password1 = password;
	}


	public String getPassword2() {
		return password2;
	}


	public void setPassword2(String parentPassword) {
		this.password2 = parentPassword;
	}


	public String getcName() {
		return cName;
	}


	public void setcName(String cName) {
		this.cName = cName;
	}


	public String getpName() {
		return pName;
	}


	public void setpName(String pName) {
		this.pName = pName;
	}


	public Date getcBirth() {
		return cBirth;
	}


	public void setcBirth(Date cBirthday) {
		this.cBirth = cBirthday;
	}

	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getOriginalProfile() {
		return originalProfile;
	}


	public void setOriginalProfile(String originalProfile) {
		this.originalProfile = originalProfile;
	}


	public String getSavedProfile() {
		return savedProfile;
	}


	public void setSavedProfile(String savedProfile) {
		this.savedProfile = savedProfile;
	}


	@Override
	public String toString() {
		return "StoryMaker [id=" + id + ", cnickName=" + cnickName + ", pnickName=" + pnickName + ", password1="
				+ password1 + ", password2=" + password2 + ", cName=" + cName + ", pName=" + pName + ", cBirth="
				+ cBirth + ", email=" + email + ", address=" + address + ", phone=" + phone + ", originalProfile="
				+ originalProfile + ", savedProfile=" + savedProfile + "]";
	}


}
