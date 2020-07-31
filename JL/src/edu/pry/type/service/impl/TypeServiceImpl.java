package edu.pry.type.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.pry.type.mapper.TypeMapper;
import edu.pry.type.model.Type;
import edu.pry.type.service.TypeService;
@Service
public class TypeServiceImpl implements TypeService{
	@Autowired
	private TypeMapper typeMapper;
	@Override
	public List<Type> typeList(Map<String, Object> map) {
		List<Type> typeList = typeMapper.typeList(map);
		return typeList;
	}

}
