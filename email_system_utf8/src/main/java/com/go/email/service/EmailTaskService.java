package com.go.email.service;

import com.go.email.bean.EmailTask;
import com.go.util.PageInfo;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: xujian
 * Date: 14-9-18
 * Time: обнГ3:50
 * To change this template use File | Settings | File Templates.
 */
public interface EmailTaskService {

    public void add(EmailTask emailTask);

    public PageInfo<EmailTask> getPageInfo(int uid,int status,int page,int perPage);

    public List<EmailTask> getList(int uid,int status);

}
