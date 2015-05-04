package com.go.user.service.impl;

import com.go.user.bean.UserScore;
import com.go.user.dao.UserScoreDao;
import com.go.user.service.UserScoreService;

/**
 * Created with IntelliJ IDEA.
 * User: xujian
 * Date: 14-9-19
 * Time: 下午5:26
 * To change this template use File | Settings | File Templates.
 */
public class UserScoreServiceImpl implements UserScoreService{

    public void add(UserScore userScore) {
        userScoreDao.insert(userScore);
    }

    private UserScoreDao userScoreDao = null;

    public void setUserScoreDao(UserScoreDao userScoreDao) {
        this.userScoreDao = userScoreDao;
    }
}
