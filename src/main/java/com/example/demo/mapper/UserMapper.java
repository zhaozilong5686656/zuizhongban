package com.example.demo.mapper;

import com.example.demo.entity.User;

import com.example.demo.entity.user1;


import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Mapper
public interface UserMapper {

    @Select("select * from [user]")
    List<User> findAll();
    @Select("select * from [Calligraphy_Datatable]")
    List<user1> findall1();
    //分页查询
    @Select("SELECT * FROM Calligraphy_Datatable WHERE id IN (0,1,2)")
    List<user1> findall2();
    //
    @Select("select * from [Calligraphy_Datatable]")
    List<user1> selectByBookId();
    @Select("select * from Calligraphy_Datatable where code = #{code}")
    List<user1> findAll3(String code);
    @Select("select * from Calligraphy_Datatable where code = #{code} and data >= #{date1} and data <= #{date2}")
    List<user1> findAll4(String code,String date1,String date2);
    @Update("INSERT INTO [user](id,name,address,age,sex,phone) VALUES (#{id},#{name},#{address},#{age},#{sex},#{phone})")
    @Transactional
    void update1(String id,String name,String address,String age,String sex,String phone);
}
