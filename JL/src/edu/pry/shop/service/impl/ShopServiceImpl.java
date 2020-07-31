package edu.pry.shop.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.pry.main.PageBean;
import edu.pry.shop.mapper.ShopMapper;
import edu.pry.shop.model.Shop;
import edu.pry.shop.service.ShopService;
import edu.pry.shop.model.Shop;
@Service
public class ShopServiceImpl implements ShopService{
    @Autowired
    private ShopMapper shopMapper;
	@Override
	public Map<String, Object> shopList(Map<String, Object> map) {
		 List<Shop> shopList = shopMapper.shopList(map);
		 
		 System.out.println(shopList.get(0).getCity().getCity_name()+"!!!!!!!!!!!!!!!!!!!!!");
	     Integer count = shopMapper.count(map);
	     PageBean.bfMap(map , count , shopList , Shop.class);
	     return map;
	}
	@Override
	public Map<String, Object> updateStatus(Integer shop_id, Integer shop_status, Map<String, Object> map) throws ParseException{
		Map<String,Object> shopMap = new HashMap<>();
		SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		 String dateStr = sdf.format(new Date());
		 Date date = sdf.parse(dateStr);
		 shopMap.put("updateDate", date);
	    shopMap.put("shop_id", shop_id);
		if(shop_status==0){
			shopMap.put("shop_status", 1);
			int result = shopMapper.updateStatus(shopMap);
			if(result>0){
				map.put("message" , "加锁成功");
			}else{
				map.put("message" , "加锁失败");
			}
		}else{
			shopMap.put("shop_status", 0);
			int result = shopMapper.updateStatus(shopMap);
			if(result>0){
				map.put("message" , "解锁成功");
			}else{
				map.put("message" , "解锁失败");
			}
		}
		return map;
	}
	@Override
	public Map<String, Object> registShop(Shop shop, Map<String, Object> map) throws ParseException {
		SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		 String dateStr = sdf.format(new Date());
		 Date date = sdf.parse(dateStr);
		 shop.setUpdateDate(date);
		int result = shopMapper.add(shop);
		if(result>0){
			map.put("message", "注册成功");
		}else{
			map.put("message", "注册失败");
		}
		return map;
	}
	@Override
	public List<Shop> selShopByRegister(String shop_register,Map<String,Object> map) {
		List<Shop> shopList = shopMapper.selshopByAccount(shop_register);
		return shopList;
	}
	@Override
	public Map<String, Object> shopUpd(Shop shop, Map<String, Object> map) throws ParseException {
		 SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		 String dateStr = sdf.format(new Date());
		 Date date = sdf.parse(dateStr);
		 shop.setUpdateDate(date);
		int result = shopMapper.update(shop); 
		if(result>0){
			map.put("message", "修改成功");
		}else{
			map.put("message", "修改失败");
		}
		return map;
	}
	@Override
	public Shop shopDetail(Integer shop_id) {
		Shop shop =  shopMapper.shopDetail(shop_id);
		return shop;
	}
	

}
