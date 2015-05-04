package com.go.email.bean;

import com.go.base.BaseBean;

/**
 * Created with IntelliJ IDEA.
 * User: xujian
 * Date: 14-10-22
 * Time: 下午4:07
 * To change this template use File | Settings | File Templates.
 */
public class ImportLog extends BaseBean{

    private Integer id = 0;

    private Integer uid = 0;

    private String file = "";

    private Integer gid = 0;

    private Integer count = 0;

    private Integer status = 0;

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

    public String getFile() {
        return file;
    }

    public void setFile(String file) {
        this.file = file;
    }

    public Integer getGid() {
        return gid;
    }

    public void setGid(Integer gid) {
        this.gid = gid;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}
