package com.go.email.service.impl;

import com.go.email.bean.ConfigGroupMapping;
import com.go.email.dao.ConfigGroupMappingDao;
import com.go.email.service.ConfigGroupMappingService;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: xujian
 * Date: 14-12-3
 * Time: ÏÂÎç5:22
 * To change this template use File | Settings | File Templates.
 */
public class ConfigGroupMappingServiceImpl implements ConfigGroupMappingService{

    public void addList(List<ConfigGroupMapping> configGroupMappings){
        for(ConfigGroupMapping configGroupMapping : configGroupMappings)
            configGroupMappingDao.insert(configGroupMapping);
    }

    public void removeList(List<ConfigGroupMapping> configGroupMappings){
        for(ConfigGroupMapping configGroupMapping : configGroupMappings)
            configGroupMappingDao.delete(configGroupMapping);
    }

    public List<Integer> getConfigIdsByGid(int gid){
        return configGroupMappingDao.selectConfigIdsByGid(gid);
    }

    public void dropByGid(int gid){
        configGroupMappingDao.deleteByGid(gid);
    }

    private ConfigGroupMappingDao configGroupMappingDao = null;

    public void setConfigGroupMappingDao(ConfigGroupMappingDao configGroupMappingDao) {
        this.configGroupMappingDao = configGroupMappingDao;
    }
}
