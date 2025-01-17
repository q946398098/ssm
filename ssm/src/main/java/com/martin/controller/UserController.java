package com.martin.controller;


import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageInfo;
import com.martin.pojo.Result;
import com.martin.pojo.User;
import com.martin.pojo.dto.UserDto;
import com.martin.pojo.dto.UserListDto;
import com.martin.service.UserService;
import com.martin.util.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

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


    @PostMapping
    @ResponseBody
    public String add(@RequestBody UserDto user){
        user.setDs_password(MD5Util.md5("123456"));
        userService.add(user);
        return JSON.toJSONString(Result.success());
    }


    @PutMapping
    @ResponseBody
    public String update(@RequestBody UserDto user){
        userService.update(user);
        return JSON.toJSONString(Result.success());
    }


    @DeleteMapping("/{id}")
    @ResponseBody
    public String delete(@PathVariable("id") int id){
        userService.delete(id);
        return JSON.toJSONString(Result.success());
    }

    @DeleteMapping("/deleteBatch")
    @ResponseBody
    public String deleteBatch(@RequestParam List<Integer> ids){

        userService.deleteUsers(ids);
        return JSON.toJSONString(Result.success());
    }

}
