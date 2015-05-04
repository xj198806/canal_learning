package com.go.email.dao.impl;

import com.go.email.bean.EmailList;
import com.go.email.dao.EmailListDao;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: xujian
 * Date: 14-9-16
 * Time: ÏÂÎç4:20
 * To change this template use File | Settings | File Templates.
 */
public class EmailListDaoImpl extends SqlMapClientDaoSupport implements EmailListDao{

    public void insert(EmailList emailList){
        this.getSqlMapClientTemplate().insert("EmailListDao.insert",emailList);
    }

    public void insertList(List<EmailList> emails){
        this.getSqlMapClientTemplate().insert("EmailListDao.insertList",emails);
    }

    public void updateStatus(int status,int id){
        Map<String,Object> params = new HashMap<String,Object>();
        params.put("status",status);
        params.put("id",id);
        this.getSqlMapClientTemplate().update("EmailListDao.updateStatus",params);
    }

    public int selectCount(int gid){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("EmailListDao.selectCount",gid);
    }

    public List<String> selectEmailsByGid(int gid){
        return (List<String>)this.getSqlMapClientTemplate().queryForList("EmailListDao.selectEmailsByGid",gid);
    }

    public void deleteByGid(int gid){
        this.getSqlMapClientTemplate().delete("EmailListDao.deleteByGid",gid);
    }

    public List<EmailList> selectList(int gid,int startIndex,int limit){
        Map<String,Object> params = new HashMap<String,Object>();
        params.put("gid",gid);
        params.put("startIndex",startIndex);
        params.put("limit",limit);

        return (List<EmailList>)this.getSqlMapClientTemplate().queryForList("EmailListDao.selectList",params);
    }

}
