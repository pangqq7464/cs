package edu.pry.city.service.impl;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import edu.pry.city.mapper.CityMapper;
import edu.pry.city.service.CityService;


@Service
public class CityServiceImpl implements CityService{
	@Autowired
	private CityMapper cityMapper;

	@Override
	public List<Map<String, Object>> cityList() {
		List<Map<String, Object>> cityList = cityMapper.cityList();
		return cityList;
	}


}
