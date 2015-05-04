package com.go.email.service.impl;

import com.go.email.bean.ImportLog;
import com.go.email.dao.ImportLogDao;
import com.go.email.service.ImportLogService;

/**
 * Created with IntelliJ IDEA.
 * User: xujian
 * Date: 14-10-22
 * Time: ÏÂÎç4:17
 * To change this template use File | Settings | File Templates.
 */
public class ImportLogServiceImpl implements ImportLogService {

    public int add(ImportLog importLog){
        return this.importLogDao.insert(importLog);
    }

    public ImportLog getById(int id){
        return importLogDao.selectById(id);
    }

    public void updateStatus(int id){
        importLogDao.updateStatus(id);
    }

    public ImportLog getByUidFileGid(int uid,String file,int gid){
        return importLogDao.selectByUidFileGid(uid,file,gid);
    }

    private ImportLogDao importLogDao = null;

    public void setImportLogDao(ImportLogDao importLogDao) {
        this.importLogDao = importLogDao;
    }
}
