package com.go.email.service.impl;


import com.go.email.bean.EmailGroup;
import com.go.email.dao.EmailGroupDao;
import com.go.email.service.EmailGroupService;
import com.go.util.PageInfo;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 14-9-13
 * Time: ÏÂÎç8:20
 * To change this template use File | Settings | File Templates.
 */
public class EmailGroupServiceImpl implements EmailGroupService{

    public void add(EmailGroup emailGroup) {
        emailGroupDao.insert(emailGroup);
    }

    public void update(EmailGroup emailGroup){
        emailGroupDao.update(emailGroup);
    }

    public EmailGroup getById(int id){
        return emailGroupDao.selectById(id);
    }

    public void updateCountById(int id,int count){
        emailGroupDao.updateCountById(id,count);
    }


    public void delete(int id){
        emailGroupDao.delete(id);
    }

    public PageInfo<EmailGroup> getPageInfo(int uid,int page,int perPage){
        PageInfo<EmailGroup> pageInfo = new PageInfo<EmailGroup>(page,perPage);
        pageInfo.setCount(emailGroupDao.selectCountByUid(uid));

        if (pageInfo.getCount() > 0){
            pageInfo.setItems(emailGroupDao.selectListByUid(uid,pageInfo.getStartIndex(),perPage));
        }
        return pageInfo;
    }

    public List<EmailGroup> getListByUid(int uid){
        return emailGroupDao.selectListByUid(uid,0,100);
    }

    private EmailGroupDao emailGroupDao = null;

    public void setEmailGroupDao(EmailGroupDao emailGroupDao) {
        this.emailGroupDao = emailGroupDao;
    }
}
