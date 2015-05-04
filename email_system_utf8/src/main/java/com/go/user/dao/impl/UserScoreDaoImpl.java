package com.go.user.dao.impl;

import com.go.user.bean.UserScore;
import com.go.user.dao.UserScoreDao;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

/**
 * Created with IntelliJ IDEA.
 * User: xujian
 * Date: 14-9-19
 * Time: 下午5:27
 * To change this template use File | Settings | File Templates.
 */
public class UserScoreDaoImpl extends SqlMapClientDaoSupport implements UserScoreDao {

    public void insert(UserScore userScore){
        this.getSqlMapClientTemplate().insert("UserScoreDao.insert",userScore);
    }

}
