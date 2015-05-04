package com.go.email.dao;

import com.go.email.bean.EmailConfig;

import java.util.ArrayList;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: xujian
 * Date: 14-10-14
 * Time: обнГ2:08
 * To change this template use File | Settings | File Templates.
 */
public interface EmailConfigDao {

    public void insert (EmailConfig emailConfig);

    public EmailConfig selectById(int id);

    public void update (EmailConfig emailConfig);

    public ArrayList<EmailConfig> selectList();

    public int selectCount();

    public List<EmailConfig> selectList(int startIndex,int limit);

}
