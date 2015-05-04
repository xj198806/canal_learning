package com.go.user.bean;

import com.go.base.BaseBean;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 14-9-13
 * Time: 下午8:11
 * To change this template use File | Settings | File Templates.
 */
public class UserLog extends BaseBean{

    private Integer id = 0;

    private Integer uid = 0;

    private String action = "";

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }
}
