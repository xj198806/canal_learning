package com.go.email.dao.impl;

import com.go.email.bean.EmailConfig;
import com.go.email.dao.EmailConfigDao;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: xujian
 * Date: 14-10-14
 * Time: ÏÂÎç2:10
 * To change this template use File | Settings | File Templates.
 */
public class EmailConfigDaoImpl extends SqlMapClientDaoSupport implements EmailConfigDao {

    public void insert (EmailConfig emailConfig){
        this.getSqlMapClientTemplate().insert("EmailConfigDao.insert",emailConfig);
    }

    public EmailConfig selectById(int id){
        return (EmailConfig)this.getSqlMapClientTemplate().queryForObject("EmailConfigDao.selectById",id);
    }

    public void update (EmailConfig emailConfig){
        this.getSqlMapClientTemplate().update("EmailConfigDao.update",emailConfig);
    }

    public ArrayList<EmailConfig> selectList(){
        return (ArrayList<EmailConfig>) this.getSqlMapClientTemplate().queryForList("EmailConfigDao.selectList");
    }

    public int selectCount(){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("EmailConfigDao.selectCount");
    }

    public List<EmailConfig> selectList(int startIndex,int limit){
        Map<String,Object> params = new HashMap<String,Object>();
        params.put("startIndex",startIndex);
        params.put("limit",limit);
        return (List<EmailConfig>)this.getSqlMapClientTemplate().queryForList("EmailConfigDao.selectList2",params);
    }

}
