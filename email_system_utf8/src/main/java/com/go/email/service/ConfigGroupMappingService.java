package com.go.email.service;

import com.go.email.bean.ConfigGroupMapping;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: xujian
 * Date: 14-12-3
 * Time: обнГ5:20
 * To change this template use File | Settings | File Templates.
 */
public interface ConfigGroupMappingService {

    public void addList(List<ConfigGroupMapping> configGroupMappings);

    public void removeList(List<ConfigGroupMapping> configGroupMappings);

    public List<Integer> getConfigIdsByGid(int gid);

    public void dropByGid(int gid);

}
