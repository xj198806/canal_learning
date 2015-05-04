package com.go.email.bean;

import com.go.base.BaseBean;

/**
 * Created with IntelliJ IDEA.
 * User: xujian
 * Date: 14-12-3
 * Time: 下午5:00
 * To change this template use File | Settings | File Templates.
 */
public class ConfigGroupMapping extends BaseBean{

    private Integer configGroupId = 0;

    private Integer configId = 0;

    public Integer getConfigGroupId() {
        return configGroupId;
    }

    public void setConfigGroupId(Integer configGroupId) {
        this.configGroupId = configGroupId;
    }

    public Integer getConfigId() {
        return configId;
    }

    public void setConfigId(Integer configId) {
        this.configId = configId;
    }
}
