package com.dongne.message;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service("com.dongne.message.MessageServiceImpl")
public class MessageServiceImpl implements MessageService {
	@Autowired
	private MessageMapper mapper;
	
	 @Override
	    public List<MessageDTO> findList(String ID) {
	        return mapper.findList(ID);
	    }
	 
	@Override
	    public void insertMessage(MessageDTO dto) {
			dto.setCate(0);
			dto.setReadChk(0);
	            
	        mapper.insertMessage(dto);
	    }

	@Override
	public String countMessageView(String ID) {
		// TODO Auto-generated method stub
		return mapper.countMessageView(ID);
	}

}
