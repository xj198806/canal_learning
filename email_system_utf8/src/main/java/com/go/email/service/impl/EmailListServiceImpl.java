package com.go.email.service.impl;

import com.go.email.bean.EmailList;
import com.go.email.dao.EmailListDao;
import com.go.email.service.EmailListService;
import com.go.util.PageInfo;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: xujian
 * Date: 14-9-16
 * Time: ÏÂÎç4:18
 * To change this template use File | Settings | File Templates.
 */
public class EmailListServiceImpl implements EmailListService{

    public void add(EmailList emailList){
        try{
            emailListDao.insert(emailList);
        } catch (Exception e){

        }

    }

    public void addList(List<EmailList> emails){
        emailListDao.insertList(emails);
    }

    public void updateStatus(int status,int id){
        emailListDao.updateStatus(status,id);
    }

    public int getCountByGidUid(int gid){
        return emailListDao.selectCount(gid);
    }

    public List<String> getEmailsByGid(int gid){
        return emailListDao.selectEmailsByGid(gid);
    }

    public void deleteByGid(int gid){
        emailListDao.deleteByGid(gid);
    }

    public PageInfo<EmailList> getPageInfo(int gid,int page,int perPage){
        PageInfo<EmailList> pageInfo = new PageInfo<EmailList>(page,perPage);
        pageInfo.setCount(emailListDao.selectCount(gid));
        if (pageInfo.getCount() > 0){
            pageInfo.setItems(emailListDao.selectList(gid,pageInfo.getStartIndex(),perPage));
        }

        return pageInfo;
    }

    private EmailListDao emailListDao = null;

    public void setEmailListDao(EmailListDao emailListDao) {
        this.emailListDao = emailListDao;
    }
}
