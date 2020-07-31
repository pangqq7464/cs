package edu.pry.user.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import edu.pry.main.PageBean;
import edu.pry.user.mapper.UserMapper;
import edu.pry.user.model.User;
import edu.pry.user.service.UserService;
@Service
public class UserServiceImpl implements UserService{
	@Autowired
	private UserMapper userMapper;
	@Override
	public Map<String, Object> login(Map<String, Object> map, HttpServletRequest request) {
		User user = userMapper.login(map);
		System.out.println(user.getUser_account()+"+++++++++++++++++++++++++++++++++++");
		//判断账号是否有效
		if(user.getUser_status()==0){
			if(user!=null){
				//判断是前台登录还是后台登录
				if(map.get("action").toString().equals("1")){
					HttpSession session = request.getSession();
					session.removeAttribute("user");
					session.setAttribute("user", user);
					map.put("url", "jsp/before/main/main");
				}else{
					HttpSession session = request.getSession();
					session.removeAttribute("user");
					session.setAttribute("user", user);
					if(user.getRole_id()==1){
						map.put("url", "jsp/back/main/main1");
					}else{
						map.put("url", "jsp/back/main/main");	
					}
				}
				
			}else{
				map.put("message", "账号或密码错误");
				map.put("url", "jsp/back/login/login");
			}
			
		}else{
			map.put("message", "账号已锁，请联系管理员解锁");
			map.put("url", "jsp/back/login/login");
		}
		
		return map;
	}
	@Override
    public Map<String , Object> userList(Map<String , Object> map ) {
        List<User> userList = userMapper.userList(map);
        Integer count = userMapper.count(map);
        System.out.println(userList.get(0).getCreateDate());
        PageBean.bfMap(map , count , userList , User.class);
        return map;
    }
	@Override
	public User loginDetail(Integer user_id) {
		return userMapper.loginDetail(user_id);
	}
	@Override
	public Map<String, Object> update(Map<String, Object> map, User user) throws ParseException {
		 SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		 String dateStr = sdf.format(new Date());
		 Date date = sdf.parse(dateStr);
		 user.setUpdateDate(date);
		 int result = userMapper.update(user);
	     if(result>0){
	    	 map.put("message" , "修改成功");
	     }else {
	         map.put("message" , "修改失败");
	     }
	     return map;
	}
	@Override
	public Map<String, Object> updatePass(User user,String password,String new_password,Map<String,Object> map) throws ParseException {
		System.out.println(user.getUser_password());
		System.out.println(user.getUser_id());
		if(user.getUser_password().equals(password)){
			 if(password.equals(new_password)){
				 map.put("message" , "新密码不得与旧密码相同，修改失败");
			 }else{
				 SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				 String dateStr = sdf.format(new Date());
				 Date date = sdf.parse(dateStr);
				 user.setUser_password(new_password);
				 
				 int result = userMapper.update(user);
			     if(result>0){
			    	 map.put("message" , "修改成功，请重新登录");
			     }else {
			         map.put("message" , "修改失败");
			     }
			 }
		 }else{
			 map.put("message" , "旧密码输入错误，请重新输入");
		 }
		 
		return map;
	}
	@Override
	public Map<String, Object> add(Map<String, Object> map, User user,String check_password) throws ParseException {
		System.out.println(user.getUser_account());
		Map<String,Object> userMap= userMapper.selUserByAccount(user.getUser_account());
		System.out.println(userMap);
		if(userMap==null){
			if(user.getUser_password().equals(check_password)){	
				 SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				 String dateStr = sdf.format(new Date());
				 Date date = sdf.parse(dateStr);
				 user.setCreateDate(date);
				int result = userMapper.add(user);
		        if(result>0){
		            map.put("url", "jsp/before/login/login");
		        }else {
		            map.put("message" , "添加失败");
		            map.put("url", "jsp/back/main/message");
		        }
			 }else{
				 map.put("message" , "密码不一致");
		         map.put("url", "jsp/back/main/message");
			 } 
		}else{
			 map.put("message" , "账号已存在");
	         map.put("url", "jsp/back/main/message");
		 }
		
		
        return map;
	}
	@Override
	public Map<String, Object> updateStatus(Integer user_id, Integer user_status, Map<String, Object> map){
	    Map<String,Object> userMap = new HashMap<>();
	    userMap.put("user_id", user_id);
		if(user_status==0){
			userMap.put("user_status", 1);
			int result = userMapper.updateStatus(userMap);
			if(result>0){
				map.put("message" , "加锁成功");
			}else{
				map.put("message" , "加锁失败");
			}
		}else{
			userMap.put("user_status", 0);
			int result = userMapper.updateStatus(userMap);
			if(result>0){
				map.put("message" , "解锁成功");
			}else{
				map.put("message" , "解锁失败");
			}
		}
		return map;
	}

}
