package edu.pry.specialty.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import edu.pry.city.service.CityService;
import edu.pry.common.model.Common;
import edu.pry.common.service.CommonService;
import edu.pry.main.FilePath;
import edu.pry.main.PageBean;
import edu.pry.region.model.Region;
import edu.pry.region.service.RegionService;
import edu.pry.specialty.model.Specialty;
import edu.pry.specialty.service.SpecialtyService;
import edu.pry.type.model.Type;
import edu.pry.type.service.TypeService;
@Controller
public class SpecialtyController {
	@Autowired
	private SpecialtyService specialtyService;
	@Autowired
	private CityService cityService;
	@Autowired
	private TypeService typeService;
	@Autowired
	private RegionService regionService;
	@Autowired
	private CommonService commonService;
	
	
	 //分页查询
    @RequestMapping("back/specialtyList")
    public String userList(HttpServletRequest request,@RequestParam(required=false,defaultValue="1")int pages,@RequestParam(required=false,defaultValue="5")int record,Specialty specialty,Map<String,Object> map){
    	PageBean.backMap(map , pages , record , request,specialty);
    	System.out.println(specialty.getSpecialty_name()+"??????????????????????????????????");
    	map.put("specialty", specialty);
        map = specialtyService.specialtyList(map);
        List<Map<String, Object>> list = cityService.cityList();
		System.out.println(list);
		map.put("list", list);
        return "jsp/back/specialty/specialtyList";
    }
    
    //修改页面
    @RequestMapping("back/specialtyUpd")
    public String specialtyUpd(Integer specialty_id,Map<String,Object> map){
        Specialty specialty = specialtyService.specialtyById(specialty_id);
        map.put("specialty" ,specialty);
        List<Type> typeList = typeService.typeList(map);
        map.put("typeList", typeList);
        List<Map<String, Object>> list = cityService.cityList();
		System.out.println(list);
		map.put("list", list);
        return "jsp/back/specialty/specialtyUpd";
    }
  //修改特产信息
    @RequestMapping("back/specialtyUpdDo")
    public String specialtyUpdDo(Specialty specialty,Map<String,Object> map,HttpServletRequest request) throws ParseException{
    	System.out.println(specialty.getSpecialty_id()+"-------------------------------");
        map = specialtyService.updateSpecialty(specialty, map);
        return "jsp/back/main/message";
    }
    //添加特产页面
    @RequestMapping("back/specialtyAdd")
    public String specialtyAdd(Map<String,Object> map){
    	List<Type> typeList = typeService.typeList(map);
        map.put("typeList", typeList);
        List<Map<String, Object>> list = cityService.cityList();
		System.out.println(list);
		map.put("list", list);
        return "jsp/back/specialty/specialtyAdd";
    }
   
    //添加特产信息
    @RequestMapping("back/specialtyAddDo")
    public String goodsAddDo(Map<String,Object> map,Specialty specialty,MultipartFile photo) throws IllegalStateException, IOException, ParseException{
        System.err.println(specialty.getSpecialty_name());
        System.out.println(photo);
        System.out.println(specialty.getSpecialty_type());
        System.out.println(specialty.getSpecialty_localCity());
        System.out.println(specialty.getRegion());
        
        if(photo.getOriginalFilename()!=null&&photo.getOriginalFilename()!=""){
            String root = FilePath.FILEPATH;
            String real_name = photo.getOriginalFilename();
            String ext = FilenameUtils.getExtension(real_name);
            String newName = UUID.randomUUID().toString().replaceAll("-" , "")+"."+ext;
            //建立一个空文件
            File file = new File(root+"/"+newName);
            //把内容写入空的文件
            photo.transferTo(file);
            specialty.setSpecialty_img(newName);
            System.out.println("1231");
        }
        map.put("specialty", specialty);
        map = specialtyService.addSpecialty(specialty, map);
      
        return "jsp/back/main/message";
    }
    //后台特产信息删除
    @RequestMapping("back/specialtyDel")
    public String specialtyDel(Integer specialty_id,Map<String,Object> map,HttpServletRequest request) throws ParseException{
    	System.out.println(specialty_id+"-------------------------------");
        specialtyService.specialtyDel(specialty_id, map);
        return "jsp/back/main/message";
    }
   //前台根据特产地区查询
    @RequestMapping("before/specialtyListByLocal")
    public String specialtyListByLocal(Specialty specialty,Integer specialty_localCity,Map<String,Object> map,HttpServletRequest request) throws ParseException{
    	specialty.setSpecialty_localCity(specialty_localCity);
    	System.out.println(specialty.getSpecialty_name());
    	map.put("specialty", specialty);
    	List<Specialty> specialtyList = specialtyService.list(map);
    	map.put("specialtyList", specialtyList);
    	if(specialty_localCity!=null || specialty.getSpecialty_localCity() != null){
    		if(specialty_localCity!=null  ){
        		map.put("nowLocalCity", specialty_localCity);
        		
        	}else if(specialty.getSpecialty_localCity() != null){
        		map.put("nowLocalCity", specialty.getSpecialty_localCity());
        	}
    		List<Region> regionList = regionService.regionList(specialty_localCity) ;
    		map.put("regionList", regionList);
    	}
    	
    	List<Map<String, Object>> cityList = cityService.cityList();
    	map.put("cityList", cityList);
        return "jsp/before/specialty/specialtyList";
    }
    //前台特产详情查看
    @RequestMapping("before/singleSpecialty")
    public String singleSpecialty(Integer specialty_id,Map<String,Object> map,HttpServletRequest request) throws ParseException{
    	System.out.println(specialty_id+"-------------------------------");
        //查询地市列表
        List<Map<String, Object>> cityList = cityService.cityList();
    	map.put("cityList", cityList);
    	
    	//查询特产详情
    	Specialty specialty = specialtyService.specialtyById(specialty_id);
        map.put("specialty", specialty);
       
        //查询评论信息
        List<Common> commonList = commonService.commonListBySpecial(specialty_id);
        map.put("commonList", commonList);
        return "jsp/before/specialty/singleSpecialty";
    }
   //添加特产评论
    @RequestMapping("before/addCommon")
    public String addCommon(Common common,Map<String,Object> map,HttpServletRequest request) throws ParseException{
    
       int result = commonService.add(common);
        
       if(result>0){
    	   map.put("message", "评论成功");
    	   
       }else{
    	   map.put("message", "评论失败");
       }
        
     
     
        return "jsp/back/main/message";
    }
  //删除特产评论
    
    @ResponseBody
	@RequestMapping("before/delCommon")
	public Map<String, Object> delCommon(@RequestParam("id") Integer id) {

    	 Map<String, Object> map = new HashMap<>();
         int result = commonService.del(id);
         map.put("result", "1");
		return map;
      	   
	}
    //回复评论
    
    @RequestMapping("before/addResponse")
    public String addResponse(Integer common_id,Integer specialty_id,Map<String,Object> map,HttpServletRequest request) throws ParseException{
    
    	List<Map<String, Object>> cityList = cityService.cityList();
      	map.put("cityList", cityList);
      	
      	//查询特产详情
      	Specialty specialty = specialtyService.specialtyById(specialty_id);
        map.put("specialty", specialty);
        
        //查询该评价信息
        Common common = commonService.commonById(common_id);
        map.put("common", common);
        System.out.println(common_id);
        //查询回复信息
        map =  commonService.commonListByOthers(common_id, map);
        
        return "jsp/before/specialty/specialtyRespond";
    }
    
    @ResponseBody
	@RequestMapping("before/addResponseDo")
	public int addResponseDo(Common common) throws ParseException {
    	
         int result = commonService.addRespondDo(common);
		return result;	   
	}
  
    
   
}
