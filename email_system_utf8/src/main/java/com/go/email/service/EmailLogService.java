package com.go.email.service;

import com.go.base.TaskLog;

import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: xujian
 * Date: 14-11-4
 * Time: обнГ4:13
 * To change this template use File | Settings | File Templates.
 */
public interface EmailLogService {

    public void updatePv(int tid,int mid);

    public void updateUv(int tid,int mid);

    public void updateStatus(int status,int tid,int mid);

    public List<TaskLog> getListByTid(int tid);

    public int getCountByStatus(int tid,int status);

    public TaskLog getPvUvCount(int tid);

    public int getOpen2(int tid);

    public int getClick2(int tid);

}
