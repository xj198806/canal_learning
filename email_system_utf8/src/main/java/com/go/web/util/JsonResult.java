package com.go.web.util;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 14-9-13
 * Time: 上午8:53
 * To change this template use File | Settings | File Templates.
 */
public class JsonResult {

    private int code = 0;

    private boolean success = true;

    private Object data = null;

    public JsonResult(int code){
        this.code = code;
    }

    public JsonResult(boolean success){
        this.success = success;
    }

    public JsonResult(int code,boolean success,Object data){
        this.code = code;
        this.success = success;
        this.data = data;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public boolean isSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }
}
