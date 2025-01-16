package com.martin.service;

import com.github.pagehelper.PageInfo;
import com.martin.pojo.User;
import com.martin.pojo.dto.UserListDto;

import java.util.List;

public interface UserService {
    PageInfo<User> queryAllUser(UserListDto userListDto);
}
