package com.go.email.dao.impl;

import com.go.email.bean.ConfigGroupMapping;
import com.go.email.dao.ConfigGroupMappingDao;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: xujian
 * Date: 14-12-4
 * Time: ÉÏÎç10:35
 * To change this template use File | Settings | File Templates.
 */
public class ConfigGroupMappingDaoImpl extends SqlMapClientDaoSupport implements ConfigGroupMappingDao {

    public void insert(ConfigGroupMapping configGroupMapping){
        this.getSqlMapClientTemplate().insert("ConfigGroupMappingDao.insert",configGroupMapping);
    }

    public void delete(ConfigGroupMapping configGroupMapping){
        this.getSqlMapClientTemplate().delete("ConfigGroupMappingDao.delete",configGroupMapping);
    }

    public void deleteByGid(int gid){
        this.getSqlMapClientTemplate().delete("ConfigGroupMappingDao.deleteByGid",gid);
    }

    public List<Integer> selectConfigIdsByGid(int gid){
        return (List<Integer>) this.getSqlMapClientTemplate().queryForList("ConfigGroupMappingDao.selectConfigIdsByGid",gid);
    }

}
