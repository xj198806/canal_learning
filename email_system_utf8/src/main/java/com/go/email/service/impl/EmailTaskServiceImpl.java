package com.go.email.service.impl;

import com.go.email.bean.EmailTask;
import com.go.email.dao.EmailTaskDao;
import com.go.email.service.EmailTaskService;
import com.go.util.PageInfo;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: xujian
 * Date: 14-9-18
 * Time: ÏÂÎç4:09
 * To change this template use File | Settings | File Templates.
 */
public class EmailTaskServiceImpl implements EmailTaskService {

    public void add(EmailTask emailTask){
        emailTaskDao.insert(emailTask);
    }

    public PageInfo<EmailTask> getPageInfo(int uid,int status,int page,int perPage){
        PageInfo<EmailTask> pageInfo = new PageInfo<EmailTask>(page,perPage);
        pageInfo.setCount(emailTaskDao.selectCount(uid,status));
        if (pageInfo.getCount() > 0){
            pageInfo.setItems(emailTaskDao.selectList(uid,status,pageInfo.getStartIndex(),perPage));
        }
        return pageInfo;
    }

    public List<EmailTask> getList(int uid,int status){
        return emailTaskDao.selectList(uid,status,0,1000);
    }


    private EmailTaskDao emailTaskDao = null;

    public void setEmailTaskDao(EmailTaskDao emailTaskDao) {
        this.emailTaskDao = emailTaskDao;
    }
}
