package com.dongne.message;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MessageController {

	@Autowired
	@Qualifier("com.dongne.message.MessageServiceImpl")
	private MessageService service;

	@RequestMapping(value = "/message/list", method = { RequestMethod.POST })
	@ResponseBody
	public Map<String, Object> findMessageList(@ModelAttribute("dto") MessageDTO dto, HttpServletRequest req,
			HttpServletResponse resp, ModelMap model) {
		System.out.println(dto);
		List<MessageDTO> msg_result = service.findList(dto.getID());
		Map<String, Object> result = new HashMap<>();
		result.put("result", msg_result);
		return result;
	}

	@RequestMapping(value = "/message/message_proc")
	public void addMessageSend(@RequestParam String flag, @ModelAttribute("dto") MessageDTO dto,
			HttpServletRequest req) {
		switch (flag) {
		case "insert":
			service.insertMessage(dto);
			break;
		}
	}
}