package com.example.demo.controller;



import com.example.demo.entity.User;
import com.example.demo.entity.user1;
import com.example.demo.mapper.UserMapper;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;
import org.apache.poi.hssf.usermodel.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import java.io.IOException;

import java.util.List;




@Controller
public class controller {

    @Resource
    UserMapper userMapper;
    @RequestMapping("/con")
    public String index(Model m){
        List<User> users = userMapper.findAll();
        m.addAttribute("user",users);
        return "User";
    }
    @ApiOperation(value = "查询数据库")
    @ApiResponses({@ApiResponse(code = 200, message = "OK", response = String.class)})
    @GetMapping("/con1")
    public String index1(Model model){
        List<user1> list = userMapper.findall1();
        System.out.println("成功");
        model.addAttribute("user",list);
        return "01";
    }

    @RequestMapping("/con3")

    public String succcess(@RequestParam(value = "page",defaultValue = "1")
                                       int page, ModelMap mod){

        PageHelper.startPage(page,5);
        List<user1> user1List = userMapper.selectByBookId();
        PageInfo<user1> pages = new PageInfo(user1List, 5);
        mod.addAttribute("user",user1List);
        mod.addAttribute("PageInfo",pages);
        return "01";
    }
    @RequestMapping("/con4")
    public String hello(HttpServletRequest request,ModelMap model,@RequestParam(value = "page",defaultValue = "1")
            int page){
        String name = request.getParameter("name");
        PageHelper.startPage(page,20);
        List<user1> all3 = userMapper.findAll3(name);
        PageInfo<user1> pages = new PageInfo(all3,20);
        model.addAttribute("user",all3);
        model.addAttribute("PageInfo",pages);
        System.out.println(name);
        return "01";
    }
    @RequestMapping("/con5")
    public String hello1(Model model){
        return "02";
    }
    String code;
    String date1;
    String date2;
    @GetMapping("/con7")
    public String hello4(HttpServletRequest request,ModelMap model,@RequestParam(value = "page",defaultValue = "1")
            int page){
        code = request.getParameter("code");
        date1 = request.getParameter("date1");
        date2 = request.getParameter("date2");
        PageHelper.startPage(page,10);
        List<user1> all3 = userMapper.findAll4(code,date1,date2);
        PageInfo<user1> pages = new PageInfo(all3,5);
        model.addAttribute("user",all3);
        model.addAttribute("PageInfo",pages);
        System.out.println(code+date1+date2);
        return "03";
    }

    @RequestMapping("/con8")
    public void download(HttpServletResponse response) throws IOException {
        //创建HSSFWorkbook对象，excel的文档对象
        HSSFWorkbook workbook = new HSSFWorkbook();
        //excel表单
        HSSFSheet sheet = workbook.createSheet("信息表");
        List<user1> classmateList = userMapper.findAll4(code, date1, date2);
        //设置要导出的文件的名字
        String fileName = "userinf" + ".xls";
        //新增数据行，并设置单元格数据
        int rowNum = 1;
        //设置表头
        String[] headers = {"编号","日期","体验人次","查看人次","分享人次","打印","雕刻","点赞"};

        HSSFRow row = sheet.createRow(0);
        //在excel中添加表头
        for (int i = 0;i<headers.length;i++){
            HSSFCell cell = row.createCell(i);
            HSSFRichTextString text = new HSSFRichTextString(headers[i]);
            cell.setCellValue(text);
        }
        for (user1 user: classmateList){
            HSSFRow row1 = sheet.createRow(rowNum);
            row1.createCell(0).setCellValue(user.getId());
            row1.createCell(1).setCellValue(user.getData());
            row1.createCell(2).setCellValue(user.getExperiencepeople());
            row1.createCell(3).setCellValue(user.getLookatpeople());
            row1.createCell(4).setCellValue(user.getSharem());
            row1.createCell(5).setCellValue(user.getPrintm());
            row1.createCell(6).setCellValue(user.getCarvingm());
            row1.createCell(7).setCellValue(user.getPraise());
            rowNum++;
        }
        response.setContentType("DemoApplication/octet-stream");
        response.setHeader("Content-disposition","attachment;filename="+fileName);
        //抛出异常
        response.flushBuffer();
        workbook.write(response.getOutputStream());
    }
    @GetMapping("/con9")
    public String add1(HttpServletRequest request){
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String age = request.getParameter("age");
        String sex = request.getParameter("sex");
        String phone = request.getParameter("phone");
        userMapper.update1(id,name,address,age,sex,phone);
        return "04";
    }
}
