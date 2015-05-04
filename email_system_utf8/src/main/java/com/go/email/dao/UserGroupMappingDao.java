package com.go.email.dao;

import com.go.email.bean.UserConfigGroupMapping;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: xujian
 * Date: 14-12-4
 * Time: обнГ1:19
 * To change this template use File | Settings | File Templates.
 */
public interface UserGroupMappingDao {

    public void insert(UserConfigGroupMapping userConfigGroupMapping);

    public void delete(UserConfigGroupMapping userConfigGroupMapping);

    public List<Integer> selectUserGroupsByUid(int uid);

    public void deleteByUid(int uid);

}
