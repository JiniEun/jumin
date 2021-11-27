package com.dongne.message;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MessageController {
	
	@Autowired
	private MessageDAO messageDao;
	
	//메세지 목록
	@RequestMapping(value = "/message/list")
	public String message_list(HttpServletRequest request, HttpSession session) {
		String ID = (String)session.getAttribute("ID");
		
		MessageDTO dto = new MessageDTO();
		dto.setID(ID);
		
		//메세지 리스트
		ArrayList<MessageDTO> list = messageDao.messageList(dto);
		
		request.setAttribute("list", list);
		
		return "/message/list";
	}
	
	//메세지 목록
	@RequestMapping(value = "message_ajax_list.do")
	public String message_ajax_list(HttpServletRequest request, HttpSession session) {
		String ID = (String)session.getAttribute("ID");
		
		MessageDTO dto = new MessageDTO();
		dto.setID(ID);
		
		//메세지 리스트
		ArrayList<MessageDTO> list = messageDao.messageList(dto);
		
		request.setAttribute("list", list);
		
		return "message/message_ajax_list";
	}
	
	@RequestMapping(value = "message_content_list.do") 
	public String message_content_list(HttpServletRequest request, HttpSession session) {
		int roomID = Integer.parseInt(request.getParameter("roomID"));
		
		MessageDTO dto = new MessageDTO();
		dto.setRoomID(roomID);
		dto.setID((String) session.getAttribute("ID"));
		
		//메세지 내용을 가져온다.
		ArrayList<MessageDTO> clist = messageDao.roomContentList(dto);
		
		request.setAttribute("clist", clist);
		
		return "message/message_content_list";
	}
	
	//메세지 리스트에서 메세지 보내기
	@ResponseBody
	@RequestMapping(value = "/message_send_inlist.do")
	public int message_send_inlist(@RequestParam int roomID, @RequestParam String otherID, 
			@RequestParam String content, HttpSession session) {
		MessageDTO dto = new MessageDTO();
		dto.setRoomID(roomID);
		dto.setSender((String)session.getAttribute("ID"));
		dto.setReceiver(otherID);
		dto.setContent(content);
		
		int flag = messageDao.messageSendInlist(dto);
		
		return flag;
	}
}