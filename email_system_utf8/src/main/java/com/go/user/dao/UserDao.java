package com.go.user.dao;

import com.go.user.bean.User;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 14-9-13
 * Time: 上午7:54
 * To change this template use File | Settings | File Templates.
 */
public interface UserDao {

    public void insert(User user);

    public void update(User user);

    public void updateScore(int uid,int score);

    public User selectById(int id);

    public int selectCountByType(int uType,int parentUid);

    public List<User> selectListByType (int uType,int parentUid,int startIndex,int limit);

}
