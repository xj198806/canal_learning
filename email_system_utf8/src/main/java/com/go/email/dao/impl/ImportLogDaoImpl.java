package com.go.email.dao.impl;

import com.go.email.bean.ImportLog;
import com.go.email.dao.ImportLogDao;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import java.util.HashMap;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: xujian
 * Date: 14-10-22
 * Time: ÏÂÎç4:27
 * To change this template use File | Settings | File Templates.
 */
public class ImportLogDaoImpl extends SqlMapClientDaoSupport implements ImportLogDao{

    public int insert(ImportLog importLog){
        return (Integer)this.getSqlMapClientTemplate().insert("ImportLogDao.insert",importLog);
    }

    public ImportLog selectById(int id){
        return (ImportLog) this.getSqlMapClientTemplate().queryForObject("ImportLogDao.selectById",id);
    }

    public void updateStatus(int id){
        this.getSqlMapClientTemplate().update("ImportLogDao.updateStatus",id);
    }

    public ImportLog selectByUidFileGid(int uid,String file,int gid){
        Map<String,Object> params = new HashMap<String,Object>();
        params.put("uid",uid);
        params.put("file",file);
        params.put("gid",gid);
        return (ImportLog) this.getSqlMapClientTemplate().queryForObject("ImportLogDao.selectByUidFileGid",params);
    }

}
