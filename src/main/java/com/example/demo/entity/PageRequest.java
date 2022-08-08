package com.example.demo.entity;

import lombok.Data;

@Data
public class PageRequest {
    //当前页码
    private int pageNum;
    //每页数量
    private int pageSize;
    //记录数量
    private int totalSize;
    //页码总数
    private int totalPages;
}
