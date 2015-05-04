package com.go.email.dao.impl;

import com.go.email.bean.EmailGroup;
import com.go.email.dao.EmailGroupDao;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 14-9-13
 * Time: ÏÂÎç8:20
 * To change this template use File | Settings | File Templates.
 */
public class EmailGroupDaoImpl extends SqlMapClientDaoSupport implements EmailGroupDao {

    public void insert(EmailGroup emailGroup){
        this.getSqlMapClientTemplate().insert("EmailGroupDao.insert",emailGroup);
    }

    public void update(EmailGroup emailGroup){
        this.getSqlMapClientTemplate().update("EmailGroupDao.update",emailGroup);
    }

    public EmailGroup selectById(int id){
        return (EmailGroup)this.getSqlMapClientTemplate().queryForObject("EmailGroupDao.selectById",id);
    }

    public void updateCountById(int id,int count){
        Map<String,Object> params = new HashMap<String,Object>();
        params.put("id",id);
        params.put("count",count);
        this.getSqlMapClientTemplate().update("EmailGroupDao.updateCountById",params);
    }

    public void delete(int id){
        this.getSqlMapClientTemplate().delete("EmailGroupDao.delete",id);
    }

    public int selectCountByUid(int uid){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("EmailGroupDao.selectCountByUid",uid);
    }

    public List<EmailGroup> selectListByUid(int uid,int startIndex,int limit){
        HashMap<String,Object> params = new HashMap<String,Object>();
        params.put("uid",uid);
        params.put("startIndex",startIndex);
        params.put("limit",limit);

        return (List<EmailGroup>)this.getSqlMapClientTemplate().queryForList("EmailGroupDao.selectListByUid",params);
    }

}
