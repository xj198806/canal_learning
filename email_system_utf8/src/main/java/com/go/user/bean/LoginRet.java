package com.go.user.bean;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 14-9-13
 * Time: 上午10:02
 * To change this template use File | Settings | File Templates.
 */
public class LoginRet {
    private int code = 0;

    private String message = "";

    private User user = null;

    public LoginRet(int code, String message){
        this.code = code;
        this.message = message;
    }

    public LoginRet(int code, String message,User user){
        this.code = code;
        this.message = message;
        this.user = user;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
