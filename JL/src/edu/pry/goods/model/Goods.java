package edu.pry.goods.model;

import java.util.Date;

import edu.pry.shop.model.Shop;

public class Goods {
	private Integer goods_id;
	private String goods_name;
	private String goods_des;
	private String goods_img;
	private Integer goods_price;
	private Date createTime;
	private Date updateTime;
	private Integer goods_shop;
	private Shop shop;
	
	public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	public Integer getGoods_id() {
		return goods_id;
	}
	public void setGoods_id(Integer goods_id) {
		this.goods_id = goods_id;
	}
	public String getGoods_name() {
		return goods_name;
	}
	public void setGoods_name(String goods_name) {
		this.goods_name = goods_name;
	}
	public String getGoods_des() {
		return goods_des;
	}
	public void setGoods_des(String goods_des) {
		this.goods_des = goods_des;
	}
	public String getGoods_img() {
		return goods_img;
	}
	public void setGoods_img(String goods_img) {
		this.goods_img = goods_img;
	}
	public Integer getGoods_price() {
		return goods_price;
	}
	public void setGoods_price(Integer goods_price) {
		this.goods_price = goods_price;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
	public Integer getGoods_shop() {
		return goods_shop;
	}
	public void setGoods_shop(Integer goods_shop) {
		this.goods_shop = goods_shop;
	}
	public Shop getShop() {
		return shop;
	}
	public void setShop(Shop shop) {
		this.shop = shop;
	}
	

}
