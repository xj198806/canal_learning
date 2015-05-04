package com.go.email.bean;

import com.go.base.BaseBean;

/**
 * Created with IntelliJ IDEA.
 * User: xujian
 * Date: 14-9-17
 * Time: 下午2:37
 * To change this template use File | Settings | File Templates.
 */
public class Template extends BaseBean{

    private Integer id;

    private Integer uid;

    private String title;

    private String content;

    private String original;

    private int status;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getOriginal() {
        return original;
    }

    public void setOriginal(String original) {
        this.original = original;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
