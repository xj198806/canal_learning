package com.go.email.dao;

import com.go.email.bean.EmailGroup;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 14-9-13
 * Time: обнГ8:18
 * To change this template use File | Settings | File Templates.
 */
public interface EmailGroupDao {

    public void insert(EmailGroup emailGroup);

    public void update(EmailGroup emailGroup);

    public EmailGroup selectById(int id);

    public void updateCountById(int id,int count);

    public void delete(int id);

    public int selectCountByUid(int uid);

    public List<EmailGroup> selectListByUid(int uid,int startIndex,int limit);

}
