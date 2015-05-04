package com.go.email.service;

import com.go.email.bean.EmailList;
import com.go.util.PageInfo;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: xujian
 * Date: 14-9-16
 * Time: обнГ4:18
 * To change this template use File | Settings | File Templates.
 */
public interface EmailListService {

    public void add(EmailList emailList);

    public void addList(List<EmailList> emails);

    public void updateStatus(int status,int id);

    public int getCountByGidUid(int gid);

    public List<String> getEmailsByGid(int gid);

    public void deleteByGid(int gid);

    public PageInfo<EmailList> getPageInfo(int gid,int page,int perPage);

}
