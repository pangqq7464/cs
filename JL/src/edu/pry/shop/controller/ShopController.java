package edu.pry.shop.controller;

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
import org.springframework.ui.Model;
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
public class ShopController {
	  @Autowired
	  private ShopService shopService;
	  @Autowired
	  private GoodsService goodsService;
	  @Autowired
	  private CityService cityService;
	  //分页查询
	    @RequestMapping("shop/shopDetailList")
	    public String shopDetailList(HttpServletRequest request,@RequestParam(required=false,defaultValue="1")int pages,@RequestParam(required=false,defaultValue="5")int record,Shop shop,Map<String,Object> map){
	    	PageBean.backMap(map , pages , record , request,shop);
	    	map.put("shop", shop);
	        map = shopService.shopList(map);
	        return "jsp/back/shop/shopList";
	    }
		  //修改商店展示状态
	    @RequestMapping("shop/updateStatus")
	    public String shopUpdStatus(Integer shop_id,Integer shop_status ,Map<String,Object> map,HttpServletRequest request) throws ParseException{
	        System.out.println(shop_id+shop_status);
	    	shopService.updateStatus(shop_id,shop_status,map);
	        return "jsp/back/main/message";
	    }
	    //门店注册
	    @RequestMapping("shop/Regist")
	    public String goodsAddDo(Map<String,Object> map,Shop shop,MultipartFile photo) throws IllegalStateException, IOException, ParseException{
	        System.err.println(shop.getShop_city());
	        System.out.println(shop.getShop_region());
	        System.out.println(photo);
	        
	        if(photo.getOriginalFilename()!=null&&photo.getOriginalFilename()!=""){
	            String root = FilePath.FILEPATH;
	            String real_name = photo.getOriginalFilename();
	            String ext = FilenameUtils.getExtension(real_name);
	            String newName = UUID.randomUUID().toString().replaceAll("-" , "")+"."+ext;
	            //建立一个空文件
	            File file = new File(root+"/"+newName);
	            //把内容写入空的文件
	            photo.transferTo(file);
	            shop.setShop_img(newName);
	            System.out.println("1231");
	        }
	        map.put("shop", shop);
	        map = shopService.registShop(shop, map);
	      
	        return "jsp/back/main/message";
	    }
	    //根据注册人查看商店
	    @RequestMapping("shop/selShopByregister")
	    public String selShopByregister(HttpServletRequest request,HttpSession session,Map<String,Object> map){
	    	User user = (User) session.getAttribute("user");
	    	String shop_register = user.getUser_account();
	        System.out.println(shop_register);
	    	List<Shop> shopList = shopService.selShopByRegister(shop_register, map);
	        map.put("shopList", shopList);
	        System.out.println(shopList.get(0).getShop_img());
	        return "jsp/back/shop/shopListByRegister";
	    }
	    @RequestMapping("shop/shopUpd")
	    public String shopUpd(Integer shop_id,Map<String,Object> map) throws ParseException{
	        System.out.println(shop_id);
	        Shop shop = shopService.shopDetail(shop_id);
	        map.put("shop", shop);
	        return "jsp/back/shop/shopUpd";
	    }
	    @RequestMapping("shop/shopUpdDo")
	    public String shopUpd(Shop shop,Map<String,Object> map,HttpServletRequest request) throws ParseException{
	        System.out.println(shop.getShop_id());
	    	shopService.shopUpd(shop, map);
	        return "jsp/back/main/message";
	    }
	    
	    //模糊查询商品名称查询售卖特产的店铺
	    @RequestMapping("shop/selShopByGoods")
	    public String selShopByGoods(String goods_name,Map<String,Object> map){
	    	List<Map<String, Object>> cityList = cityService.cityList();
	    	map.put("cityList", cityList);
	    	map.put("goods_name", goods_name);
	    	map = goodsService.selGoodsByGoodsName(goods_name, map);
	        return "jsp/before/shop/shopList";
	    }
	    //前台产看商店详细信息
	    @RequestMapping("shop/selShopDetails")
	    public String selShopDetails(Integer shop_id,Map<String,Object> map){
	    	Shop shop = shopService.shopDetail(shop_id);
	    	map.put("shop", shop);
	    	List<Map<String, Object>> cityList = cityService.cityList();
	    	map.put("cityList", cityList);
	        return "jsp/before/shop/singleShop";
	    }
	    
}
