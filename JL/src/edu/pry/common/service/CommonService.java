package edu.pry.common.service;

import java.text.ParseException;
import java.util.List;
import java.util.Map;

import edu.pry.common.model.Common;

public interface CommonService {
	List<Common> commonListBySpecial(Integer common_specialty);
	Map<String,Object> commonListByOthers(Integer common_others,Map<String,Object> map);
	int add(Common common);
	int del(Integer common_id);
	int addRespondDo(Common common) throws ParseException;
	Common commonById(Integer common_id);
	
}
