package edu.pry.type.service;

import java.util.List;
import java.util.Map;

import edu.pry.type.model.Type;

public interface TypeService {
	List<Type> typeList(Map<String,Object> map);

}
