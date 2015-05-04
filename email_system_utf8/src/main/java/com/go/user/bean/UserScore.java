package com.go.user.bean;

import com.go.base.BaseBean;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 14-9-13
 * Time: 下午8:09
 * To change this template use File | Settings | File Templates.
 */
public class UserScore extends BaseBean{

    private Integer id = 0;

    private Integer uid = 0;

    private Integer score = 0;

    private Integer scoreChange = 0;

    private String action = "";

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    public Integer getScoreChange() {
        return scoreChange;
    }

    public void setScoreChange(Integer scoreChange) {
        this.scoreChange = scoreChange;
    }
}
