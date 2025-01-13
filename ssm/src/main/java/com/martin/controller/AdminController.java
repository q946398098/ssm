package com.martin.controller;


import com.alibaba.fastjson.JSON;
import com.martin.pojo.Admin;
import com.martin.pojo.Result;
import com.martin.pojo.dto.AdminLoginDto;
import com.martin.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

@RequestMapping("/admin")
@Controller
public class AdminController {

    @Autowired
    private AdminService adminService;

    @GetMapping("/login")
    public String login(){
        return "admin/login";
    }

    @GetMapping
    public String index(){
        return "admin/index";
    }

    @PostMapping("/login")
    @ResponseBody
    public String doLogin(AdminLoginDto adminLoginDto, HttpServletResponse response){
        Admin admin =  adminService.getByName(adminLoginDto.getUsername());
        System.out.println(admin);
        if (admin != null && admin.getPassword().equals(adminLoginDto.getPassword())){
            Cookie cookie = new Cookie("username", adminLoginDto.getUsername());
            cookie.setMaxAge(3 * 24 * 60 * 60);
            cookie.setPath("/"); //设置Cookie的路径，一般设置为"/"，表示对整个应用有效
            response.addCookie(cookie);
            return JSON.toJSONString(Result.success());
        }else{
            return JSON.toJSONString(Result.error("用户名或密码错误"));
        }
    }

}
