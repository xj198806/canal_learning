package com.go.email.dao;

import com.go.email.bean.ImportLog;

/**
 * Created with IntelliJ IDEA.
 * User: xujian
 * Date: 14-10-22
 * Time: обнГ4:17
 * To change this template use File | Settings | File Templates.
 */
public interface ImportLogDao {

    public int insert(ImportLog importLog);

    public ImportLog selectById(int id);

    public void updateStatus(int id);

    public ImportLog selectByUidFileGid(int uid,String file,int gid);

}
