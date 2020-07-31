package edu.pry.common.mapper;

import java.util.List;
import java.util.Map;

import edu.pry.common.model.Common;

public interface CommonMapper {
	List<Common> commonBySpecial(Integer common_specialty);
	List<Common> commonByOthers(Integer common_others);
	int add(Common common);
	int del(Integer common_id);
	int updateCount(Map<String,Object> map);
	Common commonById(Integer common_id);
}
