package com.go.email.dao;

import com.go.email.bean.ConfigGroupMapping;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: xujian
 * Date: 14-12-4
 * Time: ионГ10:34
 * To change this template use File | Settings | File Templates.
 */
public interface ConfigGroupMappingDao {

    public void insert(ConfigGroupMapping configGroupMapping);

    public void delete(ConfigGroupMapping configGroupMapping);

    public void deleteByGid(int gid);

    public List<Integer> selectConfigIdsByGid(int gid);

}
