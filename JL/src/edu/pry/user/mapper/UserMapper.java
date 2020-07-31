package edu.pry.user.mapper;

import java.util.List;
import java.util.Map;

import edu.pry.user.model.User;

public interface UserMapper {
	
	User login(Map<String,Object> map);
	User loginDetail(Integer user_id);
	Map<String,Object> selUserByAccount(String user_account);
	Map<String,Object> selRegisterByAccount(String user_account);
	
	List<User> userList(Map<String , Object> map);
	int count(Map<String , Object> map);
	int update(User user);
	int updateStatus(Map<String,Object> map);
	int add(User user);
}
