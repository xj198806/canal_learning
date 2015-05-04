package com.go.email.service.impl;

import com.go.base.TaskLog;
import com.go.email.dao.EmailLogDao;
import com.go.email.service.EmailLogService;

import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: xujian
 * Date: 14-11-7
 * Time: ÏÂÎç3:59
 * To change this template use File | Settings | File Templates.
 */
public class EmailLogServiceImpl implements EmailLogService {

    public void updatePv(int tid,int mid){
        emailLogDao.updatePv(tid,mid);
    }

    public void updateUv(int tid,int mid){
        emailLogDao.updateUv(tid,mid);
    }

    public void updateStatus(int status,int tid,int mid){
        emailLogDao.updateStatus(status,tid,mid);
    }

    public List<TaskLog> getListByTid(int tid){
        return emailLogDao.selectListByTid(tid);
    }

    public int getCountByStatus(int tid,int status){
        return emailLogDao.selectCountByStatus(tid,status);
    }

    public TaskLog getPvUvCount(int tid){
        return emailLogDao.selectPvUvCount(tid);
    }

    public int getOpen2(int tid){
        return emailLogDao.selectOpen2(tid);
    }

    public int getClick2(int tid){
        return emailLogDao.selectClick2(tid);
    }

    private EmailLogDao emailLogDao = null;

    public void setEmailLogDao(EmailLogDao emailLogDao) {
        this.emailLogDao = emailLogDao;
    }
}
