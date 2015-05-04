package com.go.email.service.impl;

import com.go.email.bean.UserConfigGroupMapping;
import com.go.email.dao.UserGroupMappingDao;
import com.go.email.service.UserGroupMappingService;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: xujian
 * Date: 14-12-4
 * Time: ÏÂÎç1:17
 * To change this template use File | Settings | File Templates.
 */
public class UserGroupMappingServiceImpl implements UserGroupMappingService {

    public void addList(List<UserConfigGroupMapping> userConfigGroupMappings){
        for (UserConfigGroupMapping userConfigGroupMapping : userConfigGroupMappings)
            userGroupMappingDao.insert(userConfigGroupMapping);
    }

    public void removeList(List<UserConfigGroupMapping> userConfigGroupMappings){
        for (UserConfigGroupMapping userConfigGroupMapping : userConfigGroupMappings)
            userGroupMappingDao.delete(userConfigGroupMapping);
    }

    public List<Integer> getUserGroupsByUid(int uid){
        return userGroupMappingDao.selectUserGroupsByUid(uid);
    }

    public void dropByUid(int uid){
        userGroupMappingDao.deleteByUid(uid);
    }

    private UserGroupMappingDao userGroupMappingDao = null;

    public void setUserGroupMappingDao(UserGroupMappingDao userGroupMappingDao) {
        this.userGroupMappingDao = userGroupMappingDao;
    }
}
