package edu.pry.goods.controller;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import edu.pry.city.model.City;
import edu.pry.city.service.CityService;
import edu.pry.goods.model.Goods;
import edu.pry.goods.service.GoodsService;
import edu.pry.main.FilePath;
import edu.pry.main.PageBean;
import edu.pry.shop.model.Shop;
import edu.pry.shop.service.ShopService;
import edu.pry.user.model.User;

@Controller
public class GoodsController {
      @Autowired
      private GoodsService goodsService;
      @Autowired
      private ShopService shopService;
      @Autowired
      private CityService cityService;
	  //分页查询
	    @RequestMapping("goods/goodsList")
	    public String shopDetailList(HttpServletRequest request,String user_account,@RequestParam(required=false,defaultValue="1")int pages,@RequestParam(required=false,defaultValue="5")int record,Goods goods,Map<String,Object> map){
	        PageBean.backMap(map , pages , record , request,goods);
	        System.out.println(user_account+"=======================");
	    	map.put("goods", goods);
	    	System.out.println(goods.getGoods_shop());
	    	System.out.println(goods.getGoods_name());
	    	String account = user_account;
	    	
	    	map.put("shop_register",account );
	    	map = goodsService.goodsList(map);
	    	List<Shop> shopList = shopService.selShopByRegister(account, map);
	    	map.put("shopList", shopList);
	        return "jsp/back/goods/goodsList";
	    }
	    
	    //修改页面
	    @RequestMapping("goods/goodsUpd")
	    public String goodsUpd(Integer goods_id,Map<String,Object> map) {
	        System.out.println(goods_id);
	        
	        Goods goods = goodsService.selGoodsById(goods_id);
	        map.put("goods", goods);
	        return "jsp/back/goods/goodsUpd";
	    }
	    //修改商品信息
	    @RequestMapping("goods/goodsUpdDo")
	    public String goodsUpdDo(Goods goods,Map<String,Object> map) throws ParseException{
	    	System.out.println(goods.getGoods_des());
	    	map = goodsService.update(goods, map);
	        
	        return "jsp/back/main/message";
	    }
	  //删除商品信息
	    @RequestMapping("goods/goodsDel")
	    public String goodsDel(Integer goods_id,Map<String,Object> map) throws ParseException{
	    	System.out.println(goods_id);
	    	map = goodsService.delGoods(goods_id, map);
	        
	        return "jsp/back/main/message";
	    }
	    //添加页面
	    @RequestMapping("goods/goodsAdd")
	    public String goodsAdd(Map<String,Object> map,HttpSession session) throws ParseException{
	    	
	    	User user = (User) session.getAttribute("user");
	    	if(user.getUser_account()==null){
	    		map.put("message", "登录失效！请重新登录");
	    		map.put("url", "jsp/back/main/message");
	    	}else{
	    		String user_account = user.getUser_account();
		    	List<Shop> shopList = shopService.selShopByRegister(user_account, map);
		        map.put("shopList", shopList);
		        map.put("url", "jsp/back/goods/goodsAdd");
	    	}
	    	
	        return map.get("url").toString();
	    }
	    
	    //添加商品
	    @RequestMapping("goods/goodsAddDo")
	    public String goodsAddDo(Map<String,Object> map,Goods goods,MultipartFile photo) throws IllegalStateException, IOException, ParseException{
	        
	        System.out.println("=================================================================");
	        if(photo.getOriginalFilename()!=null&&photo.getOriginalFilename()!=""){
	            String root = FilePath.FILEPATH;
	            String real_name = photo.getOriginalFilename();
	            String ext = FilenameUtils.getExtension(real_name);
	            String newName = UUID.randomUUID().toString().replaceAll("-" , "")+"."+ext;
	            //建立一个空文件
	            File file = new File(root+"/"+newName);
	            //把内容写入空的文件
	            photo.transferTo(file);
	            goods.setGoods_img(newName);
	            System.out.println("1231");
	        }
	        map.put("goods", goods);
	        map = goodsService.addGoods(goods, map);
	      
	        return "jsp/back/main/message";
	    }
	    @RequestMapping("goods/selGoodsByShop")
	    public String selGoodsByShop(Integer goods_shop,Map<String,Object> map) throws ParseException{
	    	System.out.println(goods_shop);
	    	
	    	List<Map<String, Object>> cityList = cityService.cityList();
	    	map.put("cityList", cityList);
	    	Shop shop = shopService.shopDetail(goods_shop);
	    	String shop_name = shop.getShop_name();
	    	map.put("shop_name",shop_name);
	    	map = goodsService.selGoodsByShop(goods_shop, map);
	        return "jsp/before/goods/goodsList";
	    }
	    
}
