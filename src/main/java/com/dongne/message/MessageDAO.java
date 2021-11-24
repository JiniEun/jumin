package com.dongne.message;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MessageDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	//메세지 리스트
	public ArrayList<MessageDTO> messageList(MessageDTO dto) {
		String ID = dto.getID();
		
		//메세지 리스트에 나타낼 것들 가져오기 - 가장 최근 메세지, 보낸사람 profile 사진, 보낸사람 id
		ArrayList<MessageDTO> list = (ArrayList) sqlSession.selectList("message_list", dto);
		
		for(MessageDTO mto : list) {
			mto.setID(ID);
			//현재 사용자가 해당 room에서 안읽은 메세지의 갯수를 가져온다.
			int unread = sqlSession.selectOne("count_unread", mto);
			//현재 사용자가 메세지를 주고받는 상대 profile을 가져온다.
			String profile = sqlSession.selectOne("get_other_profile", mto);
			//안읽은 메세지 갯수를 mto에 set
			mto.setUnread(unread);
			//메세지 상대의 프로필 사진을 mto에 set
			mto.setProfile(profile);
			//메세지 상대 id를 세팅.
			if (ID.equals(mto.getSendID())) {
				mto.setOtherID(mto.getRecvID());
			} else {
				mto.setOtherID(mto.getSendID());
			}
		}
		return list;
	}
	
	//room 별 메세지 내용을 가져온다.
	public ArrayList<MessageDTO> roomContentList(MessageDTO dto) {
		System.out.println("room: "+ dto.getRoom());
		System.out.println("recvID: "+ dto.getRecvID());
		System.out.println("ID: "+ dto.getID());
		//메세지 내역을 가져온다.
		ArrayList<MessageDTO> clist = (ArrayList) sqlSession.selectList("room_content_list", dto);
		
		//해당 방의 메세지들 중 받는 사람이 현재 사용자의 id인 메세지를 모두 읽음 처리한다.
		sqlSession.update("message_read_chk", dto);
		
		return clist;
	}
	
	//메세지 list에서 메세지를 보낸다.
	public int messageSendInList(MessageDTO dto) {
		
		//메세지리스트에서 보낸건지 프로필에서 보낸건지 구분하기 위함
		if(dto.getRoom()==0) { //room이 0이라면 프로필에서 보낸것
			int exist_chat = sqlSession.selectOne("exist_chat",dto);
			//프로필에서 보낸것 중 메세지 내역이 없어서 첫메세지가 될 경우를 구분하기 위함
			if(exist_chat==0) {
				int max_room = sqlSession.selectOne("max_room", dto);
				dto.setRoom(max_room+1);
			} else { //메세지 내역이 있다면 해당 room번호를 가져온다.
				int room = Integer.parseInt(sqlSession.selectOne("select_room", dto));
				dto.setRoom(room);
			}
		}
		int flag = sqlSession.insert("messageSendInList", dto);
		return flag;
	}
	
}
