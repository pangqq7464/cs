package edu.pry.city.mapper;

import java.util.List;

import java.util.Map;

import edu.pry.city.model.City;



public interface CityMapper {
	public List<Map<String,Object>> cityList();
	City cityById(Integer city_id);
	
}
