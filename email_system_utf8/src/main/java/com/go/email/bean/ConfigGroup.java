package com.go.email.bean;

import com.go.base.BaseBean;

/**
 * Created with IntelliJ IDEA.
 * User: xujian
 * Date: 14-12-3
 * Time: 下午4:56
 * To change this template use File | Settings | File Templates.
 */
public class ConfigGroup extends BaseBean{

    private Integer id = 0 ;

    private String configIds = "";

    private String name = "";

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getConfigIds() {
        return configIds;
    }

    public void setConfigIds(String configIds) {
        this.configIds = configIds;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
