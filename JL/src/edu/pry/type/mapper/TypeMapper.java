package edu.pry.type.mapper;

import java.util.List;
import java.util.Map;

import edu.pry.type.model.Type;

public interface TypeMapper {
	Map<String,Object> typeMap(Integer type_id);
	List<Type> typeList(Map<String,Object> map);

}
