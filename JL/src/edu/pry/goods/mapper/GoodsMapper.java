package edu.pry.goods.mapper;

import java.util.List;
import java.util.Map;

import edu.pry.goods.model.Goods;
import edu.pry.shop.model.Shop;
import edu.pry.user.model.User;

public interface GoodsMapper {
	//分页查询
	List<Map<String,Object>> goodsList(Map<String,Object> map);
    int count(Map<String , Object> map);
    int update(Goods goods);
    Goods selGoodsById(Integer goods_id);
    int delGoods(Integer goods_id);
    int addGoods(Goods goods);
    List<Goods>  selGoodsByGoodsName(String goods_name);
    List<Goods> selGoodsByShop(Integer goods_shop);
 /*   //修改商店锁状态
	int updateStatus(Map<String,Object> map);
	//添加商铺
	int add(Shop shop);
	//根据注册人查看商铺
	List<Shop> selshopByAccount(String shop_register);
	//修改门店信息
	int update(Shop shop);
	//根据id查询商铺信息
	Shop shopDetail(Integer shop_id);
    
	User login(Map<String,Object> map);
	User loginDetail(Integer user_id);
	Map<String,Object> selUserByAccount(String user_account);
	List<User> userList(Map<String , Object> map);
	*/
    
	
}
