package com.generator.controller;

import com.generator.common.entity.Page;
import com.generator.common.utils.IDUtils;
import com.generator.entity.GenScheme;
import com.generator.entity.GenTable;
import com.generator.entity.User;
import com.generator.service.GenSchemeService;
import com.generator.service.GenTableService;
import com.generator.service.UserService;
import com.generator.usertest.entity.UserTest;
import com.generator.usertest.service.UserTestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * @author generator
 * @date 2018/1/16  16:43
 * */


@Controller
public class TestController {

    private static String SUCCESS = "success";

    @Autowired
    private GenSchemeService genSchemeService;
    @Autowired
    private UserService userService;
    @Autowired
    private GenTableService genTableService;
    @Autowired
    private UserTestService userTestService;

    @RequestMapping("/test")
    @ResponseBody
    public Object test(GenScheme genScheme) {
        Date date = new Date();
//        genScheme.setCreateTime(new Date());
//        genScheme.setUpdateTime(new Date());
//        genSchemeService.saveOrUpdate(genScheme);
//
//        userService.delete("05e16c15-6c7b-4f88-a94d-93ee4b0d044b", true);
//        UserTest userTest = new UserTest().setAge(1).setUserId(IDUtils.UUID())
//                .setUserName("aaaa");
//        userTest.setCreateTime(date);
//        userTest.setUpdateTime(date);
//        userTest.setValid(1);
//        userTestService.save(userTest);
//
//for (int i = 0; i < 100; i++) {
//            UserTest user = new UserTest();
//            user.setId(IDUtils.UUID());
//            user.setUserName("test" + i);
//            user.setAge(i);
//            user.setUpdateTime(date);
//            user.setCreateTime(date);
//            userTestService.save(user);
//        }
//
//        UserTest userTest = userTestService.get("00b2757fdf9a4a7ea996003168eb6cf8");
//        UserTest userTest = userTestService.get(new UserTest().setUserName("11"));
//        List<UserTest> list = userTestService.list(null);
//        List<UserTest> list = userTestService.list(new UserTest().setUserName("1"));
//        List list = userTestService.listPage(new Page().setPageNo(2));
//        Page page = new Page(new UserTest().setUserName("1"));
//        List<UserTest> userTests = userTestService.listPage(page);
//        page.setResult(userTests);

//        UserTest userTest = userTestService.get("00b2757fdf9a4a7ea996003168eb6cf8");
//        userTest.setUserName("ccc");
//        userTestService.update(userTest);
//
//        UserTest userTest = new UserTest().setUserId("00b2757fdf9a4a7ea996003168eb6cf8")
//                .setUserName("ddd").setAge(100);
//        userTestService.updateAll(userTest);
//
//        userTestService.delete("00b2757fdf9a4a7ea996003168eb6cf8", false);
//        userTestService.delete("1c904af02c2247819544d7113b373afb", true);
//        UserTest userTest = userTestService.getByName("test11");
        return SUCCESS;
    }

/*@RequestMapping("/usertest/save")
    @ResponseBody
    public String userTest(UserTest user) {
        Date date = new Date();
        for (int i = 0; i < 100; i++) {
            user.setId(IDUtils.UUID());
            user.setUserName("test" + i);
            user.setAge(i);
            user.setUpdateTime(date);
            user.setCreateTime(date);
            userTestService.save(user);
        }
        return SUCCESS;
    }*/


 @RequestMapping("/usertest/list")
    @ResponseBody
    public Object userTestList(Page page, UserTest user) {
        page.setCondition(user);
        List<UserTest> userList = userTestService.listPage(page);
        page.setResult(userList);
        return page;
    }


    @RequestMapping("/user/name")
    @ResponseBody
    public User getByName(String name) {
        User user = userService.getByName(name);
        return user;
    }

    @RequestMapping("/user")
    @ResponseBody
    public String user(User user) {
        for (int i = 0; i < 100; i++) {
            user.setId(UUID.randomUUID().toString());
            user.setName("test" + i);
            user.setAge(String.valueOf(i));
            userService.save(user);
        }
        return SUCCESS;
    }

    @RequestMapping("/user/list")
    @ResponseBody
    public Object user(Page page, User user) {
        page.setCondition(user);
        List<User> userList = userService.listPage(page);
        page.setResult(userList);
        return page;
    }

    @RequestMapping("/gentable")
    @ResponseBody
    public String gentable(GenTable genTable) {
        genTable.setId(UUID.randomUUID().toString().replaceAll("-", ""));
        genTableService.save(genTable);
        return SUCCESS;
    }

    @RequestMapping("/user/id")
    @ResponseBody
    public User user(String id) {
        User user = userService.get(id);
        return user;
    }
}
