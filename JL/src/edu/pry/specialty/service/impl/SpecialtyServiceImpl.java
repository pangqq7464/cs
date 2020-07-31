package edu.pry.specialty.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.pry.main.PageBean;
import edu.pry.specialty.mapper.SpecialtyMapper;
import edu.pry.specialty.model.Specialty;
import edu.pry.specialty.service.SpecialtyService;
import edu.pry.user.model.User;
@Service
public class SpecialtyServiceImpl implements SpecialtyService{
    @Autowired
    private SpecialtyMapper specialtyMapper;
	@Override
	public Map<String, Object> specialtyList(Map<String, Object> map) {
		    Specialty specialty = (Specialty) map.get("specialty");
		    System.out.println(specialty.getSpecialty_name());
		    System.out.println(specialty.getSpecialty_localCity());
		    System.out.println(specialty.getSpecialty_localRegion());
		    List<Specialty> specialtyList = specialtyMapper.specialtyList(map);
//		    System.out.println(specialtyList.get(0).getSpecialty_localCity()+"?????????????????????????????????");
	        Integer count = specialtyMapper.count(map);
//	        System.out.println(specialtyList.get(0));
	        PageBean.bfMap(map , count , specialtyList , Specialty.class);
	        return map;
	}
	@Override
	public Map<String, Object> updateSpecialty(Specialty specialty,Map<String, Object> map) throws ParseException {
		 SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		 String dateStr = sdf.format(new Date());
		 Date date = sdf.parse(dateStr);
		 specialty.setUpdateDate(date);
		 System.out.println(specialty.getSpecialty_img()+"-------------------------------------");
		 System.out.println(specialty.getSpecialty_name()+"-------------------------------------");
		 System.out.println(specialty.getSpecialty_localCity()+"-------------------------------------");
		 System.out.println(specialty.getSpecialty_localRegion()+"-------------------------------------");
		 System.out.println(specialty.getSpecialty_id()+"-------------------------------------");
		 System.out.println(specialty.getType()+"-------------------------------------");
		 System.out.println(specialty.getUpdateDate()+"-------------------------------------");
		
		int result = specialtyMapper.update(specialty);
		if(result>0){
			map.put("message", "修改成功");
		}else{
			map.put("message", "修改失败");
		}
		return map;
	}
	@Override
	public Specialty specialtyById(Integer specialty_id) {
		Specialty specialty = specialtyMapper.specialtyById(specialty_id);
		System.out.println(specialty.getSpecialty_name()+"_____________________________________");
		return specialty;
	}
	@Override
	public Map<String, Object> addSpecialty(Specialty specialty, Map<String, Object> map) throws ParseException {
		SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		 String dateStr = sdf.format(new Date());
		 Date date = sdf.parse(dateStr);
		 specialty.setCreateDate(date);
		int result = specialtyMapper.add(specialty);
		if(result>0){
			map.put("message", "添加成功");
		}else{
			map.put("message", "添加失败");
		}
		return map;
	}
	@Override
	public Map<String, Object> specialtyDel(Integer specialty_id,Map<String,Object> map) {
		int result = specialtyMapper.del(specialty_id);
		if(result>0){
			map.put("message", "删除成功");
		}else{
			map.put("message", "删除失败");
		}
		return map;
	}
	@Override
	public List<Specialty> list(Map<String,Object> map) {
		List<Specialty> specialtyList = specialtyMapper.list(map);
		return specialtyList;
	}

}
