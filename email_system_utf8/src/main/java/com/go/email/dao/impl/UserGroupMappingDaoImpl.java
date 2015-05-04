package com.go.email.dao.impl;

import com.go.email.bean.UserConfigGroupMapping;
import com.go.email.dao.UserGroupMappingDao;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: xujian
 * Date: 14-12-4
 * Time: ÏÂÎç1:19
 * To change this template use File | Settings | File Templates.
 */
public class UserGroupMappingDaoImpl extends SqlMapClientDaoSupport implements UserGroupMappingDao {

    public void insert(UserConfigGroupMapping userConfigGroupMapping){
        this.getSqlMapClientTemplate().insert("UserGroupMappingDao.insert",userConfigGroupMapping);
    }

    public void delete(UserConfigGroupMapping userConfigGroupMapping){
        this.getSqlMapClientTemplate().delete("UserGroupMappingDao.delete",userConfigGroupMapping);
    }

    public List<Integer> selectUserGroupsByUid(int uid){
        return (List<Integer>)this.getSqlMapClientTemplate().queryForList("UserGroupMappingDao.selectUserGroupsByUid",uid);
    }

    public void deleteByUid(int uid){
        this.getSqlMapClientTemplate().delete("UserGroupMappingDao.deleteByUid",uid);
    }

}
