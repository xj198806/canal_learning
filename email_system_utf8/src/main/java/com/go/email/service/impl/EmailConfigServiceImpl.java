package com.go.email.service.impl;

import com.go.email.bean.EmailConfig;
import com.go.email.dao.EmailConfigDao;
import com.go.email.service.EmailConfigService;
import com.go.util.PageInfo;

import java.util.ArrayList;

/**
 * Created with IntelliJ IDEA.
 * User: xujian
 * Date: 14-10-14
 * Time: ÏÂÎç2:14
 * To change this template use File | Settings | File Templates.
 */
public class EmailConfigServiceImpl implements EmailConfigService {

    public void add(EmailConfig emailConfig){
        emailConfigDao.insert(emailConfig);
    }

    public EmailConfig getById(int id){
        return emailConfigDao.selectById(id);
    }

    public void update(EmailConfig emailConfig){
        emailConfigDao.update(emailConfig);
    }

    public ArrayList<EmailConfig> getList(){
        return emailConfigDao.selectList();
    }

    public PageInfo<EmailConfig> getPageInfo(int page,int perPage){
        PageInfo<EmailConfig> pageInfo = new PageInfo<EmailConfig>(page,perPage);
        pageInfo.setCount(emailConfigDao.selectCount());
        if (pageInfo.getCount() > 0){
            pageInfo.setItems(emailConfigDao.selectList(pageInfo.getStartIndex(),perPage));
        }
        return pageInfo;
    }

    private EmailConfigDao emailConfigDao = null;

    public void setEmailConfigDao(EmailConfigDao emailConfigDao) {
        this.emailConfigDao = emailConfigDao;
    }
}
