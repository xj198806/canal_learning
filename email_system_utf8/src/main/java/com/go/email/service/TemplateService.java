package com.go.email.service;

import com.go.email.bean.Template;
import com.go.util.PageInfo;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: xujian
 * Date: 14-9-17
 * Time: обнГ2:37
 * To change this template use File | Settings | File Templates.
 */
public interface TemplateService {

    public void addTemplate(Template template);

    public void deleteById(int tid);

    public Template getById(int id);

    public void update(Template template);

    public PageInfo<Template> getPageInfo(int uid,int page,int perPage);

    public List<Template> getListByUid(int uid);

}
