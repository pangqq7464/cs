package edu.pry.shop.model;

import java.util.Date;

import edu.pry.city.model.City;
import edu.pry.region.model.Region;
import edu.pry.user.model.User;

public class Shop {
	private Integer shop_id;
	private String shop_name;
	private Integer shop_city;
	private Integer shop_region;
	private String shop_address;
	private Integer shop_status;
	private String shop_tel;
	private Date createDate;
	private Date updateDate;
	private String open_time;
	private String shop_img;
	private String shop_des;
	private String shop_register;
	private User user;
	private City city;
	private Region region;
	
	public Integer getShop_city() {
		return shop_city;
	}
	public void setShop_city(Integer shop_city) {
		this.shop_city = shop_city;
	}
	public Integer getShop_region() {
		return shop_region;
	}
	public void setShop_region(Integer shop_region) {
		this.shop_region = shop_region;
	}
	public City getCity() {
		return city;
	}
	public void setCity(City city) {
		this.city = city;
	}
	public Region getRegion() {
		return region;
	}
	public void setRegion(Region region) {
		this.region = region;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Integer getShop_id() {
		return shop_id;
	}
	public void setShop_id(Integer shop_id) {
		this.shop_id = shop_id;
	}
	public String getShop_name() {
		return shop_name;
	}
	public void setShop_name(String shop_name) {
		this.shop_name = shop_name;
	}
	public String getShop_address() {
		return shop_address;
	}
	public void setShop_address(String shop_address) {
		this.shop_address = shop_address;
	}
	public Integer getShop_status() {
		return shop_status;
	}
	public void setShop_status(Integer shop_status) {
		this.shop_status = shop_status;
	}
	public String getShop_tel() {
		return shop_tel;
	}
	public void setShop_tel(String shop_tel) {
		this.shop_tel = shop_tel;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	public String getOpen_time() {
		return open_time;
	}
	public void setOpen_time(String open_time) {
		this.open_time = open_time;
	}
	public String getShop_img() {
		return shop_img;
	}
	public void setShop_img(String shop_img) {
		this.shop_img = shop_img;
	}
	public String getShop_des() {
		return shop_des;
	}
	public void setShop_des(String shop_des) {
		this.shop_des = shop_des;
	}
	public String getShop_register() {
		return shop_register;
	}
	public void setShop_register(String shop_register) {
		this.shop_register = shop_register;
	}
	
	

}
