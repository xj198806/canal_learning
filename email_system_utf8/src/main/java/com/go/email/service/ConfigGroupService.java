package com.go.email.service;

import com.go.email.bean.ConfigGroup;
import com.go.util.PageInfo;

/**
 * Created with IntelliJ IDEA.
 * User: xujian
 * Date: 14-12-3
 * Time: обнГ4:55
 * To change this template use File | Settings | File Templates.
 */
public interface ConfigGroupService {

    public void add(ConfigGroup configGroup) ;

    public ConfigGroup getById(int id);

    public void edit(ConfigGroup configGroup);

    public PageInfo<ConfigGroup> getPageInfo(int page,int perPage);

}
