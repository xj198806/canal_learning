package com.go.email.bean;

import com.go.base.BaseBean;

/**
 * Created with IntelliJ IDEA.
 * User: xujian
 * Date: 14-10-14
 * Time: 下午2:05
 * To change this template use File | Settings | File Templates.
 */
public class EmailConfig extends BaseBean{

    private Integer id = 0;

    private Integer uid = 0;

    private String username = "";

    private String password = "";

    private String host = "";

    private Integer port = 465;

    private Integer conn = 0;

    private Integer ssl = 0;

    private Integer auth = 0;

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

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getHost() {
        return host;
    }

    public void setHost(String host) {
        this.host = host;
    }

    public Integer getPort() {
        return port;
    }

    public void setPort(Integer port) {
        this.port = port;
    }

    public Integer getConn() {
        return conn;
    }

    public void setConn(Integer conn) {
        this.conn = conn;
    }

    public Integer getSsl() {
        return ssl;
    }

    public void setSsl(Integer ssl) {
        this.ssl = ssl;
    }

    public Integer getAuth() {
        return auth;
    }

    public void setAuth(Integer auth) {
        this.auth = auth;
    }
}
