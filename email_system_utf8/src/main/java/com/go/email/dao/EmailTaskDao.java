package com.go.email.dao;

import com.go.email.bean.EmailTask;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: xujian
 * Date: 14-9-18
 * Time: ÏÂÎç4:15
 * To change this template use File | Settings | File Templates.
 */
public interface EmailTaskDao {

    public void insert (EmailTask emailTask);

    public int selectCount(int uid,int status);

    public List<EmailTask> selectList(int uid,int status,int startIndex,int limit);

}
