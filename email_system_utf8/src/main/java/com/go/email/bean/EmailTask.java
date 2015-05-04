package com.go.email.bean;

import com.go.base.BaseBean;
import com.go.base.TaskLog;

import java.util.Date;

/**
 * Created with IntelliJ IDEA.
 * User: xujian
 * Date: 14-9-18
 * Time: 下午3:48
 * To change this template use File | Settings | File Templates.
 */
public class EmailTask extends BaseBean{

    private Integer id = 0;

    private String name = "";

    private String sendName = "";

    private String sendEmail = "";

    private String replyEmail = "";

    private String subject = "";

    private Integer uid = 0;

    private Integer gid = 0;

    private String groupIds = "";

    private Integer tplId = 0;

    private Date sendDate = null;

    private String sendDateStr = "";

    private Integer status = 0;

    private Integer total = 0;

    private TaskLog taskLog = null;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSendName() {
        return sendName;
    }

    public void setSendName(String sendName) {
        this.sendName = sendName;
    }

    public String getSendEmail() {
        return sendEmail;
    }

    public void setSendEmail(String sendEmail) {
        this.sendEmail = sendEmail;
    }

    public String getReplyEmail() {
        return replyEmail;
    }

    public void setReplyEmail(String replyEmail) {
        this.replyEmail = replyEmail;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getGid() {
        return gid;
    }

    public void setGid(Integer gid) {
        this.gid = gid;
    }

    public String getGroupIds() {
        return groupIds;
    }

    public void setGroupIds(String groupIds) {
        this.groupIds = groupIds;
    }

    public Integer getTplId() {
        return tplId;
    }

    public void setTplId(Integer tplId) {
        this.tplId = tplId;
    }

    public Date getSendDate() {
        return sendDate;
    }

    public void setSendDate(Date sendDate) {
        this.sendDate = sendDate;
    }

    public String getSendDateStr() {
        return sendDateStr;
    }

    public void setSendDateStr(String sendDateStr) {
        this.sendDateStr = sendDateStr;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getTotal() {
        return total;
    }

    public void setTotal(Integer total){
        this.total = total;
    }

    public TaskLog getTaskLog() {
        return taskLog;
    }

    public void setTaskLog(TaskLog taskLog) {
        this.taskLog = taskLog;
    }
}
