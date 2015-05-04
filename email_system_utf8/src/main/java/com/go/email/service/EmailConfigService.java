package com.go.email.service;

import com.go.email.bean.EmailConfig;
import com.go.util.PageInfo;

import java.util.ArrayList;

/**
 * Created with IntelliJ IDEA.
 * User: xujian
 * Date: 14-10-14
 * Time: обнГ2:12
 * To change this template use File | Settings | File Templates.
 */
public interface EmailConfigService {

    public void add(EmailConfig emailConfig);

    public EmailConfig getById(int id);

    public void update(EmailConfig emailConfig);

    public ArrayList<EmailConfig> getList();

    public PageInfo<EmailConfig> getPageInfo(int page,int perPage);

}
