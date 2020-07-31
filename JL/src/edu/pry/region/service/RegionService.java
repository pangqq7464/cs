package edu.pry.region.service;



import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import edu.pry.region.model.Region;

@Service
public interface RegionService {
	List<Region> regionList(Integer region_city);
	
}
