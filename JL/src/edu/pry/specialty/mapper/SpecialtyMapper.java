package edu.pry.specialty.mapper;

import java.util.List;
import java.util.Map;

import edu.pry.specialty.model.Specialty;

public interface SpecialtyMapper {
	List<Specialty > specialtyList(Map<String,Object> map);
	int count(Map<String , Object> map);
	int update(Specialty specialty);
    Specialty specialtyById (Integer specialty_id);
    int add(Specialty specialty);
    int del(Integer specialty_id);
    List<Specialty> list(Map<String,Object> map) ;


}
