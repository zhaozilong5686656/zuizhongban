package com.example.demo.controller;


import com.example.demo.entity.user1;
import com.example.demo.mapper.UserMapper;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping("/Test")
public class UserController1 {
    @Resource
    UserMapper userMapper;

    @GetMapping("/hhh")
    public List<user1> getfind1(){
        return userMapper.findall1();
    }
    @RequestMapping("/con2")
    public List<user1> index2(){
        List<user1> all = userMapper.findall2();
        System.out.println("成功");
        return all;
    }
}
