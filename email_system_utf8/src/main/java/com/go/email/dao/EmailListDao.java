package com.go.email.dao;

import com.go.email.bean.EmailList;
import com.go.util.PageInfo;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: xujian
 * Date: 14-9-16
 * Time: обнГ4:20
 * To change this template use File | Settings | File Templates.
 */
public interface EmailListDao {

    public void insert(EmailList emailList);

    public void insertList(List<EmailList> emails);

    public void updateStatus(int status,int id);

    public int selectCount(int gid);

    public List<String> selectEmailsByGid(int gid);

    public void deleteByGid(int gid);

    public List<EmailList> selectList(int gid,int startIndex,int limit);

}
