package com.dongne.user;

import java.util.List;
import java.util.Map;

public interface UserMapper {

	int duplicatedId(String id);

	int duplicatedEmail(String email);

	int create(UserDTO dto);

	int loginCheck(Map<String, String> map);

	String getGrade(String id);

	UserDTO read(String id);

	int update(UserDTO dto);

	int updateFile(Map map);

	int total(Map map);

	List<UserDTO> list(Map map);

}
