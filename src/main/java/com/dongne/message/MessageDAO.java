package com.dongne.message;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MessageDAO {
	
	@Autowired 
	public SqlSession sqlSession;
	
	//메세지 리스트
	public ArrayList<MessageDTO> messageList(MessageDTO dto) {
		String ID = dto.getID();
		
		// 메세지 리스트에 나타낼 것들 가져오기 - 가장 최근 메세지, 보낸 사람 ID
		ArrayList<MessageDTO> list = (ArrayList)sqlSession.selectList("message_list", dto);
		
		for(MessageDTO mto: list) {
			mto.setID(ID);
			// 현재 사용자가 해당 room에서 안읽은 메세지의 갯수를 가져온다.
			int unread = sqlSession.selectOne("count_unread", mto);
			//현재 사용자가 메세지를 주고받는 상대 profile을 가져온다.
			//안읽은 메세지 갯수를 mto에 set => profile 사진 아직 삽입 x
			mto.setUnread(unread);
			//메세지 상대의 프로필사진을 mto에 set => profile 사진 아직 삽입 x
			if(ID.equals(mto.getSender())) {
				mto.setOtherID(mto.getReceiver());
			} else {
				mto.setOtherID(mto.getSender());
			}
		}
		return list;	
	}
	
		//room별 메세지 내용을 가져온다.
		public ArrayList<MessageDTO> roomContentList(MessageDTO dto) {
			
			System.out.println("room: " + dto.getRoomID());
			System.out.println("receiver: " + dto.getReceiver());
			System.out.println("ID: " + dto.getID());
			//메세지 내역을 가져온다.
			ArrayList<MessageDTO> clist = (ArrayList) sqlSession.selectList("room_content_list",dto);
			
			
			//해당 방의 메세지들 중 받는 사람이 현재 사용자의 ID인 메세지를 모두 읽음 처리
			int flag = sqlSession.update("message_read_chk", dto);
			System.out.println("read_chk: "+flag);
			
			return clist;
		}
		
		//메세지 list에서 메세지를 보낸다.
		public int messageSendInlist(MessageDTO dto) {
			//메세지리스트에서 보낸건지 프로필에서 보낸건지 구분하기 위함
			int flag = 0;
			if(dto.getRoomID() == 0) { //roomID가 0이라면 프로필에서 보낸것
				int exist_chat = sqlSession.selectOne("exist_chat", dto);
				//프로필에서 보낸 것 중 메세지 내역이 없어서 첫 메세지가 될 경우 구분
				if(exist_chat ==0) { //메세지 내역이 없어서 0이면 message 테이블의 roomID 최댓값을 구해서 dto에 set
					int max_room = sqlSession.selectOne("max_room",dto);
					dto.setRoomID(max_room+1);
					dto.setContent("신청합니다");
					flag = sqlSession.insert("messageSendInlist", dto);
				}else { //메세지 내역이 있다면 해당 room번호 가져옴
					int room = Integer.parseInt(sqlSession.selectOne("select_room", dto));
					dto.setRoomID(room);
				}
			}else {
			
			  flag = sqlSession.insert("messageSendInlist", dto);
			}
			
			return flag;
		}
		

}
