package edu.pry.city.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.pry.city.service.CityService;
import edu.pry.region.model.Region;
import edu.pry.region.service.RegionService;

@Controller
public class CityController {
	@Autowired
	private CityService cityService;
	@Autowired RegionService regionService;

	@RequestMapping("shop/registGroup")
	public String queryRegion(Map model) {
		List<Map<String, Object>> list = cityService.cityList();
		System.out.println(list);
		model.put("list", list);

		return "jsp/back/shop/regist";

	}

	@ResponseBody
	@RequestMapping("shop/registGroup/queryScondeCity")
	public Map<String, Object> querySecondCity(@RequestParam("id") Integer id) {

		Map<String, Object> map = new HashMap<>();
		List<Region> regionList = regionService.regionList(id);
//		sysout
		System.out.println(regionList);
		map.put("state", "ok");
		map.put("list", regionList);
		return map;
	}
}
