package com.martin.service;

import com.github.pagehelper.PageInfo;
import com.martin.pojo.User;
import com.martin.pojo.dto.UserDto;
import com.martin.pojo.dto.UserListDto;

import java.util.List;

public interface UserService {
    PageInfo<User> queryAllUser(UserListDto userListDto);

    void add(UserDto user);

    void update(UserDto user);

    void delete(int id);

    void deleteUsers(List<Integer> ids);
}
