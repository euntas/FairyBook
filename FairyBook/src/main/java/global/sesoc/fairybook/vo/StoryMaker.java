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
	private String nickName;		// 닉네임 
	private String password;		// 공통 비밀번호
	private String parentPassword;	// 부모용 비밀번호
	private String cName;			// 아이 이름
	private String pName;			// 부모 이름
	private Date cBirthday;			// 아이 생일
	private Date pBirthday;			// 부모 생일
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


	public String getNickName() {
		return nickName;
	}


	public void setNickName(String nickName) {
		this.nickName = nickName;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getParentPassword() {
		return parentPassword;
	}


	public void setParentPassword(String parentPassword) {
		this.parentPassword = parentPassword;
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


	public Date getcBirthday() {
		return cBirthday;
	}


	public void setcBirthday(Date cBirthday) {
		this.cBirthday = cBirthday;
	}


	public Date getpBirthday() {
		return pBirthday;
	}


	public void setpBirthday(Date pBirthday) {
		this.pBirthday = pBirthday;
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
		return "StoryMaker [id=" + id + ", nickName=" + nickName + ", password=" + password + ", parentPassword="
				+ parentPassword + ", cName=" + cName + ", pName=" + pName + ", cBirthday=" + cBirthday + ", pBirthday="
				+ pBirthday + ", email=" + email + ", address=" + address + ", phone=" + phone + ", originalProfile="
				+ originalProfile + ", savedProfile=" + savedProfile + "]";
	}
	
	

}
