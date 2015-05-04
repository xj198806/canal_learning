package com.go.email.dao.impl;

import com.go.email.bean.EmailTask;
import com.go.email.dao.EmailTaskDao;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: xujian
 * Date: 14-9-18
 * Time: ÏÂÎç4:17
 * To change this template use File | Settings | File Templates.
 */
public class EmailTaskDaoImpl extends SqlMapClientDaoSupport implements EmailTaskDao {

    public void insert (EmailTask emailTask){
        this.getSqlMapClientTemplate().insert("EmailTaskDao.insert",emailTask);
    }

    public int selectCount(int uid,int status){
        Map<String,Object> params = new HashMap<String,Object>();
        params.put("uid",uid);
        params.put("status",status);
        return (Integer) this.getSqlMapClientTemplate().queryForObject("EmailTaskDao.selectCount",params);
    }

    public List<EmailTask> selectList(int uid,int status,int startIndex,int limit){
        Map<String,Object> params = new HashMap<String,Object>();
        params.put("uid",uid);
        params.put("status",status);
        params.put("startIndex",startIndex);
        params.put("limit",limit);
        return (List<EmailTask>) this.getSqlMapClientTemplate().queryForList("EmailTaskDao.selectList",params);
    }

}
