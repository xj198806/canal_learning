package com.go.email.dao;

import com.go.email.bean.Template;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: xujian
 * Date: 14-9-17
 * Time: обнГ3:21
 * To change this template use File | Settings | File Templates.
 */
public interface TemplateDao {

    public void insert(Template template);

    public void deleteById(int tid);

    public Template selectById(int id);

    public void update(Template template);

    public int selectCount(int uid);

    public List<Template> selectList(int uid,int startIndex,int limit);

}
