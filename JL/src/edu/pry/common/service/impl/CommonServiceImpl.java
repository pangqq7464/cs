package edu.pry.common.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.pry.common.mapper.CommonMapper;
import edu.pry.common.model.Common;
import edu.pry.common.service.CommonService;
@Service
public class CommonServiceImpl implements CommonService{
	@Autowired
	private CommonMapper commonMapper;
	@Override
	public List<Common> commonListBySpecial(Integer common_specialty) {
	    List<Common> commonList = commonMapper.commonBySpecial(common_specialty);
	    
		return  commonList;
	}
	@Override
	public int add(Common common) {
		int result = commonMapper.add(common);
		return result;
	}
	@Override
	public int del(Integer common_id) {
		int result = commonMapper.del(common_id);
		return result;
	}
	@Override
	public Map<String, Object> commonListByOthers(Integer common_others,Map<String,Object> map) {
		List<Common> commonList = commonMapper.commonByOthers(common_others);

		map.put("commonList", commonList);
		return map;
	}
	@Override
	public int addRespondDo(Common common) throws ParseException {
		
		 SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		 String dateStr = sdf.format(new Date());
		 Date date = sdf.parse(dateStr);
		 common.setCommon_time(date);
		 int result = commonMapper.add(common);
		 System.out.println(common.getCommon_others());
		 
		 Common common1 = commonMapper.commonById(common.getCommon_others());
		 Map<String,Object> map = new HashMap<>();
		 int common_id = common1.getCommon_id();
		 System.out.println(common1.getCommon_count());
		 System.out.println(common1.getCommon_id());
		 int common_count = common1.getCommon_count()+1;
		 map.put("common_id", common_id);
		 map.put("common_count", common_count);
		 System.out.println(common_count);
		 commonMapper.updateCount(map);
		 return result;
	}
	@Override
	public Common commonById(Integer common_id) {
	    Common common = commonMapper.commonById(common_id);
		return common;
	}

}
