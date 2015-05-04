package com.go.email.bean;

import com.go.base.BaseBean;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 14-9-13
 * Time: 下午8:15
 * To change this template use File | Settings | File Templates.
 */
public class EmailList extends BaseBean{

    private Long id = 0l;

    private String email = "";

    private String name = "";

    private Integer gid = 0;

    private Integer uid = 0;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getGid() {
        return gid;
    }

    public void setGid(Integer gid) {
        this.gid = gid;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }
}
