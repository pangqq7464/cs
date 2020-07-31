package edu.pry.specialty.service;

import java.text.ParseException;
import java.util.List;
import java.util.Map;

import edu.pry.specialty.model.Specialty;

public interface SpecialtyService {
	//分页查询
	Map<String , Object> specialtyList(Map<String , Object> map);
	//查询所有特产信息
    List<Specialty> list(Map<String,Object> mp);
	//修改特产信息
	Map<String , Object> updateSpecialty(Specialty specialty,Map<String,Object> map) throws ParseException;
	//根据id查询特产信息
	Specialty specialtyById(Integer specialty_id);
	//添加特产
    Map<String,Object> addSpecialty(Specialty specialty,Map<String,Object> map) throws ParseException;
    //删除特产信息
    Map<String,Object> specialtyDel(Integer specialty_id,Map<String,Object> map);
}
