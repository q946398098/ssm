package com.martin.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.martin.dao.UserMapper;
import com.martin.pojo.User;
import com.martin.pojo.dto.UserListDto;
import com.martin.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;
    public PageInfo<User> queryAllUser(UserListDto userListDto){
        PageHelper.startPage(userListDto.getPageNum(), userListDto.getPageSize());
        List<User> userList =  userMapper.queryAllUser();
        PageInfo<User> pageInfo = new PageInfo<>(userList);
        return pageInfo;
    }
}
