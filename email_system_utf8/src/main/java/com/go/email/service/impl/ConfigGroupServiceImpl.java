package com.go.email.service.impl;

import com.go.email.bean.ConfigGroup;
import com.go.email.dao.ConfigGroupDao;
import com.go.email.service.ConfigGroupMappingService;
import com.go.email.service.ConfigGroupService;
import com.go.util.PageInfo;
import org.apache.commons.lang.StringUtils;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: xujian
 * Date: 14-12-3
 * Time: ÏÂÎç5:06
 * To change this template use File | Settings | File Templates.
 */
public class ConfigGroupServiceImpl implements ConfigGroupService {

    public void add(ConfigGroup configGroup){
        configGroupDao.insert(configGroup);
    }

    public ConfigGroup getById(int id){
        return configGroupDao.selectById(id);
    }

    public void edit(ConfigGroup configGroup){
        configGroupDao.update(configGroup);
    }

    public PageInfo<ConfigGroup> getPageInfo(int page,int perPage){
        PageInfo<ConfigGroup> pageInfo = new PageInfo<ConfigGroup>(page,perPage);
        int count = configGroupDao.selectCount();
        if (count > 0){
            pageInfo.setCount(count);
            List<ConfigGroup> items = configGroupDao.selectList(pageInfo.getStartIndex(), perPage);
            for (ConfigGroup configGroup : items){
                configGroup.setConfigIds(StringUtils.join(configGroupMappingService.getConfigIdsByGid(configGroup.getId()),","));
            }
            pageInfo.setItems(items);
        }
        return pageInfo;
    }

    private ConfigGroupDao configGroupDao = null;

    public void setConfigGroupDao(ConfigGroupDao configGroupDao) {
        this.configGroupDao = configGroupDao;
    }

    private ConfigGroupMappingService configGroupMappingService = null;

    public void setConfigGroupMappingService(ConfigGroupMappingService configGroupMappingService) {
        this.configGroupMappingService = configGroupMappingService;
    }
}
