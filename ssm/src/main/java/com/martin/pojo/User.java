package com.martin.pojo;

import com.alibaba.fastjson.annotation.JSONField;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;

@Data
public class User {

    private int cdUser;

    private String dsUsername;

    private String dsEmail;

    private String dsSex;

    private double nrMoney;

    private String dsIp;

    private int nrCheckin;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date dtRecord;

    private String dsPassword;


}
