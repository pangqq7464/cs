package edu.pry.region.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.pry.region.mapper.RegionMapper;
import edu.pry.region.model.Region;
import edu.pry.region.service.RegionService;

@Service
public class RegionServiceImpl implements RegionService{
	@Autowired
	private RegionMapper regionMapper;

	@Override
	public List<Region> regionList(Integer region_city) {
		List<Region> list= regionMapper.selRegionByCity(region_city);
		
		return list;
	}
	

}
