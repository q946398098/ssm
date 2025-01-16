package com.martin.dao;

import com.martin.pojo.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface UserMapper {

    @Select("select * from ssmbuild.USER")
    List<User> queryAllUser();
}
