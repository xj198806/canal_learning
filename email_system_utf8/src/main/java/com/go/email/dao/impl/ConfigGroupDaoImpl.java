package com.go.email.dao.impl;

import com.go.email.bean.ConfigGroup;
import com.go.email.dao.ConfigGroupDao;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: xujian
 * Date: 14-12-3
 * Time: ÏÂÎç5:11
 * To change this template use File | Settings | File Templates.
 */
public class ConfigGroupDaoImpl extends SqlMapClientDaoSupport implements ConfigGroupDao{

    public void insert(ConfigGroup configGroup){
        this.getSqlMapClientTemplate().insert("ConfigGroupDao.insert",configGroup);
    }

    public ConfigGroup selectById(int id){
        return (ConfigGroup)this.getSqlMapClientTemplate().queryForObject("ConfigGroupDao.selectById",id);
    }

    public void update(ConfigGroup configGroup){
        this.getSqlMapClientTemplate().update("ConfigGroupDao.update", configGroup);
    }

    public int selectCount(){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("ConfigGroupDao.selectCount");
    }

    public List<ConfigGroup> selectList(int startIndex,int limit){
        Map<String,Object> params = new HashMap<String,Object>();
        params.put("startIndex",startIndex);
        params.put("limit",limit);
        return (List<ConfigGroup>)this.getSqlMapClientTemplate().queryForList("ConfigGroupDao.selectList",params);
    }

}
