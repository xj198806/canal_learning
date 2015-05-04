package com.go.email.dao;

import com.go.email.bean.ConfigGroup;
import com.go.util.PageInfo;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: xujian
 * Date: 14-12-3
 * Time: обнГ5:09
 * To change this template use File | Settings | File Templates.
 */
public interface ConfigGroupDao {

    public void insert(ConfigGroup configGroup) ;

    public ConfigGroup selectById(int id);

    public void update(ConfigGroup configGroup);

    public int selectCount();

    public List<ConfigGroup> selectList(int startIndex,int limit);

}
