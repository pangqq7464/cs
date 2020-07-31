package edu.pry.user.service;

import java.text.ParseException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.RequestParam;

import edu.pry.user.model.User;

public interface UserService {
	//登录
	Map<String , Object> login(Map<String,Object> map,HttpServletRequest request);
	//分页查询
	Map<String , Object> userList(Map<String , Object> map);
	//通过Id查询一条数据
	User loginDetail(Integer user_id);
	//修改个人信息
	Map<String , Object> update(Map<String , Object> map,User user)throws ParseException;
	//修改密码
	Map<String , Object> updatePass(User user,String password,String new_password,Map<String,Object> map)throws ParseException;
	//注册（添加用户）
	Map<String , Object> add( Map<String , Object> map,User user,String check_password) throws ParseException;
	Map<String , Object> updateStatus(Integer user_id,Integer user_status,Map<String , Object> map)throws ParseException;
}
