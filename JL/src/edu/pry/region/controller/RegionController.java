package edu.pry.region.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.pry.region.model.Region;
import edu.pry.region.service.RegionService;

@Controller
public class RegionController {
	@Autowired
	private RegionService regionService;
	
	@RequestMapping("/queryRegion")
	@ResponseBody
	public List<Region> queryRegion(Integer region_city){
			List<Region> list = regionService.regionList(region_city);
			return list;
		
	}
}
