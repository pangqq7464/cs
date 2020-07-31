package edu.pry.goods.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.pry.goods.mapper.GoodsMapper;
import edu.pry.goods.model.Goods;
import edu.pry.goods.service.GoodsService;
import edu.pry.main.PageBean;
import edu.pry.shop.model.Shop;
@Service
public class GoodsServiceImpl implements GoodsService{
    @Autowired
    private GoodsMapper goodsMapper;
    //分页查询
	@Override
	public Map<String, Object> goodsList(Map<String, Object> map) {
		List<Map<String,Object>> goodsList = goodsMapper.goodsList(map);
		System.out.println(goodsList);
	    Integer count = goodsMapper.count(map);
	    System.out.println(count+"=============");
	    PageBean.bfMap(map , count , goodsList , Goods.class);
	    return map;
	}
    //修改商品信息
	@Override
	public Map<String, Object> update(Goods goods, Map<String, Object> map) throws ParseException {
		SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String dateStr = sdf.format(new Date());
		Date date = sdf.parse(dateStr);
		goods.setUpdateTime(date);
		int result = goodsMapper.update(goods);
		if(result>0){
			map.put("message", "修改成功");
		}else{
			map.put("message", "修改失败");
		}
		
		return map;
	}

	@Override
	public Goods selGoodsById(Integer goods_id) {
		Goods goods = goodsMapper.selGoodsById(goods_id);
		return goods;
	}

	@Override
	public Map<String, Object> delGoods(Integer goods_id,Map<String,Object> map) {
		int result = goodsMapper.delGoods(goods_id);
		if(result>0){
			map.put("message", "删除成功");
		}else{
			map.put("message", "删除失败");
		}
		return map;
	}
	@Override
	public Map<String, Object> addGoods(Goods goods, Map<String, Object> map) throws ParseException {
		SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String dateStr = sdf.format(new Date());
		Date date = sdf.parse(dateStr);
		goods.setCreateTime(date);
		
		int result = goodsMapper.addGoods(goods);
		if(result>0){
			map.put("message", "添加成功");
		}else{
			map.put("message", "添加失败");
		}
		return map;
	}
	
	
	@Override
	public Map<String, Object> selGoodsByGoodsName(String goods_name, Map<String, Object> map) {
		List<Goods> goodsList = goodsMapper.selGoodsByGoodsName(goods_name);
		map.put("goodsList", goodsList);
		return map;
	}
	@Override
	public Map<String, Object> selGoodsByShop(Integer goods_shop, Map<String, Object> map) {
		List<Goods> goodsList = goodsMapper.selGoodsByShop(goods_shop);
		map.put("goodsList", goodsList);
		return map;
	}
	

}
