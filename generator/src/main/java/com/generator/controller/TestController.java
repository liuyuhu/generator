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
 */
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
    public String test(GenScheme genScheme) {
        genScheme.setCreateTime(new Date());
        genScheme.setUpdateTime(new Date());
        genSchemeService.saveOrUpdate(genScheme);
        return "redirect:/admin/gen/genScheme/?repage";
    }

    @RequestMapping("/usertest/save")
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
    }

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
