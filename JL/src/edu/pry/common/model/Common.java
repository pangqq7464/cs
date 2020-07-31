package edu.pry.common.model;

import java.util.Date;

import edu.pry.user.model.User;

public class Common {
	private Integer common_id;
	private String common_account;
	private Integer common_specialty;
	private Date common_time;
	private String common_message;
	private String common_img;
	private Integer common_others;
	private Integer common_count;
	private User user;
	
	public Integer getCommon_count() {
		return common_count;
	}
	public void setCommon_count(Integer common_count) {
		this.common_count = common_count;
	}
	public Integer getCommon_others() {
		return common_others;
	}
	public void setCommon_others(Integer common_others) {
		this.common_others = common_others;
	}
	public Integer getCommon_id() {
		return common_id;
	}
	public void setCommon_id(Integer common_id) {
		this.common_id = common_id;
	}
	public String getCommon_account() {
		return common_account;
	}
	public void setCommon_account(String common_account) {
		this.common_account = common_account;
	}
	public Integer getCommon_specialty() {
		return common_specialty;
	}
	public void setCommon_specialty(Integer common_specialty) {
		this.common_specialty = common_specialty;
	}
	public Date getCommon_time() {
		return common_time;
	}
	public void setCommon_time(Date common_time) {
		this.common_time = common_time;
	}
	public String getCommon_message() {
		return common_message;
	}
	public void setCommon_message(String common_message) {
		this.common_message = common_message;
	}
	public String getCommon_img() {
		return common_img;
	}
	public void setCommon_img(String common_img) {
		this.common_img = common_img;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
}
