package com.go.email.service.impl;

import com.go.email.bean.Template;
import com.go.email.dao.TemplateDao;
import com.go.email.service.TemplateService;
import com.go.util.PageInfo;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: xujian
 * Date: 14-9-17
 * Time: ÏÂÎç2:57
 * To change this template use File | Settings | File Templates.
 */
public class TemplateServiceImpl implements TemplateService{

    public void addTemplate(Template template){
        templateDao.insert(template);
    }

    public void deleteById(int tid){
        templateDao.deleteById(tid);
    }

    public Template getById(int id){
        return templateDao.selectById(id);
    }

    public void update(Template template){
        templateDao.update(template);
    }

    public PageInfo<Template> getPageInfo(int uid,int page,int perPage){
        PageInfo<Template> pageInfo = new PageInfo<Template>(page,perPage);
        pageInfo.setCount(templateDao.selectCount(uid));
        if (pageInfo.getCount() > 0){
            pageInfo.setItems(templateDao.selectList(uid,pageInfo.getStartIndex(),perPage));
        }
        return pageInfo;
    }

    public List<Template> getListByUid(int uid){
        return templateDao.selectList(uid,0,100);
    }


    private TemplateDao templateDao;

    public void setTemplateDao(TemplateDao templateDao) {
        this.templateDao = templateDao;
    }
}
