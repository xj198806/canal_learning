package com.go.email.dao.impl;

import com.go.base.TaskLog;
import com.go.email.dao.EmailLogDao;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: xujian
 * Date: 14-11-7
 * Time: ÏÂÎç4:01
 * To change this template use File | Settings | File Templates.
 */
public class EmailLogDaoImpl extends SqlMapClientDaoSupport implements EmailLogDao{

    public void updatePv(int tid,int mid){
        Map<String,Object> params = new HashMap<String,Object>();
        params.put("tid",tid);
        params.put("mid",mid);
        this.getSqlMapClientTemplate().update("EmailLogDao.updatePv",params);
    }

    public void updateUv(int tid,int mid){
        Map<String,Object> params = new HashMap<String,Object>();
        params.put("tid",tid);
        params.put("mid",mid);
        this.getSqlMapClientTemplate().update("EmailLogDao.updateUv",params);
    }

    public void updateStatus(int status,int tid,int mid){
        Map<String,Object> params = new HashMap<String,Object>();
        params.put("status",status);
        params.put("tid",tid);
        params.put("mid",mid);
        this.getSqlMapClientTemplate().update("EmailLogDao.updateStatus",params);
    }

    public List<TaskLog> selectListByTid(int tid){
        return (List<TaskLog>)this.getSqlMapClientTemplate().queryForList("EmailLogDao.selectListByGid",tid);
    }

    public int selectCountByStatus(int tid,int status){
        Map<String,Object> params = new HashMap<String,Object>();
        params.put("tid",tid);
        params.put("status",status);
        return (Integer)this.getSqlMapClientTemplate().queryForObject("EmailLogDao.selectCountByStatus",params);
    }

    public TaskLog selectPvUvCount(int tid){
        return (TaskLog)this.getSqlMapClientTemplate().queryForObject("EmailLogDao.selectPvUvCount",tid);
    }

    public int selectOpen2(int tid){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("EmailLogDao.selectOpen2",tid);
    }

    public int selectClick2(int tid){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("EmailLogDao.selectClick2",tid);
    }

}
