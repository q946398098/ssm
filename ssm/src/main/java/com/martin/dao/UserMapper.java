package com.martin.dao;

import com.martin.pojo.User;
import com.martin.pojo.dto.UserDto;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface UserMapper {


    void add(UserDto user);

    @Select("select * from ssmbuild.USER")
    List<User> queryAllUser();

    void update(UserDto user);

    @Delete("Delete from ssmbuild.USER where cd_user = #{id}")
    void delete(int id);


    @Delete("DELETE FROM ssmbuild.USER WHERE cd_user IN (${ids})")
    void deleteBatch(@Param("ids") String ids);
}
