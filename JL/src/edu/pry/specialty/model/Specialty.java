package edu.pry.specialty.model;

import java.util.Date;

import edu.pry.city.model.City;
import edu.pry.region.model.Region;
import edu.pry.type.model.Type;

public class Specialty {
	private Integer specialty_id;
	private String specialty_name;
	private String specialty_img;
	private Integer specialty_type;
	private Integer specialty_localCity;
	private Integer specialty_localRegion;
	private String specialty_des;
	private Date createDate;
	private Date updateDate;
	private Type type;
	public Integer getSpecialty_id() {
		return specialty_id;
	}
	public void setSpecialty_id(Integer specialty_id) {
		this.specialty_id = specialty_id;
	}
	public String getSpecialty_name() {
		return specialty_name;
	}
	public void setSpecialty_name(String specialty_name) {
		this.specialty_name = specialty_name;
	}
	public String getSpecialty_img() {
		return specialty_img;
	}
	public void setSpecialty_img(String specialty_img) {
		this.specialty_img = specialty_img;
	}
	public Integer getSpecialty_type() {
		return specialty_type;
	}
	public void setSpecialty_type(Integer specialty_type) {
		this.specialty_type = specialty_type;
	}
	public Integer getSpecialty_localCity() {
		return specialty_localCity;
	}
	public void setSpecialty_localCity(Integer specialty_localCity) {
		this.specialty_localCity = specialty_localCity;
	}
	public Integer getSpecialty_localRegion() {
		return specialty_localRegion;
	}
	public void setSpecialty_localRegion(Integer specialty_localRegion) {
		this.specialty_localRegion = specialty_localRegion;
	}
	public String getSpecialty_des() {
		return specialty_des;
	}
	public void setSpecialty_des(String specialty_des) {
		this.specialty_des = specialty_des;
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
	public Type getType() {
		return type;
	}
	public void setType(Type type) {
		this.type = type;
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
	private City city;
	private Region region;
	
		

}
