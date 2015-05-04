package com.go.user.service;

import com.go.user.bean.LoginRet;
import com.go.user.bean.User;
import com.go.util.PageInfo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 14-9-13
 * Time: 上午7:44
 * To change this template use File | Settings | File Templates.
 */
public interface UserService {

    public void register(User user);

    public void update(User user);

    public void updateScore(int uid,int score);

    public LoginRet login(HttpServletResponse resp,int id,String email,String password);

    public User getById(int uid) ;

    public PageInfo<User> getPageInfo(int parentUid,int page,int perPage);

}
