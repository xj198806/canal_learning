package com.go.email.service;

import com.go.email.bean.EmailGroup;
import com.go.util.PageInfo;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 14-9-13
 * Time: обнГ8:17
 * To change this template use File | Settings | File Templates.
 */
public interface EmailGroupService {

    public void add(EmailGroup emailGroup) ;

    public void update(EmailGroup emailGroup) ;

    public EmailGroup getById(int id);

    public void updateCountById(int id,int count);

    public void delete(int id);

    public PageInfo<EmailGroup> getPageInfo(int uid,int page,int perPage);

    public List<EmailGroup> getListByUid(int uid);

}
