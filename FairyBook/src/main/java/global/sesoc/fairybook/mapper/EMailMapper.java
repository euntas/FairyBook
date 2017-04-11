package global.sesoc.fairybook.mapper;

import java.io.Serializable;

public interface EMailMapper extends Serializable{

	public void sendMail(String subject, 
			String text, String fromUser, String toUser);

	
	
}
