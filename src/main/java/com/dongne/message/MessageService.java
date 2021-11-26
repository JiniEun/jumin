package com.dongne.message;

import java.util.List;

public interface MessageService {
	String countMessageView(String ID);
	List<MessageDTO> findList(String ID);
	void insertMessage(MessageDTO dto);
	
}
