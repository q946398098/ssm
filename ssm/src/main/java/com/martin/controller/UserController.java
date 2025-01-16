package com.martin.controller;


import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageInfo;
import com.martin.pojo.Result;
import com.martin.pojo.User;
import com.martin.pojo.dto.UserListDto;
import com.martin.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping
    public String index(){
        return "user/list";
    }

    @GetMapping("/list")
    @ResponseBody
    public String list(UserListDto userListDto){

        PageInfo<User> userPageInfo = userService.queryAllUser(userListDto);

        return JSON.toJSONString(Result.success(userPageInfo));
    }
}
