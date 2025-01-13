package com.martin.dao;

import com.martin.pojo.Admin;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface AdminMapper {

    @Select("SELECT x.* FROM ssmbuild.admin x where x.username = #{username}")
    public Admin getByName(String username);
}
