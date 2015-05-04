package com.go.email.service;

import com.go.email.bean.UserConfigGroupMapping;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: xujian
 * Date: 14-12-4
 * Time: обнГ1:15
 * To change this template use File | Settings | File Templates.
 */
public interface UserGroupMappingService {

    public void addList(List<UserConfigGroupMapping> userConfigGroupMappings);

    public void removeList(List<UserConfigGroupMapping> userConfigGroupMappings);

    public List<Integer> getUserGroupsByUid(int uid);

    public void dropByUid(int uid);

}
