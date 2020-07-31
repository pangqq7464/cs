package edu.pry.region.mapper;

import java.util.List;

import edu.pry.city.model.City;
import edu.pry.region.model.Region;

public interface RegionMapper {
	//根据市级编码查询所有区域
	List<Region>  selRegionByCity (Integer region_city);
	Region regionById(Integer region_id);

}
