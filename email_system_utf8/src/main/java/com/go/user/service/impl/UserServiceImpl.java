package com.go.user.service.impl;

import com.go.email.bean.UserConfigGroupMapping;
import com.go.email.service.UserGroupMappingService;
import com.go.user.bean.LoginRet;
import com.go.user.bean.User;
import com.go.user.dao.UserDao;
import com.go.user.service.UserService;
import com.go.util.PageInfo;
import com.go.web.util.GeneralUtil;
import org.apache.commons.lang.StringUtils;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 14-9-13
 * Time: 上午8:09
 * To change this template use File | Settings | File Templates.
 */
public class UserServiceImpl implements UserService{

    public void register(User user){
        userDao.insert(user);
    }

    public void update(User user){
        userDao.update(user);
    }

    public void updateScore(int uid,int score){
        userDao.updateScore(uid,score);
    }

    public User getById(int uid){
        return userDao.selectById(uid);
    }

    public LoginRet login(HttpServletResponse resp,int id,String username,String password){
        User user = userDao.selectById(id);
        if (user == null) return new LoginRet(100,"用户ID不存在");

        if ( !user.getUsername().equals(username)) {
            return new LoginRet(101,"用户名错误");
        }

        if ( !user.getPassword().equals(password)) {
            return new LoginRet(102,"密码错误");
        }

        if (user.getStatus() == 1)
            return  new LoginRet(103,"账号被禁用");

        GeneralUtil.addCookie(resp,"uid",user.getUid().toString(),3600);
        return new LoginRet(0,"登陆成功");

    }

    public PageInfo<User> getPageInfo(int parentUid,int page,int perPage){
        PageInfo pageInfo = new PageInfo(page,perPage);
        pageInfo.setCount(userDao.selectCountByType(0,parentUid));

        if (pageInfo.getCount() > 0){
            List<User> users = userDao.selectListByType(0, parentUid, pageInfo.getStartIndex(), perPage);
            for(User user : users ){
                user.setGroupIds(StringUtils.join(userGroupMappingService.getUserGroupsByUid(user.getUid()),","));
            }
            pageInfo.setItems(users);
        }
        return pageInfo;
    }

    private UserDao userDao = null;

    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

    private UserGroupMappingService userGroupMappingService = null;

    public void setUserGroupMappingService(UserGroupMappingService userGroupMappingService) {
        this.userGroupMappingService = userGroupMappingService;
    }
}
