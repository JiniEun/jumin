package com.dongne.user;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("com.dongne.user.UserServiceImpl")
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper mapper;
	
	@Override
	public int duplicatedId(String id) {
		// TODO Auto-generated method stub
		return mapper.duplicatedId(id);
	}

	@Override
	public int duplicatedEmail(String email) {
		// TODO Auto-generated method stub
		return mapper.duplicatedEmail(email);
	}

	@Override
	public int create(UserDTO dto) {
		// TODO Auto-generated method stub
		return mapper.create(dto);
	}

	@Override
	public int loginCheck(Map<String, String> map) {
		// TODO Auto-generated method stub
		return mapper.loginCheck(map);
	}

	@Override
	public String getGrade(String id) {
		// TODO Auto-generated method stub
		return mapper.getGrade(id);
	}

	@Override
	public UserDTO read(String id) {
		// TODO Auto-generated method stub
		return mapper.read(id);
	}

	@Override
	public int update(UserDTO dto) {
		// TODO Auto-generated method stub
		return mapper.update(dto);
	}

	@Override
	public int updateFile(Map map) {
		// TODO Auto-generated method stub
		return mapper.updateFile(map);
	}

	@Override
	public int total(Map map) {
		// TODO Auto-generated method stub
		return mapper.total(map);
	}

	@Override
	public List<UserDTO> list(Map map) {
		// TODO Auto-generated method stub
		return mapper.list(map);
	}

	@Override
	public int delete(String ID) {
		// TODO Auto-generated method stub
		return mapper.delete(ID);
	}

	@Override
	public int password(Map map) {
		// TODO Auto-generated method stub
		return mapper.password(map);
	}

}
