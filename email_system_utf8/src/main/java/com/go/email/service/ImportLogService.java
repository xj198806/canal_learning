package com.go.email.service;

import com.go.email.bean.ImportLog;

/**
 * Created with IntelliJ IDEA.
 * User: xujian
 * Date: 14-10-22
 * Time: обнГ4:16
 * To change this template use File | Settings | File Templates.
 */
public interface ImportLogService {

    public int add(ImportLog importLog);

    public ImportLog getById(int id);

    public void updateStatus(int id);

    public ImportLog getByUidFileGid(int uid,String file,int gid);

}
