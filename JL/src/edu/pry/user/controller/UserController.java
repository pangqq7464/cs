package edu.pry.user.controller;

import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import edu.pry.city.model.City;
import edu.pry.city.service.CityService;
import edu.pry.main.PageBean;
import edu.pry.specialty.model.Specialty;
import edu.pry.specialty.service.SpecialtyService;
import edu.pry.user.model.User;
import edu.pry.user.service.UserService;
@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	@Autowired
	private CityService cityService;
	@Autowired
	private SpecialtyService specialtyService;
	 //前台登录页面
    @RequestMapping("back/login")
    public String login(){
        return "jsp/before/login/login";
    }
  //前台登录
    @RequestMapping("back/loginDo")
    public String loginDo(@RequestParam(required = false)String user_account,String user_password,HttpServletRequest request,Map<String,Object> map,Specialty specialty){
        map.put("user_account", user_account);
        map.put("user_password", user_password);
        System.out.println();
        map.put("action", "1");
    	userService.login(map, request);
    	
        List<Specialty> specialtyList = specialtyService.list(map);
    	map.put("specialtyList", specialtyList);
    	List<Map<String, Object>> cityList = cityService.cityList();
    	map.put("cityList", cityList);
    	
    	return map.get("url").toString();
    }
    //后台登录页面
    @RequestMapping("back/loginH")
    public String loginH(){
        return "jsp/back/login/login";
    }
    //后台登录
    @RequestMapping("back/loginDoH")
    public String loginDoH(@RequestParam(required = false)String user_account,String user_password,HttpServletRequest request){
        Map<String,Object> map = new HashMap<>();
        map.put("user_account", user_account);
        map.put("user_password", user_password);
        System.out.println();
        map.put("action", "2");
    	userService.login(map, request);
    	return map.get("url").toString();
    }
    //登出
    @RequestMapping("bf/loginOut")
    public String loginOut(HttpServletRequest request){
    	HttpSession session = request.getSession();
    	session.removeAttribute("user");
        return "jsp/before/main/main";
    }
    //注册
    @RequestMapping("back/regist")
    public String regist(){
        return "jsp/back/user/regist";
    }
  //前台主页
    @RequestMapping("before/main")
    public String main(Map<String,Object> map,Specialty specialty){

    	List<Specialty> specialtyList = specialtyService.list(map);
    	map.put("specialtyList", specialtyList);
    	List<Map<String, Object>> cityList = cityService.cityList();
    	map.put("cityList", cityList);
        return "jsp/before/main/main";
    }
  //后台主页
    @RequestMapping("back/sMain")
    public String mainB(){
        return "jsp/back/main/main1";
    }
    //添加用户
    @RequestMapping("back/add")
    public String add(Map<String,Object> map,User user,@RequestParam String check_password) throws ParseException{
    	userService.add(map, user,check_password);
    	return map.get("url").toString();
    }
    
  //分页查询
    @RequestMapping("back/userList")
    public String userList(HttpServletRequest request,@RequestParam(required=false,defaultValue="1")int pages,@RequestParam(required=false,defaultValue="5")int record,User user,Map<String,Object> map){
    	PageBean.backMap(map , pages , record , request,user);
    	user.setRole_id(2);
    	map.put("user", user);
    	System.out.println(user.getUser_name()+"??????????????????");
        map = userService.userList(map);
        return "jsp/back/user/userList";
    }
    //通过Id查询一条数据
    @RequestMapping("back/loginDetail")
    public String loginDetail(HttpServletRequest request,@RequestParam(required=false)Integer user_id,Map<String,Object> map){
        User user = userService.loginDetail(user_id);
        map.put("user", user);
        return "jsp/back/user/selUser";
    }
    
  //修改页面
    @RequestMapping("back/userUpd")
    public String userUpd(Integer user_id,Map<String,Object> map){
        User user = userService.loginDetail(user_id);
        map.put("user" , user);
        return "jsp/back/user/personUpd";
    }
  //修改个人资料
    @RequestMapping("back/userUpdDo")
    public String userUpdDo(User user,Map<String,Object> map,HttpServletRequest request) throws ParseException{
         userService.update(map,user);
        return "jsp/back/main/message";
    }
    //修改密码页面
    @RequestMapping("back/userUpdPass")
    public String userUpdPass(Integer user_id,Map<String,Object> map){
    	User user = userService.loginDetail(user_id);
        map.put("user" , user);
        return "jsp/back/user/passUpd";
    }
    //修改密码
    @RequestMapping("back/userUpdPassDo")
    public String userPassUpd(User user,@RequestParam(required=false)String password,String new_password,Map<String,Object> map,HttpServletRequest request) throws ParseException{
        System.out.println(password+"????????????"+user.getUser_password()+user.getUser_id());
        userService.updatePass(user,password,new_password,map);
        return "jsp/back/main/message";
    }
    //用户解锁
    @RequestMapping("back/userUpdStatus")
    public String userUpdStatus(Integer user_id,Integer user_status ,Map<String,Object> map,HttpServletRequest request) throws ParseException{
        System.out.println(user_id+user_status);
    	userService.updateStatus(user_id,user_status,map);
        return "jsp/back/main/message";
    }
}
