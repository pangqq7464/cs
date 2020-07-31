package edu.pry.shop.mapper;

import java.util.List;
import java.util.Map;

import edu.pry.shop.model.Shop;
import edu.pry.user.model.User;

public interface ShopMapper {
	//分页查询
	List<Shop> shopList(Map<String,Object> map);
    int count(Map<String , Object> map);
    //修改商店锁状态
	int updateStatus(Map<String,Object> map);
	//添加商铺
	int add(Shop shop);
	//根据注册人查看商铺
	List<Shop> selshopByAccount(String shop_register);
	//修改门店信息
	int update(Shop shop);
	//根据id查询商铺信息
	Shop shopDetail(Integer shop_id);
   
	
}
