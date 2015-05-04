package com.go.email.dao.impl;

import com.go.email.bean.EmailList;
import com.go.email.bean.Template;
import com.go.email.dao.TemplateDao;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: xujian
 * Date: 14-9-17
 * Time: ÏÂÎç3:23
 * To change this template use File | Settings | File Templates.
 */
public class TemplateDaoImpl extends SqlMapClientDaoSupport implements TemplateDao{

    public void insert(Template template){
        this.getSqlMapClientTemplate().insert("TemplateDao.insert",template);
    }

    public void deleteById(int tid){
        this.getSqlMapClientTemplate().delete("TemplateDao.deleteById",tid);
    }

    public Template selectById(int id){
        return (Template)this.getSqlMapClientTemplate().queryForObject("TemplateDao.selectById",id);
    }

    public void update(Template template){
        this.getSqlMapClientTemplate().update("TemplateDao.update",template);
    }

    public int selectCount(int uid){
        return (Integer)this.getSqlMapClientTemplate().queryForObject("TemplateDao.selectCount",uid);
    }

    public List<Template> selectList(int uid,int startIndex,int limit){
        Map<String,Object> params = new HashMap<String,Object>();
        params.put("uid",uid);
        params.put("startIndex",startIndex);
        params.put("limit",limit);

        return (List<Template>)this.getSqlMapClientTemplate().queryForList("TemplateDao.selectList",params);
    }

}
