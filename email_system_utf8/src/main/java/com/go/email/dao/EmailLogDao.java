package com.go.email.dao;

import com.go.base.TaskLog;

import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: xujian
 * Date: 14-11-7
 * Time: обнГ4:00
 * To change this template use File | Settings | File Templates.
 */
public interface EmailLogDao {

    public void updatePv(int tid,int mid);

    public void updateUv(int tid,int mid);

    public void updateStatus(int status,int tid,int mid);

    public List<TaskLog> selectListByTid(int tid);

    public int selectCountByStatus(int tid,int status);

    public TaskLog selectPvUvCount(int tid);

    public int selectOpen2(int tid);

    public int selectClick2(int tid);

}
