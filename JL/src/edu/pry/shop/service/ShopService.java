package edu.pry.shop.service;

import java.text.ParseException;
import java.util.List;
import java.util.Map;

import edu.pry.shop.model.Shop;

public interface ShopService {
		//分页查询
		Map<String , Object> shopList(Map<String , Object> map);
		//解锁
		Map<String , Object> updateStatus(Integer shop_id,Integer shop_status,Map<String , Object> map)throws ParseException;
		//注册门店
		Map<String,Object> registShop(Shop shop,Map<String,Object> map) throws ParseException;
	    //根据注册人查询门店信息
		List<Shop> selShopByRegister(String shop_register,Map<String,Object> map);
		//修改门店信息
		Map<String,Object> shopUpd(Shop shop,Map<String,Object> map) throws ParseException;
	    //根据id查询商店信息
		Shop shopDetail (Integer shop_id);
		
}
