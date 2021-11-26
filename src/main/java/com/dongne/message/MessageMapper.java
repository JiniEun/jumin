package com.dongne.message;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MessageMapper {
	String countMessageView(String ID);
    List<MessageDTO> findList(String ID);
    void insertMessage(MessageDTO dto);
	}
