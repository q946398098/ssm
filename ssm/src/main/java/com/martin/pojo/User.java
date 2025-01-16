package com.martin.pojo;

import com.alibaba.fastjson.annotation.JSONField;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;

@Data
public class User {

    @JSONField(name="cd_user")
    private int cdUser;
    @JSONField(name="ds_username")
    private String dsUsername;
    @JSONField(name="ds_email")
    private String dsEmail;
    @JSONField(name="ds_sex")
    private String dsSex;
    @JSONField(name="nr_money")
    private double nrMoney;
    @JSONField(name="ds_ip")
    private String dsIp;
    @JSONField(name="nr_checkin")
    private int nrCheckin;
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    @JSONField(name="dt_record")
    private Date dtRecord;
    @JSONField(name="ds_password")
    private String dsPassword;


}
