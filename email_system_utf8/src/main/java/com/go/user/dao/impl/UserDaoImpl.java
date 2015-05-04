package com.go.user.dao.impl;

import com.go.user.bean.User;
import com.go.user.dao.UserDao;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import java.util.HashMap;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 14-9-13
 * Time: 上午7:58
 * To change this template use File | Settings | File Templates.
 */
public class UserDaoImpl extends SqlMapClientDaoSupport implements UserDao{

    public void insert(User user){
        this.getSqlMapClientTemplate().insert("UserDao.insert",user);
    }

    public void update(User user){
        this.getSqlMapClientTemplate().update("UserDao.update",user);
    }

    public void updateScore(int uid,int score){
        HashMap<String,Object> params = new HashMap<String,Object>();
        params.put("uid",uid);
        params.put("score",score);
        this.getSqlMapClientTemplate().update("UserDao.updateScore",params);
    }

    public User selectById(int id){
        return (User)this.getSqlMapClientTemplate().queryForObject("UserDao.selectById",id);
    }

    public int selectCountByType(int uType,int parentUid){
        HashMap<String,Object> params = new HashMap<String,Object>();
        params.put("uType",uType);
        params.put("parentUid",parentUid);
        return (Integer)this.getSqlMapClientTemplate().queryForObject("UserDao.selectCountByType",params);
    }

    public List<User> selectListByType (int uType,int parentUid,int startIndex,int limit){
        HashMap<String,Object> params = new HashMap<String,Object>();
        params.put("uType",uType);
        params.put("parentUid",parentUid);
        params.put("startIndex",startIndex);
        params.put("limit",limit);
        return (List<User>)this.getSqlMapClientTemplate().queryForList("UserDao.selectListByType",params);
    }

}
