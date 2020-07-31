package edu.pry.goods.service;

import java.text.ParseException;
import java.util.Map;

import edu.pry.goods.model.Goods;

public interface GoodsService {
	Map<String,Object> goodsList(Map<String,Object> map);
	Map<String,Object> update(Goods goods,Map<String,Object> map) throws ParseException;
	Goods selGoodsById(Integer goods_id);
	Map<String,Object> delGoods(Integer goods_id,Map<String, Object> map);
    Map<String,Object> addGoods(Goods goods,Map<String,Object> map) throws ParseException;
    Map<String,Object> selGoodsByGoodsName(String goods_name,Map<String,Object> map);
    Map<String,Object> selGoodsByShop(Integer goods_shop,Map<String,Object> map);
}
